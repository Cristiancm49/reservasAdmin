// Reservas.js
import React, { useState, useEffect } from 'react';
import axios from 'axios';
import CardReserva from '../../components/cardReserva';

function Reservas() {
  const [reservas, setReservas] = useState([]);
  const [error, setError] = useState('');

  // Obtén el idTurista desde localStorage
  const idTurista = JSON.parse(localStorage.getItem('dataTurista'))?.turistaid;

  useEffect(() => {
    const fetchReservas = async () => {
      try {
        const response = await axios.get(`http://localhost:3000/api/reservas/reservasPorTuristas/${idTurista}`);
        setReservas(response.data);
      } catch (error) {
        console.error('Error al cargar las reservas:', error);
        setError('Hubo un problema al cargar las reservas.');
      }
    };

    if (idTurista) {
      fetchReservas();
    } else {
      setError('ID de turista no encontrado en el almacenamiento local.');
    }
  }, [idTurista]);

  return (
    <div className="p-6">
      <h2 className="text-2xl font-bold text-center text-gray-800 mb-6">Mis Reservas</h2>

      {error && <p className="text-center text-red-500">{error}</p>}

      {reservas.length > 0 ? (
        reservas.map((reserva) => <CardReserva key={reserva.fechareserva} reserva={reserva} />)
      ) : (
        !error && <p className="text-center text-gray-600">No tienes reservas.</p>
      )}
    </div>
  );
}

export default Reservas;
