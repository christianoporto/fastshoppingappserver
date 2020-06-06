import { ProductController } from "./productController";
import dbConfig from "../config/dbConfig";
import { CategoryController } from "./categoryController";
import { ProductCategoryController } from "./productCategoryController";
import { CustomerController } from "./customerController";
import { OrderController } from "./orderController";
import { OrderItemController } from "./orderItemController";

export const Product = ProductController(dbConfig);
export const Category = CategoryController(dbConfig);
export const ProductCategory = ProductCategoryController(dbConfig);
export const Customer = CustomerController(dbConfig);
export const Order = OrderController(dbConfig);
export const OrderItem = OrderItemController(dbConfig);

Product.hasMany(ProductCategory, { as: "categories" });
Product.hasOne(OrderItem);

ProductCategory.belongsTo(Product);
ProductCategory.belongsTo(Category);

export const orderWithItems = Order.hasMany(OrderItem, { as: "items" });

OrderItem.belongsTo(Product);
OrderItem.belongsTo(Order);

Order.belongsTo(Customer);
