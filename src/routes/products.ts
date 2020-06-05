import express, { Request, Response, response } from "express";
import { Product } from "../controllers";
import { IProduct, isModelValid } from "../models/Product";

export const productRouter = express.Router();

productRouter.get("/", async (req: Request, res: Response) => {
    try {
        const products = await Product.findAll();
        res.send(products);
    } catch (e) {
        console.log("ERROR: ", e.message);
        res.status(500).send(e.message);
    }
});
productRouter.get("/:id", async (req: Request, res: Response) => {
    const { id } = req.params;
    try {
        const result = await Product.findOne({ where: { id } });
        if (result) res.send(result);
        else res.status(404).send("Product not found");
    } catch (e) {
        console.log("ERROR: ", e.message);
        res.status(500).send(e.message);
    }
});
productRouter.post("/", async (req: Request, res: Response) => {
    try {
        const product: IProduct = req.body;
        if (isModelValid(product)) {
            const result = await Product.create(product);
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
productRouter.put("/:id", async (req: Request, res: Response) => {
    try {
        let product: IProduct = req.body;
        if (isModelValid(product)) {
            const { id } = req.params;
            product.id = id;
            const result = await Product.update(product, { where: { id } });
            if (result) res.send({ id, ...product });
            else {
                const existing = await Product.findOne({ where: { id } });
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

productRouter.delete("/:id", async (req: Request, res: Response) => {
    try {
        const { id } = req.params;
        const product = await Product.findOne({ where: { id } });
        if (product) {
            await product.destroy();
            res.send(product);
        } else {
            res.status(400).send("NOT FOUND");
        }
    } catch (e) {
        console.log("ERROR: ", e.message);
        res.status(500).send(e.message);
    }
});
