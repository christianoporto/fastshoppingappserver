import { BuildOptions, Model, OrderItem } from "sequelize";
import { stringIsNullOrEmpty } from "../utils";
import { ICustomer } from "./Customer";
import { IOrderItem } from "./OrderItem";

export interface IOrder {
    id?: string;
    customerId: string;
    dateCreated: Date;
    totalAmount: number;
    customer: ICustomer;
    items: IOrderItem[];
}
export interface OrderModel extends Model<IOrder>, IOrder {}
export class Order extends Model<OrderModel, IOrder> {}

export const isOrderModelValid = (m: IOrder) => {
    return m.items.length <= 0 || stringIsNullOrEmpty(m.customerId);
};

export type OrderStatic = typeof Model & {
    new (values?: object, options?: BuildOptions): OrderModel;
};
