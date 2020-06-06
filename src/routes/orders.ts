import express, { Request, Response } from "express";
import { Order, Customer, OrderItem } from "../controllers";
import { isOrderModelValid, IOrder } from "../models/Order";

export const orderRouter = express.Router();

orderRouter.get("/", async (req: Request, res: Response) => {
    try {
        const orders = await Order.findAll({ include: [{ model: Customer, as: "customer" }] });
        res.send(orders);
    } catch (e) {
        console.log("ERROR: ", e.message);
        res.status(500).send(e.message);
    }
});

orderRouter.get("/:id", async (req: Request, res: Response) => {
    try {
        const { id } = req.params;
        const order = await Order.findOne({
            where: { id },
            include: [
                { model: Customer, as: "customer" },
                { model: OrderItem, as: "items" },
            ],
        });
        if (order) res.send(order);
        else res.status(404).send("NOT FOUND");
    } catch (e) {
        console.log("ERROR: ", e.message);
        res.status(500).send(e.message);
    }
});

orderRouter.post("/", async (req: Request, res: Response) => {
    try {
        const order: IOrder = req.body;
        if (isOrderModelValid(order)) {
            const result = await Order.create(order);
            if (result) res.send(result);
            else res.status(400).send("Creation invalid");
        } else {
            res.status(400).send("The model format is not valid");
        }
    } catch (e) {
        console.log("ERROR: ", e.message);
        res.status(500).send(e.message);
    }
});
orderRouter.put("/:id", async (req: Request, res: Response) => {
    try {
        let order: IOrder = req.body;
        if (isOrderModelValid(order)) {
            const { id } = req.params;
            order.id = id;
            const result = await Order.update(order, { where: { id } });
            if (result) res.send({ id, ...order });
            else {
                const existing = await Order.findOne({ where: { id } });
                if (!existing) {
                    res.status(404).send("not found");
                } else res.status(400).send("Creation invalid");
            }
        } else {
            res.status(400).send("The model format is not valid");
        }
    } catch (e) {
        console.log("ERROR: ", e.message);
        res.status(500).send(e.message);
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
            res.status(400).send("NOT FOUND");
        }
    } catch (e) {
        console.log("ERROR: ", e.message);
        res.status(500).send(e.message);
    }
});
