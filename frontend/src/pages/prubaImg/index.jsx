import React, { useState } from 'react';
import axios from 'axios';
import { useLocation } from 'react-router-dom';

function UploadServiceImage() {
  const location = useLocation();
  const { serviceId } = 2;

  const [file, setFile] = useState(null);

  const handleFileChange = (e) => {
    setFile(e.target.files[0]);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    const formData = new FormData();
    formData.append('image', file);

    try {
      await axios.post(`http://localhost:3000/api/imageService/uploadImage/${serviceId}`, formData, {
        headers: { 'Content-Type': 'multipart/form-data' }
      });
      alert('Imagen subida con éxito');
    } catch (error) {
      console.error('Error al subir la imagen:', error);
      alert('Error al subir la imagen');
    }
  };

  return (
    <div className="max-w-md mx-auto p-6 bg-white rounded-lg shadow-md mt-5">
      <h2 className="text-xl font-bold text-center text-gray-800 mb-4">Subir Imagen del Servicio</h2>
      <form onSubmit={handleSubmit} className="space-y-4">
        <input
          type="file"
          onChange={handleFileChange}
          accept="image/*"
          required
          className="w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        <button
          type="submit"
          className="w-full py-2 px-4 bg-blue-600 text-white font-bold rounded-md hover:bg-blue-700 transition duration-300"
        >
          Subir Imagen
        </button>
      </form>
    </div>
  );
}

export default UploadServiceImage;