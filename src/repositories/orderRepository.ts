import { Customer, OrderItem, Product, Order } from "../controllers";
import { IOrder } from "../models/Order";
import { createAllOrderAsync } from "../business/orders/OrderCreation";
import { IPaginationRequest, IPaginationList } from "../models/helpers/Pagination";

const filterFindOneWithAll = (id: string) => {
    return {
        where: { id },
        include: [
            { model: Customer, as: "customer" },
            {
                model: OrderItem,
                as: "items",
                include: [{ model: Product, as: "product" }],
            },
        ],
    };
};

export default {
    findById: async (id: string) => await Order.findOne(filterFindOneWithAll(id)),
    listAll: async () => await Order.findAll({ include: [{ model: Customer, as: "customer" }] }),
    createAllOrder: async (order: IOrder) => await createAllOrderAsync(order),
    update: async (order: IOrder, id: string) => await await Order.update(order, { where: { id } }),
    delete: async (id: string) => {
        const order = await Order.findOne({ where: { id } });
        if (order) {
            await order.destroy();
            return order;
        } else {
            return null;
        }
    },
};
