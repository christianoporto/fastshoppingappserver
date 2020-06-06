import { BuildOptions, Model } from "sequelize";
import { stringIsNullOrEmpty } from "../utils";

export interface ICategory {
    id?: string;
    name: string;
}

export interface CategoryModel extends Model<ICategory>, ICategory {}
export class Category extends Model<CategoryModel, ICategory> {}

export const categoryIsValid = (m: ICategory) => {
    return !stringIsNullOrEmpty(m.name);
};

export type CategoryStatic = typeof Model & {
    new (values?: object, options?: BuildOptions): CategoryModel;
};
