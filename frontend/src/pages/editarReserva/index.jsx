import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useParams, useNavigate, useLocation } from 'react-router-dom';

function EditarReserva() {
  const { id } = useParams(); 
  const location = useLocation();
  const { maxpersonaslimite } = location.state ;
  const [formData, setFormData] = useState({
    fechaSalida: '',
    fechaRegreso: '',
    cantidadPersonas: '',
    metodoPago: '',
  });
  const [metodosPago, setMetodosPago] = useState([]);
  const [error, setError] = useState('');
  const navigate = useNavigate();

  useEffect(() => {
    const fetchMetodosPago = async () => {
      try {
        const response = await axios.get('http://localhost:3000/api/caracteristicas/getMetodoPagos');
        setMetodosPago(response.data);
      } catch (error) {
        console.error('Error al cargar métodos de pago:', error);
        setError('Hubo un problema al cargar los métodos de pago.');
      }
    };

    
    const fetchReserva = async () => {
      try {
        const response = await axios.get(`http://localhost:3000/api/reservas/reserva/${id}`);
        const { fechaSalida, fechaRegreso, cantidadPersonas, metodoPago } = response.data;
        setFormData({
          fechaSalida,
          fechaRegreso,
          cantidadPersonas,
          metodoPago,
        });
      } catch (error) {
        console.error('Error al cargar la reserva:', error);
        setError('Hubo un problema al cargar la reserva.');
      }
    };

    fetchMetodosPago();
    fetchReserva();
  }, [id]);

  
  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };

  
  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await axios.put(`http://localhost:3000/api/reservas/updateReserva/${id}`, formData);
      alert('Reserva actualizada con éxito');
      navigate('/reseervasRegistradas'); 
    } catch (error) {
      console.error('Error al actualizar la reserva:', error);
      setError('Hubo un problema al actualizar la reserva.');
    }
  };

  return (
    <div className="max-w-md mx-auto p-6 bg-white rounded-lg shadow-md mt-5">
      <h2 className="text-2xl font-bold text-center mb-6">Editar Reserva</h2>

      {error && <p className="text-center text-red-500">{error}</p>}

      <form onSubmit={handleSubmit} className="space-y-4">
        
        <div>
          <label htmlFor="fechaSalida" className="block text-gray-700 font-medium mb-2">Fecha de Salida</label>
          <input
            type="date"
            id="fechaSalida"
            name="fechaSalida"
            value={formData.fechaSalida}
            onChange={handleChange}
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            required
          />
        </div>

        
        <div>
          <label htmlFor="fechaRegreso" className="block text-gray-700 font-medium mb-2">Fecha de Regreso</label>
          <input
            type="date"
            id="fechaRegreso"
            name="fechaRegreso"
            value={formData.fechaRegreso}
            onChange={handleChange}
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            required
          />
        </div>

        
        <div>
          <label htmlFor="cantidadPersonas" className="block text-gray-700 font-medium mb-2">Cantidad de Personas</label>
          <input
            type="number"
            id="cantidadPersonas"
            name="cantidadPersonas"
            value={formData.cantidadPersonas}
            onChange={handleChange}
            min="1"
            max={maxpersonaslimite} 
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            required
          />
        </div>

        
        <div>
          <label htmlFor="metodoPago" className="block text-gray-700 font-medium mb-2">Método de Pago</label>
          <select
            id="metodoPago"
            name="metodoPago"
            value={formData.metodoPago}
            onChange={handleChange}
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            required
          >
            <option value="">Selecciona un método de pago</option>
            {metodosPago.map((metodo) => (
              <option key={metodo.numerometodo} value={metodo.numerometodo}>
                {metodo.nombremetodo}
              </option>
            ))}
          </select>
        </div>

        
        <button
          type="submit"
          className="w-full py-2 px-4 bg-blue-600 text-white font-bold rounded-md hover:bg-blue-700 transition duration-300"
        >
          Guardar Cambios
        </button>
      </form>
    </div>
  );
}

export default EditarReserva;
