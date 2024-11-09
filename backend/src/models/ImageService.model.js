const mongoose = require('mongoose');

const imageServiceSchema = new mongoose.Schema({
  serviceId: {
    type: Number, 
    required: true
  },
  image: {
    type: Buffer, 
    required: true
  },
  mimeType: {
    type: String,
    required: true
  }
});

module.exports = mongoose.model('ImageService', imageServiceSchema);