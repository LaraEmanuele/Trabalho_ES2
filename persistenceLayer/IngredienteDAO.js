const Mysql = require('../mysql');

class IngredienteDAO{
    constructor(){
        this.mysql = Mysql;
        this.recovery=this.recovery.bind(this);
        this.edit=this.edit.bind(this);
        this.recoveryOne=this.recoveryOne.bind(this);
    }

    async recovery (){
        try{
            const ingredientes = await this.mysql.execute('SELECT * FROM ingrediente;');
            return ingredientes;
        }catch{
            throw error;
        }
        
    }

    async edit (req){
        try{
            const query = 'INSERT INTO ingrediente (nome) VALUES (?);';
            const ingrediente = this.mysql.execute(query,
                [
                    req.body.nome
                ]
            );
            return ingrediente
        }catch{
            throw error;
        }
    }

    async recoveryOne (req){
        try{
            const query = 'SELECT * FROM ingrediente WHERE id_ingrediente = ?;';
            const ingrediente = this.mysql.execute(query,
                [
                    req.params.id_ingrediente
                ]
            );
            return ingrediente
        }catch{
            throw error;
        }
    }

    async recoveryOne (req){
        try{
            const query = 'UPDATE ingrediente SET nome = (?) WHERE id_ingrediente = (?);';
            const ingrediente = this.mysql.execute(query,
                [
                    req.body.nome,
                    req.body.id_ingrediente
                ]
            );
            return ingrediente
        }catch{
            throw error;
        }
    }
}

module.exports = IngredienteDAO;