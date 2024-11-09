const multer = require('multer');

const storage = multer.memoryStorage(); // Almacenamos en memoria temporalmente
const upload = multer({ storage });

module.exports = upload;