const mysql = require('../mysql');
const ingredienteDAO = require('../persistenceLayer/IngredientesDAO');

exports.getIngredientes = async (req, res, next)=>{
    try{
    const result = await mysql.execute("SELECT * FROM ingrediente;")
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
    return res.status(200).send(response);
    }catch(error){
        return res.status(500).send({error:error});
    }
}