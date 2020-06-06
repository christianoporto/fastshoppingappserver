import { DataTypes, Sequelize } from "sequelize";
import { CustomerStatic } from "../models/Customer";

export function CustomerController(sequelize: Sequelize): CustomerStatic {
    return <CustomerStatic>sequelize.define("customers", {
        id: {
            type: DataTypes.UUID,
            defaultValue: DataTypes.UUIDV4,
            primaryKey: true,
        },
        fullName: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        idNumber: {
            type: DataTypes.STRING,
            allowNull: true,
        },
        address: {
            type: DataTypes.STRING,
            allowNull: true,
        },
        phoneNumber: {
            type: DataTypes.STRING,
            allowNull: true,
        },
        email: {
            type: DataTypes.STRING,
            allowNull: false,
        },
    });
}
