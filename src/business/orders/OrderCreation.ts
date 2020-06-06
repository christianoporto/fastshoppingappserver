import { IOrder, OrderStatic } from "../../models/Order";
import { ProductStatic, IProduct } from "../../models/Product";
import { IOrderItem } from "../../models/OrderItem";
import { Order, Product, orderWithItems, OrderItem } from "../../controllers";

const setProduct = async (item: IOrderItem) => {
    const result = await Product.findOne({ where: { id: item.productId } });
    if (result) {
        const copy: IProduct = result;
        item.product = result;
    }
};

export const calculateTotalAmountAsync = async (order: IOrder): Promise<IOrder> => {
    let promises: any[] = [];
    order.items.forEach((element) => {
        if (!element.product && element.productId) {
            promises.push(setProduct(element));
        }
    });
    await Promise.all(promises);
    order.totalAmount = order.items.reduce((a, b) => a + (b.product ? b.product.price : 0), 0);

    return order;
};

export const createAllOrderAsync = async (order: IOrder): Promise<IOrder | null> => {
    order.dateCreated = new Date();
    order = await calculateTotalAmountAsync(order);
    let orderResult = await Order.create(order, { include: [{ association: orderWithItems, as: "items" }] });
    if (orderResult && orderResult.id) {
        const items = await OrderItem.findAll({
            where: { orderId: orderResult.id },
            include: [{ model: Product, as: "product" }],
        });
        console.log("RESULTAOD EITEMS: ", items);
        if (items) {
            orderResult.items = items;
        }
    }
    return orderResult;
};
