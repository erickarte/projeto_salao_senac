"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const data_source_1 = require("../db/data-source");
const clientes_1 = require("../model/clientes");
class ClientesRepository {
    constructor() {
        this.clientesRepository = data_source_1.AppDataSource.getRepository(clientes_1.Clientes);
    }
}
exports.default = new ClientesRepository();
