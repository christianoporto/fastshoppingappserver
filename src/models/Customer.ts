import { BuildOptions, Model } from "sequelize";
import { stringIsNullOrEmpty } from "../utils";
export interface ICustomer {
    id?: string;
    fullName: string;
    idNumber: string;
    address: string;
    phoneNumber: string;
    email: string;
}
export interface CustomerModel extends Model<ICustomer>, ICustomer {}
export class Customer extends Model<CustomerModel, ICustomer> {}

export const isCustomerModelValid = (m: ICustomer) => {
    const invalid = stringIsNullOrEmpty(m.fullName) || stringIsNullOrEmpty(m.email);
    return invalid;
};

export type CustomerStatic = typeof Model & {
    new (values?: object, options?: BuildOptions): CustomerModel;
};
