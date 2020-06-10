import express, { Request, Response } from "express";
import { isOrderModelValid, IOrder } from "../models/Order";
import { checkIfExists, sendBadRequest, sendInvalidModel, sendNotFound } from ".";
import orderRepository from "../repositories/orderRepository";
import { IPaginationRequest } from "../models/helpers/Pagination";

export const orderRouter = express.Router();

orderRouter.get("/", async (req: Request, res: Response) => {
    try {
        const orders = await orderRepository.listAll();
        res.send(orders);
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});
orderRouter.get("/:id", async (req: Request, res: Response) => {
    try {
        const { id } = req.params;
        const order = await orderRepository.findById(id);
        return checkIfExists(order, res);
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});

orderRouter.post("/", async (req: Request, res: Response) => {
    try {
        let order: IOrder = req.body;
        if (isOrderModelValid(order)) {
            let result = await orderRepository.createAllOrder(order);
            if (result) {
                if (!result.customer && result.id) {
                    result = await orderRepository.findById(result.id);
                }
                res.send(result);
            } else sendBadRequest(res, "Creation invalid");
        } else {
            sendInvalidModel(res);
        }
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});
orderRouter.put("/:id", async (req: Request, res: Response) => {
    try {
        let order: IOrder = req.body;
        if (isOrderModelValid(order)) {
            const { id } = req.params;
            order.id = id;
            const result = await orderRepository.update(order, id);
            if (result) res.send(order);
            else {
                const existing = await orderRepository.findById(id);
                return existing ? sendBadRequest(res, "Creation invalid") : sendNotFound(res);
            }
        } else {
            sendInvalidModel(res);
        }
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});

orderRouter.delete("/:id", async (req: Request, res: Response) => {
    try {
        const { id } = req.params;
        const order = await orderRepository.delete(id);
        checkIfExists(order, res);
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});
