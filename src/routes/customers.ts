import express, { Request, Response } from "express";
import { Customer } from "../controllers";
import { ICustomer, isCustomerModelValid } from "../models/Customer";
import { Filterable } from "sequelize/types";
import { sendBadRequest, checkIfExists, sendInvalidModel, sendNotFound } from ".";
import customerRepository from "../repositories/customerRepository";
import categoryRepository from "../repositories/categoryRepository";

export const customerRouter = express.Router();

customerRouter.get("/", async (req: Request, res: Response) => {
    try {
        const customers = await customerRepository.listAll();
        res.send(customers);
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});

customerRouter.get("/:id", async (req: Request, res: Response) => {
    const { id } = req.params;
    try {
        const customer = await customerRepository.findById(id);
        checkIfExists(customer, res);
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});

customerRouter.get("/email/:email", async (req: Request, res: Response) => {
    const { email } = req.params;
    try {
        const customer = await customerRepository.finbByEmail(email);
        checkIfExists(customer, res);
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});

customerRouter.post("/", async (req: Request, res: Response) => {
    try {
        const customer: ICustomer = req.body;
        if (isCustomerModelValid(customer)) {
            const result = await customerRepository.createCustomer(customer);
            if (result) res.send(result);
            else sendBadRequest(res, "There was an error trying to create the customer");
        } else {
            sendInvalidModel(res);
        }
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});
customerRouter.put("/:id", async (req: Request, res: Response) => {
    try {
        let customer: ICustomer = req.body;
        if (isCustomerModelValid(customer)) {
            const { id } = req.params;
            customer.id = id;
            const result = await customerRepository.update(customer, id);
            if (result) res.send({ ...customer });
            else {
                const existing = await customerRepository.findById(id);
                return existing ? sendBadRequest(res, "Creation invalid") : sendNotFound(res);
            }
        } else {
            sendInvalidModel(res);
        }
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});

customerRouter.delete("/:id", async (req: Request, res: Response) => {
    try {
        const { id } = req.params;
        const customer = await customerRepository.delete(id);
        checkIfExists(customer, res);
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});
