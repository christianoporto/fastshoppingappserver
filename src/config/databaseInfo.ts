require("dotenv").config();
export interface IDatabaseInfo {
    name: string;
    user: string;
    pass: string;
    host: string;
}

const getConnectionData = () => {
    const host = process.env.DB_HOST;
    const name = process.env.DB_NAME;
    const pass = process.env.DB_PASS;
    const user = process.env.DB_USER;

    console.log("READ DATABASE NAME: ", name);

    const data: IDatabaseInfo = {
        host: host ? host : "localhost",
        name: name ? name : "localhost",
        pass: pass ? pass : "",
        user: user ? user : "root",
    };
    return data;
};

const connectionData = getConnectionData();
export default connectionData;
