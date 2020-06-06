import { Customer } from "../controllers";
import { Filterable } from "sequelize/types";
import { ICustomer } from "../models/Customer";

const getByFilter = async (filter: Filterable["where"]) => {
    return await Customer.findOne({ where: filter });
};

export default {
    listAll: async () => await Customer.findAll(),
    findById: async (id: string) => await getByFilter({ id }),
    finbByEmail: async (email: string) => await getByFilter({ email }),
    createCustomer: async (customer: ICustomer) => await Customer.create(customer),
    update: async (customer: ICustomer, id: string) => await await Customer.update(customer, { where: { id } }),
    delete: async (id: string) => {
        const model = await Customer.findOne({ where: { id } });
        if (model) {
            await model.destroy();
            return model;
        } else {
            return null;
        }
    },
};
