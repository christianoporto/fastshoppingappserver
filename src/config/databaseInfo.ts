require("dotenv").config();

type dialectType = "mysql" | "postgres" | "sqlite" | "mariadb" | "mssql" | undefined;
export interface IDatabaseInfo {
    name: string;
    user: string;
    pass: string;
    host: string;
    dialect: dialectType;
}

const getConnectionData = () => {
    const host = process.env.DB_HOST;
    const name = process.env.DB_NAME;
    const pass = process.env.DB_PASS;
    const user = process.env.DB_USER;
    const dialect = process.env.DB_DIALECT as dialectType;

    const data: IDatabaseInfo = {
        host: host ? host : "localhost",
        name: name ? name : "localhost",
        pass: pass ? pass : "",
        user: user ? user : "root",
        dialect: dialect ? dialect : "mysql",
    };
    return data;
};

const connectionData = getConnectionData();
export default connectionData;
