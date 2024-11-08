import React from 'react';
import { useNavigate } from 'react-router-dom';

function CardServicio({ servicio }) {
  const navigate = useNavigate();

  const handleReservaClick = () => {
    navigate(`/reservar`, { state: { idServicio: servicio.servicioid, maxpersonaslimite: servicio.maxpersonaslimite } });
  };

  return (
    <div className="w-5/6 h-auto p-4 flex bg-white shadow-lg rounded-lg overflow-hidden mx-auto mt-5">
      <div className="w-1/4 flex justify-center items-center">
        <div className="w-24 h-24 bg-gray-200 rounded-md"></div>
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