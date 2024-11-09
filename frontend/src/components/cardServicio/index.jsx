import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

function CardServicio({ servicio }) {
  const navigate = useNavigate();
  const [imageSrc, setImageSrc] = useState(null);

  // Obtener la imagen cuando el componente carga
  useEffect(() => {
    const fetchImage = async () => {
      try {
        const response = await axios.get(`http://localhost:3000/api/imageService/getImage/${servicio.servicioid}`);
        setImageSrc(response.data.image); // Asegúrate de que el backend esté enviando la imagen en base64
      } catch (error) {
        console.error("Error al cargar la imagen del servicio:", error);
      }
    };

    fetchImage();
  }, [servicio.servicioid]);

  const handleReservaClick = () => {
    navigate(`/reservar`, { state: { idServicio: servicio.servicioid, maxpersonaslimite: servicio.maxpersonaslimite } });
  };

  return (
    <div className="w-5/6 h-auto p-4 flex bg-white shadow-lg rounded-lg overflow-hidden mx-auto mt-5">
      <div className="w-1/4 flex justify-center items-center">
        {imageSrc ? (
          <img src={imageSrc} alt="Imagen del Servicio" className="w-full h-full object-cover rounded-md" />
        ) : (
          <div className="w-24 h-24 bg-gray-200 rounded-md flex items-center justify-center text-gray-400">
            Imagen no disponible
          </div>
        )}
      </div>

      <div className="w-3/4 px-4 space-y-2">
        <div className="flex justify-between items-center">
          <h2 className="text-xl font-bold text-gray-800">{servicio.servicionombre}</h2>
          <span className="text-xl font-semibold text-green-600">${servicio.finalprecio}</span>
        </div>

        <p className="text-gray-600">{servicio.serviciodescripcion}</p>
        <p className="text-gray-500 text-sm">Categorías: {servicio.categoriasnombres}</p>

        <div className="flex justify-between items-center mt-2">
          <span className="text-sm font-medium text-gray-700">Tipo: {servicio.serviciotiponombre}</span>
          <span className={`text-sm font-semibold ${servicio.servicioestado === 'DISPONIBLE' ? 'text-green-500' : 'text-red-500'}`}>
            {servicio.servicioestado}
          </span>
        </div>

        <div className="flex justify-between items-center mt-2">
          <span className="text-sm font-medium text-gray-700">Límite de personas: {servicio.maxpersonaslimite}</span>
        </div>

        <button
          onClick={handleReservaClick}
          className="mt-4 px-4 py-2 bg-blue-500 text-white font-semibold rounded-lg hover:bg-blue-600 transition duration-200"
        >
          Realizar Reserva
        </button>
      </div>
    </div>
  );
}

export default CardServicio;
