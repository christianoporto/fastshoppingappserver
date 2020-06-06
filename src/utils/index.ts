export const stringIsNullOrEmpty = (value?: string): boolean => {
    return !value || value === "" || value === null;
};

