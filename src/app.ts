import express, { Application } from "express";
import dbConfig from "./config/dbConfig";
import bodyParser from "body-parser";
import { productRouter } from "./routes/products";
import { productCategoryRouter } from "./routes/productCategories";
import { categoryRouter } from "./routes/categories";
import { customerRouter } from "./routes/customers";
import { orderRouter } from "./routes/orders";

dbConfig
    .authenticate()
    .then(() => console.log("connected to db"))
    .catch((err) => {
        console.log(err);
        throw "error";
    });

const app: Application = express();

if (process.env.NODE_ENV === "production") {
    app.use(require("helmet")());
    app.use(require("compression")());
} else {
    app.use(require("cors")());
}

app.set("port", process.env.PORT || 5000);

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true, limit: "5m" }));

app.use("/products", productRouter);
app.use("/categories", categoryRouter);
app.use("/productcategories", productCategoryRouter);
app.use("/customers", customerRouter);
app.use("/orders", orderRouter);

app.listen(app.get("port"), () => {
    console.log(`Server on port ${app.get("port")}`);
});
