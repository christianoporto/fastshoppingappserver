import { Category } from "../controllers";
import { ICategory } from "../models/Category";

export default {
    listAll: async () => await Category.findAll(),
    findById: async (id: string) => await Category.findOne({ where: { id } }),
    createCategory: async (category: ICategory) => await Category.create(category),
    update: async (category: ICategory, id: string) => await await Category.update(category, { where: { id } }),
    delete: async (id: string) => {
        const model = await Category.findOne({ where: { id } });
        if (model) {
            await model.destroy();
            return model;
        } else {
            return null;
        }
    },
};
