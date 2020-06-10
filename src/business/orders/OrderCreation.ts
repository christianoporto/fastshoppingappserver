import { IOrder } from "../../models/Order";
import { IProduct } from "../../models/Product";
import { IOrderItem } from "../../models/OrderItem";
import { Order, Product, orderWithItems, OrderItem } from "../../controllers";
import { ICustomer } from "../../models/Customer";
import customerRepository from "../../repositories/customerRepository";
import { stringIsNullOrEmpty } from "../../utils";

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
export const createCustomer = async (customer: ICustomer) => {
    const newCustomer = await customerRepository.createCustomer(customer);
    return newCustomer;
};
export const createAllOrderAsync = async (order: IOrder): Promise<IOrder | null> => {
    order.dateCreated = new Date();
    if (stringIsNullOrEmpty(order.customerId) && order.customer) {
        const customer = await createCustomer(order.customer);
        if (customer && customer.id) {
            order.customer = customer;
            order.customerId = customer.id;
        }
    }
    order = await calculateTotalAmountAsync(order, true);

    let orderResult = await Order.create(order, { include: [{ association: orderWithItems, as: "items" }] });
    return orderResult;
};
