const mongoose = require('mongoose');

const mongoUri = 'mongodb://localhost:27017/imgDbReservas';

mongoose.connect(mongoUri)
  .then(() => console.log('Conexión a MongoDB exitosa'))
  .catch(err => console.error('Error al conectar a MongoDB:', err));

module.exports = mongoose;