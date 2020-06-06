import { DataTypes, Sequelize } from "sequelize";
import { OrderItemStatic } from "../models/OrderItem";

export function OrderItemController(sequelize: Sequelize): OrderItemStatic {
    return <OrderItemStatic>sequelize.define("orderitems", {
        id: {
            type: DataTypes.UUID,
            defaultValue: DataTypes.UUIDV4,
            primaryKey: true,
        },
        orderId: {
            type: DataTypes.STRING,
            allowNull: false,
            references: { model: "orders", key: "id" },
        },
        productId: {
            type: DataTypes.DATE,
            allowNull: false,
            references: { model: "products", key: "id" },
        },
        quantity: {
            type: DataTypes.NUMBER,
            allowNull: false,
        },
    });
}
