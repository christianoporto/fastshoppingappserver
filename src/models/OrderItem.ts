import { IOrder } from "./Order";
import { IProduct } from "./Product";

export interface IOrderItem {
    id: number;
    orderId: number;
    productId: number;
    quantity: number;
    order: IOrder;
    product: IProduct;
}
