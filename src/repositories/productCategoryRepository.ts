import { ProductCategory } from "../controllers";
import { IProductCategory } from "../models/ProductCategory";

export default {
    listAll: async () => await ProductCategory.findAll(),
    findById: async (id: string) => await ProductCategory.findOne({ where: { id } }),
    createCategory: async (productCategory: IProductCategory) => await ProductCategory.create(productCategory),
    update: async (productCategory: IProductCategory, id: string) =>
        await await ProductCategory.update(productCategory, { where: { id } }),
    delete: async (id: string) => {
        const model = await ProductCategory.findOne({ where: { id } });
        if (model) {
            await model.destroy();
            return model;
        } else {
            return null;
        }
    },
};
