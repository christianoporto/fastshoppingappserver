import { Sequelize } from "sequelize";
import fs from "fs";
import path from "path";

const dbConfig = new Sequelize("storedb", "", "", {
    host: "host",
    dialect: "sqlite",
    storage: "fast-shopping-db",
    define: {
        timestamps: false,
    },
});
let models: any = {};
let db = {
    sequelize: dbConfig,
    Sequelize,
    models,
};

const dir = path.join(__dirname, "controllers");
fs.readdirSync(dir).forEach((filename) => {
    const mdir = path.join(dir, filename);
    const model = dbConfig.import(mdir);
    db.models[model.name] = model;
});

Object.keys(db.models).forEach((key) => {
    db.models[key].associate(db.models);
});

export default dbConfig;
