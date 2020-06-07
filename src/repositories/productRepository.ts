import { Product, ProductCategory, Category } from "../controllers";
import { IProduct } from "../models/Product";
import { IPaginationList, IPaginationRequest } from "../models/helpers/Pagination";

const includeCategories = [
    {
        model: ProductCategory,
        as: "categories",
        include: [{ model: Category }],
    },
];

type orderPagesException = "overflow" | undefined;
interface IPaginationResponse {
    pagination?: IPaginationList<IProduct>;
    exception: orderPagesException;
}

const getProductsInPages = async (pagReq: IPaginationRequest): Promise<IPaginationResponse> => {
    const totalItems = await Product.count();
    const indexElement = Math.abs(pagReq.currentPage - 1) * pagReq.pageSize;

    if (totalItems < indexElement) return { exception: "overflow" };
    const items = await Product.findAll({
        offset: indexElement,
        limit: pagReq.pageSize,
        subQuery: false,
        order: [["dateCreated", "DESC"]],
    });
    return {
        exception: undefined,
        pagination: {
            items,
            currentPage: pagReq.currentPage,
            pageSize: pagReq.pageSize,
            totalItems: totalItems,
            totalPages: Math.ceil(totalItems / pagReq.pageSize),
        },
    };
};

export default {
    listAll: async () => await Product.findAll({ include: includeCategories }),
    listInPages: async (pagReq: IPaginationRequest) => await getProductsInPages(pagReq),
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
