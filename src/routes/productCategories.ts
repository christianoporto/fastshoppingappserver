import express, { Request, Response } from "express";
import { IProductCategory, productCategoryIsValid } from "../models/ProductCategory";
import productCategoryRepository from "../repositories/productCategoryRepository";
import { sendBadRequest, checkIfExists, sendInvalidModel, sendNotFound } from ".";

export const productCategoryRouter = express.Router();

productCategoryRouter.get("/", async (req: Request, res: Response) => {
    try {
        const productCategories = await productCategoryRepository.listAll();
        res.send(productCategories);
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});

productCategoryRouter.get("/:id", async (req: Request, res: Response) => {
    try {
        const { id } = req.params;
        const productCategory = await productCategoryRepository.findById(id);
        checkIfExists(productCategory, res);
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});

productCategoryRouter.post("/", async (req: Request, res: Response) => {
    try {
        const productCategory: IProductCategory = req.body;
        if (productCategoryIsValid(productCategory)) {
            const result = await productCategoryRepository.createCategory(productCategory);
            if (result) res.send(result);
            else sendBadRequest(res, "Creation invalid");
        } else {
            sendInvalidModel(res);
        }
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});
productCategoryRouter.put("/:id", async (req: Request, res: Response) => {
    try {
        let productCategory: IProductCategory = req.body;
        if (productCategoryIsValid(productCategory)) {
            const { id } = req.params;
            productCategory.id = id;
            const result = await productCategoryRepository.update(productCategory, id);
            if (result) res.send(productCategory);
            else {
                const existing = await productCategoryRepository.findById(id);
                return existing ? sendBadRequest(res, "Creation invalid") : sendNotFound(res);
            }
        } else {
            sendInvalidModel(res);
        }
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});

productCategoryRouter.delete("/:id", async (req: Request, res: Response) => {
    try {
        const { id } = req.params;
        const productCategory = await productCategoryRepository.delete(id);
        checkIfExists(productCategory, res);
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});
