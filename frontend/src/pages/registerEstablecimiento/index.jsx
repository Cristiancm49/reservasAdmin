import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';

function RegistroEstablecimiento() {
  const [formData, setFormData] = useState({
    nombreEstablecimiento: '',
    nit: '',
    emailEstablecimiento: '',
    idMunicipio: '',
    calle: '',
    numero: '',
    informacionAdicional: ''
  });
  const [municipios, setMunicipios] = useState([]);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  const navigate = useNavigate();
  const idUsuario = localStorage.getItem("idUsuario");

  
  useEffect(() => {
    const fetchMunicipios = async () => {
      try {
        const response = await axios.get('http://localhost:3000/api/caracteristicas/getMunicipios');
        setMunicipios(response.data);
      } catch (error) {
        console.error('Error al cargar municipios:', error);
        setError('Hubo un problema al cargar los municipios.');
      }
    };
    fetchMunicipios();
  }, []);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError('');
    setSuccess('');

    try {
      const response = await axios.post('http://localhost:3000/api/establecimientos/createEstablecimiento', {
        idUsuario, 
        ...formData
      });

      setSuccess('Establecimiento registrado exitosamente');
      localStorage.setItem("dataEstablecimiento", JSON.stringify(response.data)); 
      navigate('/crearServicio'); 
    } catch (error) {
      console.error('Error al registrar el establecimiento:', error);
      setError('Hubo un error al registrar el establecimiento');
    }
  };

  return (
    <div className="w-full max-w-md mx-auto p-6 bg-white rounded-lg shadow-md mt-5">
      <h2 className="text-2xl font-bold text-center text-gray-800 mb-6">Registro de Establecimiento</h2>

      {success && <p className="text-center text-green-500">{success}</p>}
      {error && <p className="text-center text-red-500">{error}</p>}

      <form onSubmit={handleSubmit} className="space-y-4">
        
       
        <div>
          <label htmlFor="nombreEstablecimiento" className="block text-gray-700 font-medium mb-2">Nombre del Establecimiento</label>
          <input
            type="text"
            id="nombreEstablecimiento"
            name="nombreEstablecimiento"
            value={formData.nombreEstablecimiento}
            onChange={handleChange}
            placeholder="Ingresa el nombre del establecimiento"
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            required
          />
        </div>

        
        <div>
          <label htmlFor="nit" className="block text-gray-700 font-medium mb-2">NIT</label>
          <input
            type="number"
            id="nit"
            name="nit"
            value={formData.nit}
            onChange={handleChange}
            placeholder="Ingresa el NIT"
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            required
          />
        </div>

        
        <div>
          <label htmlFor="emailEstablecimiento" className="block text-gray-700 font-medium mb-2">Correo Electrónico</label>
          <input
            type="email"
            id="emailEstablecimiento"
            name="emailEstablecimiento"
            value={formData.emailEstablecimiento}
            onChange={handleChange}
            placeholder="Ingresa el correo del establecimiento"
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            required
          />
        </div>

        
        <div>
          <label htmlFor="idMunicipio" className="block text-gray-700 font-medium mb-2">Municipio</label>
          <select
            id="idMunicipio"
            name="idMunicipio"
            value={formData.idMunicipio}
            onChange={handleChange}
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            required
          >
            <option value="">Selecciona un municipio</option>
            {municipios.map((municipio) => (
              <option key={municipio.municipio} value={municipio.municipio}>
                {municipio.nombremuni}
              </option>
            ))}
          </select>
        </div>

        
        <div>
          <label htmlFor="calle" className="block text-gray-700 font-medium mb-2">Calle</label>
          <input
            type="text"
            id="calle"
            name="calle"
            value={formData.calle}
            onChange={handleChange}
            placeholder="Ingresa la calle"
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            required
          />
        </div>

        
        <div>
          <label htmlFor="numero" className="block text-gray-700 font-medium mb-2">Número</label>
          <input
            type="text"
            id="numero"
            name="numero"
            value={formData.numero}
            onChange={handleChange}
            placeholder="Ingresa el número"
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            required
          />
        </div>

        
        <div>
          <label htmlFor="informacionAdicional" className="block text-gray-700 font-medium mb-2">Información Adicional</label>
          <textarea
            id="informacionAdicional"
            name="informacionAdicional"
            value={formData.informacionAdicional}
            onChange={handleChange}
            placeholder="Ingresa información adicional (opcional)"
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
        </div>

        
        <button
          type="submit"
          className="w-full py-2 px-4 bg-blue-600 text-white font-bold rounded-md hover:bg-blue-700 transition duration-300"
        >
          Registrar Establecimiento
        </button>
      </form>
    </div>
  );
}

export default RegistroEstablecimiento;
