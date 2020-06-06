import { BuildOptions, Model } from "sequelize";
import { stringIsNullOrEmpty } from "../utils";
import { IProduct } from "./Product";
import { ICategory } from "./Category";

export interface IProductCategory {
    id?: string;
    productId: string;
    categoryId: string;
    category?: ICategory;
}

export interface ProductCategoryModel extends Model<IProductCategory>, IProductCategory {}
export class ProductCategory extends Model<ProductCategoryModel, IProductCategory> {}

export const productCategoryIsValid = (m: IProductCategory) => {
    return !stringIsNullOrEmpty(m.productId) && !stringIsNullOrEmpty(m.categoryId);
};

export type ProductCategoryStatic = typeof Model & {
    new (values?: object, options?: BuildOptions): ProductCategoryModel;
};
