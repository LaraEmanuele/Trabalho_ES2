const IngredienteDAO = require('../persistenceLayer/IngredienteDAO');

class IngredienteController{
    constructor(){
        this.ingredienteDAO = new IngredienteDAO();
        this.showAll=this.showAll.bind(this);
        this.write=this.write.bind(this);
        this.showOne=this.showOne.bind(this);
        this.update=this.update.bind(this);
    }

    async showAll (req, res){
        try{
            
            const result = await this.ingredienteDAO.recovery();
            
            const response = {
                quantidade: result.length,
                ingredientes: result.map(ingr=>{
                    return {
                        id_ingrediente: ingr.id_ingrediente,
                        nome: ingr.nome,
                        request:{
                            tipo: 'GET',
                            descricao:'Retorna um ingrediente específico',
                            url: process.env.URL_API + 'ingrediente/'+ingr.id_ingrediente
                        }
                    }
                })
            }
            return res.status(201).send(response);
        }catch(error){
            return res.status(500).send({error:"Entrou no showAll no IngredienteController"});
        }
    }

    async write (req, res){
        try{
            const result = await this.ingredienteDAO.edit(req);
            const response = {
                mensagem: 'Ingrediente inserido com sucesso',
                ingredienteCriado: {
                    id_ingrediente: result.id_ingrediente,
                    nome: req.body.nome,
                    request:{
                        tipo: 'GET',
                        descricao:'Retorna todos os ingredientes',
                        url: process.env.URL_API + 'ingrediente/'
                    }
                }
            }
            return res.status(201).send(response);
        }catch(error){
            return res.status(500).send({error:"Entrou no write no IngredienteController"});
        }
    }

    async showOne(req, res){
        
        try{
            const result = await this.ingredienteDAO.recoveryOne(req);
            if (result.length == 0){
                return res.status(404).send({
                    mensagem: 'Não foi encontrado um produto com esse ID'
                })
            }
            const response = {
            mensagem: 'Ingrediente encontrado',
            ingredienteEncontrado: {
                id_ingrediente: result.id_ingrediente,
                nome: result.nome,
                    request:{
                        tipo: 'GET',
                        descricao:'Retorna todos os ingredientes',
                        url: process.env.URL_API + 'ingrediente/'
                    }
                }
            }
            return res.status(201).send(result);
        }catch(error){
            return res.status(500).send({error:"Entrou no showOne no IngredienteController"});
        }
    }

    async update (req, res){
        try{
            const result = await this.ingredienteDAO.update(req);
            
            const response = {
                mensagem: 'Ingrediente inserido com sucesso',
                produtoCriado: {
                    id_ingrediente: req.body.id_ingrediente,
                    nome: result.body.nome,
                    request:{
                        tipo: 'GET',
                        descricao:'Retorna todos os ingredientes',
                        url: process.env.URL_API + 'ingrediente/'
                    }
                }
            }
            return res.status(201).send(response);
        }catch(error){
            return res.status(500).send({error:"Entrou no update no IngredienteController"});
        }
    }

}

module.exports = IngredienteController;