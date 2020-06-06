import express, { Request, Response } from "express";
import { Category } from "../controllers";
import { categoryIsValid, ICategory } from "../models/Category";
import categoryRepository from "../repositories/categoryRepository";
import { sendBadRequest, checkIfExists, sendInvalidModel, sendNotFound } from ".";

export const categoryRouter = express.Router();

categoryRouter.get("/", async (req: Request, res: Response) => {
    try {
        const categories = await categoryRepository.listAll();
        res.send(categories);
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});

categoryRouter.get("/:id", async (req: Request, res: Response) => {
    try {
        const { id } = req.params;
        const category = await categoryRepository.findById(id);
        checkIfExists(category, res);
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});

categoryRouter.post("/", async (req: Request, res: Response) => {
    try {
        const category: ICategory = req.body;
        if (categoryIsValid(category)) {
            const result = await categoryRepository.createCategory(category);
            if (result) res.send(result);
            else sendBadRequest(res, "There was an error trying to create the category");
        } else {
            sendInvalidModel(res);
        }
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});
categoryRouter.put("/:id", async (req: Request, res: Response) => {
    try {
        let category: ICategory = req.body;
        if (categoryIsValid(category)) {
            const { id } = req.params;
            category.id = id;
            const result = await categoryRepository.update(category, id);
            if (result) res.send(category);
            else {
                const existing = await categoryRepository.findById(id);
                return existing ? sendBadRequest(res, "Creation invalid") : sendNotFound(res);
            }
        } else {
            sendInvalidModel(res);
        }
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});

categoryRouter.delete("/:id", async (req: Request, res: Response) => {
    try {
        const { id } = req.params;
        const category = await categoryRepository.delete(id);
        checkIfExists(category, res);
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});
