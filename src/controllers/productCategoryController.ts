import { DataTypes, Sequelize } from "sequelize";
import { ProductCategoryStatic } from "../models/ProductCategory";
import { Product, Category } from ".";

export function ProductCategoryController(sequelize: Sequelize): ProductCategoryStatic {
    const productCategory = <ProductCategoryStatic>sequelize.define("productCategories", {
        id: {
            type: DataTypes.UUID,
            defaultValue: DataTypes.UUIDV4,
            primaryKey: true,
        },
        productId: {
            type: DataTypes.STRING,
            allowNull: false,
            references: {
                model: "products",
                key: "id",
            },
        },
        categoryId: {
            type: DataTypes.STRING,
            allowNull: false,
            references: {
                model: "categories",
                key: "id",
            },
        },
    });

    return productCategory;
}
