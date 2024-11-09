const express = require('express');
const upload = require('../middlewares/upload');
const ImageService = require('../models/ImageService.model');
const { getImageByServiceId } = require('../controllers/imageService.controller');

const router = express.Router();

// Endpoint para subir una imagen de servicio
router.post('/uploadImage/:serviceId', upload.single('image'), async (req, res) => {
  try {
    const { serviceId } = req.params;
    const imageBuffer = req.file.buffer;
    const mimeType = req.file.mimetype;

    // Guardar en MongoDB
    const imageService = new ImageService({
      serviceId,
      image: imageBuffer,
      mimeType
    });

    await imageService.save();
    res.status(201).json({ message: 'Imagen subida y guardada con éxito' });
  } catch (error) {
    console.error('Error al subir la imagen:', error);
    res.status(500).json({ error: 'Error al subir la imagen' });
  }
});

router.get('/getImage/:serviceId', getImageByServiceId);

module.exports = router;