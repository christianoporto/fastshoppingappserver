import { Response } from "express";

export const checkIfExists = (result: any, res: Response) => {
    if (result) res.send(result);
    else sendNotFound(res);
};
export const sendBadRequest = (e: any, res: Response) => {
    console.log("ERROR: ", e.message);
    return res.status(400).send(e.message);
};
export const sendInvalidModel = (res: Response) => {
    res.status(400).send("The model format is not valid");
};
export const sendNotFound = (res: Response) => {
    res.status(404).send({
        status: 404,
        message: "Not found",
    });
};
