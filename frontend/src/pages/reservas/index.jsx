import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useNavigate, useLocation } from 'react-router-dom';

function FormularioReserva() {
  const [formData, setFormData] = useState({
    idMetodoDePago: '',
    cantidadPersonas: 1,
    fechaSalida: '',
    fechaRegreso: '',
    codigoCupon: ''
  });
  const [metodosPago, setMetodosPago] = useState([]);
  const [error, setError] = useState('');
  const navigate = useNavigate();
  const location = useLocation();

  
  const idTurista = JSON.parse(localStorage.getItem('dataTurista')).turistaid;

  
  const { idServicio, maxpersonaslimite } = location.state;

  useEffect(() => {
    const fetchMetodosPago = async () => {
      try {
        const response = await axios.get('http://localhost:3000/api/caracteristicas/getMetodoPagos');
        setMetodosPago(response.data);
      } catch (error) {
        console.error('Error al cargar métodos de pago:', error);
      }
    };
    fetchMetodosPago();
  }, []);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {

    const formattedFechaSalida = new Date(formData.fechaSalida).toISOString().split('T')[0];
    const formattedFechaRegreso = new Date(formData.fechaRegreso).toISOString().split('T')[0];

      await axios.post('http://localhost:3000/api/reservas/createReserva', {
        idTurista,
        idServicio,
        idMetodoDePago: formData.idMetodoDePago,
        cantidadPersonas: formData.cantidadPersonas,
        fechaSalida: formattedFechaSalida,
        fechaRegreso: formattedFechaRegreso,
        codigoCupon: formData.codigoCupon
      });
      alert('Reserva realizada con éxito');
      navigate('/home'); 
    } catch (error) {
      console.error('Error al realizar la reserva:', error);
      setError('Hubo un error al realizar la reserva');
    }
  };

  return (
    <div className="w-full max-w-md mx-auto p-6 bg-white rounded-lg shadow-md mt-5">
      <h2 className="text-2xl font-bold text-center text-gray-800 mb-6">Crear Reserva</h2>

      {error && <p className="text-center text-red-500">{error}</p>}

      <form onSubmit={handleSubmit} className="space-y-4">
        
        <div>
          <label htmlFor="idMetodoDePago" className="block text-gray-700 font-medium mb-2">Método de Pago</label>
          <select
            id="idMetodoDePago"
            name="idMetodoDePago"
            value={formData.idMetodoDePago}
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
          <label htmlFor="codigoCupon" className="block text-gray-700 font-medium mb-2">Código de Cupón</label>
          <input
            type="text"
            id="codigoCupon"
            name="codigoCupon"
            value={formData.codigoCupon}
            onChange={handleChange}
            placeholder="Ingresa un código de cupón (opcional)"
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
        </div>

        
        <button
          type="submit"
          className="w-full py-2 px-4 bg-blue-600 text-white font-bold rounded-md hover:bg-blue-700 transition duration-300"
        >
          Realizar Reserva
        </button>
      </form>
    </div>
  );
}

export default FormularioReserva;