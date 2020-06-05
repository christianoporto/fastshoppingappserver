import { ICustomer } from "./Customer";

export interface IOrder {
    id: number;
    customerId: number;
    customer: ICustomer;
    dateCreated: Date;
    totalAmount: number;
}
