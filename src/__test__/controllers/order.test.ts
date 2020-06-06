import { IOrder, OrderStatic } from "../../models/Order";
import orderRepository from "../../repositories/orderRepository";
import { Order } from "../../controllers";
import { IProduct } from "../../models/Product";
import { calculateTotalAmountAsync } from "../../business/orders/OrderCreation";

const productSample: IProduct = {
    categories: [],
    description: "des",
    image: "imag",
    name: "productname",
    price: 345,
    id: "1",
};
const orderMock: IOrder = {
    id: "orderid",
    customerId: "customerId",
    dateCreated: new Date(),
    items: [{ orderId: "orderid", productId: "product", quantity: 2, id: "1", product: productSample }],
    totalAmount: 234,
};

jest.mock("../../controllers/index", () => () => {
    const SequelizeMock = require("sequelize-mock");
    const dbMock = new SequelizeMock();
    return <OrderStatic>dbMock.define("orders", orderMock);
});

describe("Test Sequelize order Mocking", () => {
    it("Should get totalAmount from mock order", async () => {
        const order = await calculateTotalAmountAsync(orderMock);
        expect(order.totalAmount).toEqual(345);
    });
});
