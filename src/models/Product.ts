import { BuildOptions, Model } from "sequelize";
import { stringIsNullOrEmpty } from "../utils";
import { IProductCategory } from "./ProductCategory";
export interface IProduct {
    id?: string;
    name: string;
    descrption: string;
    price: number;
    image: string;
    categories: IProductCategory[];
}
export interface ProductModel extends Model<IProduct>, IProduct {}
export class Product extends Model<ProductModel, IProduct> {}

export const isModelValid = (m: IProduct) => {
    const invalid = m.price <= 0 || stringIsNullOrEmpty(m.name) || stringIsNullOrEmpty(m.descrption);
    return invalid;
};

export type ProductStatic = typeof Model & {
    new (values?: object, options?: BuildOptions): ProductModel;
};
