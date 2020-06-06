import express, { Request, Response } from "express";
import { ProductCategory } from "../controllers";
import { IProductCategory, productCategoryIsValid } from "../models/ProductCategory";

export const productCategoryRouter = express.Router();

productCategoryRouter.get("/", async (req: Request, res: Response) => {
    try {
        const productCategories = await ProductCategory.findAll();
        res.send(productCategories);
    } catch (e) {
        console.log("ERROR: ", e.message);
        res.status(400).send(e.message);
    }
});

productCategoryRouter.get("/:id", async (req: Request, res: Response) => {
    try {
        const { id } = req.params;
        const productCategory = await ProductCategory.findOne({ where: { id } });
        if (productCategory) res.send(productCategory);
        else res.status(404).send("NOT FOUND");
    } catch (e) {
        console.log("ERROR: ", e.message);
        res.status(400).send(e.message);
    }
});

productCategoryRouter.post("/", async (req: Request, res: Response) => {
    try {
        const productCategory: IProductCategory = req.body;
        if (productCategoryIsValid(productCategory)) {
            const result = await ProductCategory.create(productCategory);
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
productCategoryRouter.put("/:id", async (req: Request, res: Response) => {
    try {
        let productCategory: IProductCategory = req.body;
        if (productCategoryIsValid(productCategory)) {
            const { id } = req.params;
            productCategory.id = id;
            const result = await ProductCategory.update(productCategory, { where: { id } });
            if (result) res.send({ ...productCategory, id });
            else {
                const existing = await ProductCategory.findOne({ where: { id } });
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

productCategoryRouter.delete("/:id", async (req: Request, res: Response) => {
    try {
        const { id } = req.params;
        const productCategory = await ProductCategory.findOne({ where: { id } });
        if (productCategory) {
            await productCategory.destroy();
            res.send(productCategory);
        } else {
            res.status(400).send("NOT FOUND");
        }
    } catch (e) {
        console.log("ERROR: ", e.message);
        res.status(400).send(e.message);
    }
});
