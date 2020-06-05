import { ProductController } from "./productController";
import sequelizeConnection from "../config/sequelizeConnection";
import { CategoryController } from "./categoryController";

export const Product = ProductController(sequelizeConnection);
export const Category = CategoryController(sequelizeConnection);
