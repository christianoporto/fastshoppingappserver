import express, { Request, Response } from "express";
import { Order, Customer, OrderItem,  Product } from "../controllers";
import { isOrderModelValid, IOrder } from "../models/Order";
import { IOrderItem } from "../models/OrderItem";
import { createAllOrderAsync } from "../business/orders/OrderCreation";
import { checkIfExists, sendBadRequest, sendInvalidModel, sendNotFound } from ".";

export const orderRouter = express.Router();

orderRouter.get("/", async (req: Request, res: Response) => {
    try {
        const orders = await Order.findAll({ include: [{ model: Customer, as: "customer" }] });
        res.send(orders);
    } catch (e) {
        console.log("ERROR: ", e.message);
        res.status(400).send(e.message);
    }
});
const filterFindOneWithAll = (id: string) => {
    return {
        where: { id },
        include: [
            { model: Customer, as: "customer" },
            {
                model: OrderItem,
                as: "items",
                include: [{ model: Product, as: "product" }],
            },
        ],
    };
};
orderRouter.get("/:id", async (req: Request, res: Response) => {
    try {
        const { id } = req.params;
        const order = await Order.findOne(filterFindOneWithAll(id));
        return checkIfExists(order, res);
    } catch (e) {
        sendBadRequest(e, res);
    }
});

orderRouter.post("/", async (req: Request, res: Response) => {
    try {
        let order: IOrder = req.body;
        if (isOrderModelValid(order)) {
            const result = await createAllOrderAsync(order);
            if (result) res.send(result);
            else res.status(400).send("Creation invalid");
        } else {
            sendInvalidModel(res);
        }
    } catch (e) {
        sendBadRequest(e, res);
    }
});
orderRouter.put("/:id", async (req: Request, res: Response) => {
    try {
        let order: IOrder = req.body;
        if (isOrderModelValid(order)) {
            const { id } = req.params;
            order.id = id;
            const result = await Order.update(order, { where: { id } });
            if (result) res.send(order);
            else {
                const existing = await Order.findOne({ where: { id } });
                if (!existing) {
                    res.status(404).send("not found");
                } else res.status(400).send("Creation invalid");
            }
        } else {
            sendInvalidModel(res);
        }
    } catch (e) {
        sendBadRequest(e, res);
    }
});

orderRouter.delete("/:id", async (req: Request, res: Response) => {
    try {
        const { id } = req.params;
        const order = await Order.findOne({ where: { id } });
        if (order) {
            await order.destroy();
            res.send(order);
        } else {
            sendNotFound(res);
        }
    } catch (e) {
        sendBadRequest(e, res);
    }
});
