import { IOrder } from "../../models/Order";
import { IProduct } from "../../models/Product";
import { IOrderItem } from "../../models/OrderItem";
import { Order, Product, orderWithItems, OrderItem } from "../../controllers";

const initialOrderNumber = 100000;
const getOrderNumber = async (): Promise<string> => {
    let orderCounter = await Order.count();
    return (initialOrderNumber + orderCounter).toString(16).toUpperCase();
};

const setProduct = async (item: IOrderItem) => {
    const result = await Product.findOne({ where: { id: item.productId } });
    if (result) {
        item.product = result;
    }
};
const setNumber = async (order: IOrder) => {
    order.number = await getOrderNumber();
};
export const calculateTotalAmountAsync = async (order: IOrder, createNumber?: boolean): Promise<IOrder> => {
    let promises: any[] = [];
    if (createNumber) {
        promises.push(setNumber(order));
    }
    order.items.forEach((element) => {
        if (!element.product && element.productId) {
            promises.push(setProduct(element));
        }
    });
    await Promise.all(promises);
    order.totalAmount = order.items.reduce((a, b) => a + (b.product ? b.product.price * b.quantity : 0), 0);

    return order;
};

export const createAllOrderAsync = async (order: IOrder): Promise<IOrder | null> => {
    order.dateCreated = new Date();
    order = await calculateTotalAmountAsync(order, true);

    let orderResult = await Order.create(order, { include: [{ association: orderWithItems, as: "items" }] });
    return orderResult;
};
