
const express = require('express');
const morgan = require('morgan');


const serviciosRoutes = require('./routes/servicios.routes')
const app = express();

app.use(morgan('dev'));
app.use(express.json());
app.use('/api',serviciosRoutes);

app.listen(3000);

console.log('server on port 3000')
