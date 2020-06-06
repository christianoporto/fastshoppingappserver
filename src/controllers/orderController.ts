import { DataTypes, Sequelize } from "sequelize";
import { OrderStatic } from "../models/Order";

export function OrderController(sequelize: Sequelize): OrderStatic {
  let Order =  <OrderStatic>sequelize.define("orders", {
        id: {
            type: DataTypes.UUID,
            defaultValue: DataTypes.UUIDV4,
            primaryKey: true,
        },
        customerId: {
            type: DataTypes.STRING,
            allowNull: false,
            references: {
                model: "customers",
                key: "id",
            },
        },
        dateCreated: {
            type: DataTypes.DATE,
            allowNull: false
        },
        totalAmount: {
            type: DataTypes.NUMBER,
            allowNull: false,
        },
    });
    return Order;
}
