import { Product, ProductCategory, Category } from "../controllers";
import { IProduct } from "../models/Product";

const includeCategories = [
    {
        model: ProductCategory,
        as: "categories",
        include: [{ model: Category }],
    },
];

export default {
    listAll: async () => await Product.findAll({ include: includeCategories }),
    findById: async (id: string) => await Product.findOne({ where: { id }, include: includeCategories }),
    createProduct: async (product: IProduct) => await Product.create(product),
    update: async (product: IProduct, id: string) => await await Product.update(product, { where: { id } }),
    delete: async (id: string) => {
        const model = await Product.findOne({ where: { id } });
        if (model) {
            await model.destroy();
            return model;
        } else {
            return null;
        }
    },
};
