import { DataTypes, Sequelize } from "sequelize";
import { CategoryStatic } from "../models/Category";

export function CategoryController(sequelize: Sequelize): CategoryStatic {
    return <CategoryStatic>sequelize.define("categories", {
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
    });
}
