const express = require('express');
const app = express();
const morgan = require('morgan');
const bodyParser = require('body-parser');

const rotaIngrediente = require('./routes/IngredienteRoutes');


app.use(morgan('dev'));//Ao rodar uma rota ele retorna um log no terminal
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

app.use('/ingrediente', rotaIngrediente);

app.use((req, res, next)=>{
    const erro = new Erro ('Não encontrado');
    erro.status = 404;
    next(erro);
});

app.use((erro, req, res, next)=>{
    res.status(erro.status || 500);
    return res.send({
        erro: {
            mensagem: erro.mensagem
        }
    });
});

module.exports = app; //Informa que esse módulo será exportado