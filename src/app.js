//constantes para ejecutar express
const express = require('express');
const path = require('path');
const morgan = require('morgan')
const mysql = require('mysql')
const myConnection = require('express-myconnection')

const app = express();

//importando rutas
const empleadosRoute = require('./routes/empleados')


//configuraciones del servidor //Path join se usa para unir directorios
app.set('port', process.env.PORT || 3000);
app.set('view engine', 'ejs')
app.set('views', path.join(__dirname, 'views'))

//middlewares

app.use(morgan('dev'));
app.use(myConnection(mysql, {
    host: 'localhost',
    user: 'root',
    password: '1234',
    port: 3306,
    database: 'outlet',
}, 'single'));


app.use(express.urlencoded({ extended: true }))

//routes
app.use('/', empleadosRoute);

//archivos estaticos
app.use(express.static(__dirname + '/public'));

//inicializar el servidor
app.listen(app.get('port'), () => {
    console.log('server on port 3000');
});