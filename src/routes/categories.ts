import express, { Request, Response } from "express";
import { Category } from "../controllers";

export const categoryRouter = express.Router();

categoryRouter.get("/", async (req: Request, res: Response) => {
    try {
        const categories = await Category.findAll();
        res.send(categories);
    } catch (e) {
        console.log("ERROR: ", e.message);
        res.status(500).send(e.message);
    }
});
