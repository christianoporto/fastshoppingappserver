import { BuildOptions, Model } from "sequelize";
import { stringIsNullOrEmpty } from "../utils";
import { IProduct } from "./Product";

export interface IOrderItem {
    id?: string;
    orderId: string;
    productId: string;
    quantity: number;
    product?: IProduct;
}
export interface OrderItemModel extends Model<IOrderItem>, IOrderItem {}
export class OrderItem extends Model<OrderItemModel, IOrderItem> {}

export const isOrderItemModelValid = (m: IOrderItem) => {
    return m.quantity <= 0 || stringIsNullOrEmpty(m.orderId) || stringIsNullOrEmpty(m.productId);
};

export type OrderItemStatic = typeof Model & {
    new (values?: object, options?: BuildOptions): OrderItemModel;
};
