import express, { Request, Response } from "express";
import { Customer } from "../controllers";
import { ICustomer, isCustomerModelValid } from "../models/Customer";
import { Filterable } from "sequelize/types";

export const customerRouter = express.Router();

customerRouter.get("/", async (req: Request, res: Response) => {
    try {
        const customers = await Customer.findAll();
        res.send(customers);
    } catch (e) {
        console.log("ERROR: ", e.message);
        res.status(400).send(e.message);
    }
});

const getByFilter = async (res: Response, filter: Filterable["where"]) => {
    try {
        const customer = await Customer.findOne({ where: filter });
        if (customer) res.send(customer);
        else res.status(404).send("NOT FOUND");
    } catch (e) {
        console.log("ERROR: ", e.message);
        res.status(400).send(e.message);
    }
};
customerRouter.get("/:id", async (req: Request, res: Response) => {
    const { id } = req.params;
    getByFilter(res, { id });
});

customerRouter.get("/email/:email", async (req: Request, res: Response) => {
    const { email } = req.params;
    getByFilter(res, { email });
});

customerRouter.post("/", async (req: Request, res: Response) => {
    try {
        const customer: ICustomer = req.body;
        if (isCustomerModelValid(customer)) {
            const result = await Customer.create(customer);
            if (result) res.send(result);
            else res.status(400).send("Creation invalid");
        } else {
            res.status(400).send("The model format is not valid");
        }
    } catch (e) {
        console.log("ERROR: ", e.message);
        res.status(400).send(e.message);
    }
});
customerRouter.put("/:id", async (req: Request, res: Response) => {
    try {
        let customer: ICustomer = req.body;
        if (isCustomerModelValid(customer)) {
            const { id } = req.params;
            customer.id = id;
            const result = await Customer.update(customer, { where: { id } });
            if (result) res.send({ ...customer, id });
            else {
                const existing = await Customer.findOne({ where: { id } });
                if (!existing) {
                    res.status(404).send("not found");
                } else res.status(400).send("Creation invalid");
            }
        } else {
            res.status(400).send("The model format is not valid");
        }
    } catch (e) {
        console.log("ERROR: ", e.message);
        res.status(400).send(e.message);
    }
});

customerRouter.delete("/:id", async (req: Request, res: Response) => {
    try {
        const { id } = req.params;
        const customer = await Customer.findOne({ where: { id } });
        if (customer) {
            await customer.destroy();
            res.send(customer);
        } else {
            res.status(400).send("NOT FOUND");
        }
    } catch (e) {
        console.log("ERROR: ", e.message);
        res.status(400).send(e.message);
    }
});
