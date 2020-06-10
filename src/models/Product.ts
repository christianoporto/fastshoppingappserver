import { BuildOptions, Model } from "sequelize";
import { stringIsNullOrEmpty } from "../utils";
import { IProductCategory } from "./ProductCategory";
export interface IProduct {
    id?: string;
    name: string;
    description: string;
    price: number;
    image: string;
    categories: IProductCategory[];
    dateCreated: Date;
}
export interface ProductModel extends Model<IProduct>, IProduct {}
export class Product extends Model<ProductModel, IProduct> {}

export const isProductModelValid = (m: IProduct) => {
    const invalid = m.price <= 0 || stringIsNullOrEmpty(m.name) || stringIsNullOrEmpty(m.description);
    return !invalid;
};

export type ProductStatic = typeof Model & {
    new (values?: object, options?: BuildOptions): ProductModel;
};
