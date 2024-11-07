
const express = require('express');
const morgan = require('morgan');


const serviciosRoutes = require('./routes/servicios.routes');
const caracteristicasRoutes = require('./routes/caracteristicas.routes');
const reservasRoutes = require('./routes/reservas.routes');
const usuariosRoutes = require('./routes/usuarios.routes');
const app = express();

app.use(morgan('dev'));
app.use(express.json());
app.use('/api/servicios',serviciosRoutes);
app.use('/api/caracteristicas', caracteristicasRoutes);
app.use('/api/reservas', reservasRoutes);
app.use('/api/usuarios', usuariosRoutes)


app.listen(3000);

console.log('server on port 3000')
