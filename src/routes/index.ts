import { Response } from "express";

export const checkIfExists = (result: any, res: Response) => {
    if (result) res.send(result);
    else sendNotFound(res);
};
export const sendBadRequest = (res: Response, message?: string) => {
    const optionmessage = message ? message : "Bad request";
    return res.status(404).send({
        status: 400,
        message: optionmessage,
    });
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
