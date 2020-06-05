import { DataTypes, Sequelize } from "sequelize";
import { ProductStatic } from "../models/Product";

export function ProductController(sequelize: Sequelize): ProductStatic {
    return <ProductStatic>sequelize.define("products", {
        id: {
            type: DataTypes.UUID,
            defaultValue: DataTypes.UUIDV4,
            primaryKey: true,
        },
        name: {
            type: DataTypes.STRING,
            allowNull: false,
            unique: true,
        },
        description: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        price: {
            type: DataTypes.DOUBLE,
            allowNull: false,
        },
    });
}
