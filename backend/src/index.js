
const express = require('express');
require('./mongo');
const cors = require('cors');
const morgan = require('morgan');


const serviciosRoutes = require('./routes/servicios.routes');
const caracteristicasRoutes = require('./routes/caracteristicas.routes');
const reservasRoutes = require('./routes/reservas.routes');
const usuariosRoutes = require('./routes/usuarios.routes');
const establecimientoRoutes = require('./routes/establecimientos.routes');
const turistaRouter = require('./routes/turista.routes')
const imageServiceRoutes = require('./routes/imageService.routes')
const app = express();

app.use(cors());
app.use(morgan('dev'));
app.use(express.json());
app.use('/api/servicios',serviciosRoutes);
app.use('/api/caracteristicas', caracteristicasRoutes);
app.use('/api/reservas', reservasRoutes);
app.use('/api/usuarios', usuariosRoutes);
app.use('/api/establecimientos', establecimientoRoutes);
app.use('/api/turistas', turistaRouter);
app.use('/api/imageService', imageServiceRoutes);


app.listen(3000);


