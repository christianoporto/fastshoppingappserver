import { IProduct } from "./Product";
import { ICategory } from "./Category";

export interface IProductCategory {
    id: number;
    productId: number;
    product: IProduct;
    categoryId: number;
    category: ICategory;
}
