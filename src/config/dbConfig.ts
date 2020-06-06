import { Sequelize } from "sequelize";
import dbInfo from "./databaseInfo";

console.log("DATABASE INFO: ", dbInfo);
var dbConfig = new Sequelize(dbInfo.name, dbInfo.user, dbInfo.pass, {
    host: dbInfo.host,
    dialect: "mysql",
    define: {
        timestamps: false,
    },
});
export default dbConfig;
