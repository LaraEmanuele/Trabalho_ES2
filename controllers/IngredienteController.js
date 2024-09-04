const IngredienteDAO = require('../persistenceLayer/IngredientesDAO');

class IngredienteController{
    constructor(){
        this.ingredienteDAO = new IngredienteDAO();
        this.show=this.show.bind(this);
        
    }

    async show (req, res){
        try{
            
            const result = await this.ingredienteDAO.recovery.bind(this);
            
            const response = {
                quantidade: result.length,
                ingredientes: result.map(ingr=>{
                    return {
                        id_ingrediente: ingr.id_ingrediente,
                        nome: ingr.nome,
                        request:{
                            tipo: 'GET',
                            descricao:'Retorna um produto específico',
                            url: process.env.URL_API + 'ingrediente/'+ingr.id_ingrediente
                        }
                    }
                })
            }
            return res.status(201).send(response);
            }catch(error){
                return res.status(500).send({error:"Entrou no catch do getIngredientes"});
            }
    }

}

module.exports = IngredienteController;
/*
exports.getIngredientes = async (req, res, next)=>{
    try{
    const result = await ingredienteDAO.recovery();
    const response = {
        quantidade: result.length,
        ingredientes: result.map(ingr=>{
            return {
                id_ingrediente: ingr.id_ingrediente,
                nome: ingr.nome,
                request:{
                    tipo: 'GET',
                    descricao:'Retorna um produto específico',
                    url: process.env.URL_API + 'ingrediente/'+ingr.id_ingrediente
                }
            }
        })
    }
    return res.status(201).json(response);
    }catch(error){
        return res.status(500).send({error:"Entrou no catch do getIngredientes"});
    }
}
*/

/*try{
            const result = await this.ingredienteDAO.recovery.bind(this.ingredienteDAO);
            const response = {
                quantidade: result.length,
                ingredientes: result.map(ingr=>{
                    return {
                        id_ingrediente: ingr.id_ingrediente,
                        nome: ingr.nome,
                        request:{
                            tipo: 'GET',
                            descricao:'Retorna um produto específico',
                            url: process.env.URL_API + 'ingrediente/'+ingr.id_ingrediente
                        }
                    }
                })
            }
            return res.status(201).send(response);
        }catch(erro){
            
        } */