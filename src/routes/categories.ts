import express, { Request, Response } from "express";
import { Category } from "../controllers";
import { categoryIsValid, ICategory } from "../models/Category";

export const categoryRouter = express.Router();

categoryRouter.get("/", async (req: Request, res: Response) => {
    try {
        const categories = await Category.findAll();
        res.send(categories);
    } catch (e) {
        console.log("ERROR: ", e.message);
        res.status(400).send(e.message);
    }
});

categoryRouter.get("/:id", async (req: Request, res: Response) => {
    try {
        const { id } = req.params;
        const category = await Category.findOne({ where: { id } });
        if (category) res.send(category);
        else res.status(404).send("NOT FOUND");
    } catch (e) {
        console.log("ERROR: ", e.message);
        res.status(400).send(e.message);
    }
});

categoryRouter.post("/", async (req: Request, res: Response) => {
    try {
        const category: ICategory = req.body;
        if (categoryIsValid(category)) {
            const result = await Category.create(category);
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
categoryRouter.put("/:id", async (req: Request, res: Response) => {
    try {
        let category: ICategory = req.body;
        if (categoryIsValid(category)) {
            const { id } = req.params;
            category.id = id;
            const result = await Category.update(category, { where: { id } });
            if (result) res.send({ id, ...category });
            else {
                const existing = await Category.findOne({ where: { id } });
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

categoryRouter.delete("/:id", async (req: Request, res: Response) => {
    try {
        const { id } = req.params;
        const category = await Category.findOne({ where: { id } });
        if (category) {
            await category.destroy();
            res.send(category);
        } else {
            res.status(400).send("NOT FOUND");
        }
    } catch (e) {
        console.log("ERROR: ", e.message);
        res.status(400).send(e.message);
    }
});
