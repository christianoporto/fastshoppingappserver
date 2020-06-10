import express, { Request, Response } from "express";
import { IProduct, isProductModelValid } from "../models/Product";
import productRepository from "../repositories/productRepository";
import { sendBadRequest, checkIfExists, sendInvalidModel, sendNotFound } from ".";
import { IPaginationRequest } from "../models/helpers/Pagination";
import { isPaginationRequestValid } from "../utils";

export const productRouter = express.Router();

productRouter.get("/", async (req: Request, res: Response) => {
    try {
        const products = await productRepository.listAll();
        res.send(products);
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});
productRouter.post("/pages", async (req: Request, res: Response) => {
    try {
        let pagReq: IPaginationRequest = req.body;
        console.log("PAGINATION: ", req.body);
        if (isPaginationRequestValid(pagReq)) {
            const paginationResponse = await productRepository.listInPages(pagReq);
            if (paginationResponse.exception !== "overflow") {
                res.send(paginationResponse.pagination);
            } else {
                sendBadRequest(res, "The request exceeds the element limit");
            }
        } else return sendInvalidModel(res);
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});
productRouter.get("/:id", async (req: Request, res: Response) => {
    const { id } = req.params;
    try {
        const result = await productRepository.findById(id);
        checkIfExists(result, res);
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});
productRouter.post("/", async (req: Request, res: Response) => {
    try {
        let product: IProduct = req.body;
        if (isProductModelValid(product)) {
            product.dateCreated = new Date();
            const result = await productRepository.createProduct(product);
            if (result) res.send(result);
            else sendBadRequest(res, "There was an error trying to create the product");
        } else {
            sendInvalidModel(res);
        }
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});
productRouter.post("/createlist", async (req: Request, res: Response) => {
    try {
        let products: IProduct[] = req.body;
        const result = await productRepository.createList(products);
        if (result) {
            res.send();
        } else sendBadRequest(res, "Invalid creation");
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});
productRouter.put("/:id", async (req: Request, res: Response) => {
    try {
        let product: IProduct = req.body;
        if (isProductModelValid(product)) {
            const { id } = req.params;
            product.id = id;
            const result = await productRepository.update(product, id);
            if (result) res.send(product);
            else {
                const existing = await productRepository.findById(id);
                return existing ? sendBadRequest(res, "Creation invalid") : sendNotFound(res);
            }
        } else {
            sendInvalidModel(res);
        }
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});

productRouter.delete("/:id", async (req: Request, res: Response) => {
    try {
        const { id } = req.params;
        const product = await productRepository.delete(id);
        checkIfExists(product, res);
    } catch (e) {
        sendBadRequest(res, e.message);
    }
});
