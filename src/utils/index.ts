import { IPaginationRequest } from "../models/helpers/Pagination";

export const stringIsNullOrEmpty = (value?: string): boolean => {
    return !value || value === "" || value === null;
};

export const isPaginationRequestValid = (pagReq: IPaginationRequest) => {
    return pagReq.currentPage > 0 && pagReq.pageSize > 0;
};
