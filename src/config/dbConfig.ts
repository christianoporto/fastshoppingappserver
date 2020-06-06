import { Sequelize } from "sequelize";
import dbInfo from "./databaseInfo";

var dbConfig = new Sequelize(dbInfo.name, dbInfo.user, dbInfo.pass, {
    host: dbInfo.host,
    dialect: dbInfo.dialect,
    define: {
        timestamps: false,
    },
});
export default dbConfig;
