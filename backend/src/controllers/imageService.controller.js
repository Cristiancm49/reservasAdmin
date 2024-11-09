const ImageService = require('../models/ImageService.model');


const getImageByServiceId = async (req, res) => {
    try {
      const { serviceId } = req.params;
      const image = await ImageService.findOne({ serviceId: parseInt(serviceId) });
  
      if (!image) {
        return res.status(404).json({ message: 'Imagen no encontrada' });
      }
  
      // Convertir la imagen almacenada en MongoDB a base64 y enviar como string
      const base64Image = `data:${image.mimeType};base64,${image.image.toString('base64')}`;
      
      res.json({ image: base64Image });
    } catch (error) {
      console.error("Error al obtener la imagen:", error);
      res.status(500).json({ error: 'Error al obtener la imagen' });
    }
  };
  
  module.exports = { getImageByServiceId };