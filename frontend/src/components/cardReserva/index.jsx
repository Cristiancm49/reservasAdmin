// CardReserva.js
import React from 'react';
import { useNavigate } from 'react-router-dom';

function CardReserva({ reserva }) {

  const navigate = useNavigate();

  const handleEditClick = () => {
    navigate(`/reseervasRegistradas/${reserva.reservaid}`, {
      state: {
        maxpersonaslimite: reserva.maxpersonaslimite,
      },
    });
  };


  return (
    <div className="w-5/6 h-auto p-4 bg-white shadow-lg rounded-lg overflow-hidden mx-auto mt-5">
     
      <div className="mb-2">
        <h3 className="text-lg font-semibold text-gray-800">Fecha de Reserva: </h3>
        <p className="text-gray-600">{new Date(reserva.fechareserva).toLocaleDateString()}</p>
      </div>

      
      <div className="flex justify-between items-center mb-2">
        <div>
          <span className="font-medium text-gray-700">Fecha de Salida: </span>
          <span className="text-gray-600">{new Date(reserva.fechasalida).toLocaleDateString()}</span>
        </div>
        <div>
          <span className="font-medium text-gray-700">Fecha de Regreso: </span>
          <span className="text-gray-600">{new Date(reserva.fecharegreso).toLocaleDateString()}</span>
        </div>
      </div>

      
      <div className="mb-2">
        <span className="font-medium text-gray-700">Total Pago: </span>
        <span className="text-green-600 font-semibold">${reserva.totalpago}</span>
      </div>

      <div className="mb-2">
        <span className="font-medium text-gray-700">Estado de la Reserva: </span>
        <span className={`font-semibold ${reserva.estadoreserva === 'ACTIVA' ? 'text-green-500' : 'text-red-500'}`}>
          {reserva.estadoreserva}
        </span>
      </div>

      
      <div className="mb-2">
        <span className="font-medium text-gray-700">Servicio: </span>
        <span className="text-gray-600">{reserva.servicionombre}</span>
      </div>

      <div className="mb-2">
        <span className="font-medium text-gray-700">Establecimiento: </span>
        <span className="text-gray-600">{reserva.establecimientonombre}</span>
      </div>

      <div className="mb-2">
        <span className="font-medium text-gray-700">Método de Pago: </span>
        <span className="text-gray-600">{reserva.metodopagonombre}</span>
      </div>
      <button
        onClick={handleEditClick}
        className="mt-4 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
      >
        Editar Reserva
      </button>
    </div>
  );
}

export default CardReserva;
