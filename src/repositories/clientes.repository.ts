import { AppDataSource } from "../db/data-source";
import { Clientes } from "../model/clientes";
class ClientesRepository {
 clientesRepository = 
AppDataSource.getRepository(Clientes);
}
export default new ClientesRepository();