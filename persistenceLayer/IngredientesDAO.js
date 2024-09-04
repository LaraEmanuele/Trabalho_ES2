const Mysql = require('../mysql');

class IngredienteDAO{
    constructor(){
        this.mysql = Mysql;
        this.recovery=this.recovery.bind(this);
    }

    async recovery (){
        try{
            const ingredientes = await this.mysql.execute('SELECT * FROM ingrediente;')
            res.status(201).send(ingredientes)
            return ingredientes;
        }catch{
            throw error;
        }
        
    }
}

module.exports = IngredienteDAO;