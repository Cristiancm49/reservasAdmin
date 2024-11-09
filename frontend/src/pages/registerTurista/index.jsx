import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';

function RegistroTurista() {
  const [formData, setFormData] = useState({
    idTipoDocumento: '',
    documentoTurista: '',
    primerNombreTurista: '',
    segundoNombreTurista: '',
    primerApellidoTurista: '',
    segundoApellidoTurista: '',
    telefono: ''
  });

  const [tiposDocumento, setTiposDocumento] = useState([]);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

 
  const navigate = useNavigate();
  const idUsuario = localStorage.getItem("idUsuario");

  
  useEffect(() => {
    const fetchTiposDocumento = async () => {
      try {
        const response = await axios.get('http://localhost:3000/api/caracteristicas/getTipoDocumentos'); 
        setTiposDocumento(response.data);
      } catch (error) {
        console.error('Error al cargar tipos de documento:', error);
      }
    };

    fetchTiposDocumento();
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
      
      const response = await axios.post('http://localhost:3000/api/turistas/createTurista', {
        idUsuario,
        ...formData
      });

      const { dataTurista } = response.data;
      localStorage.setItem("dataTurista", JSON.stringify(dataTurista));

      navigate('/home');

      setSuccess('Registro exitoso');
      console.log('Datos del turista guardados en localStorage:', dataTurista);
      console.log('Respuesta del servidor:', response.data);

      
      setFormData({
        idTipoDocumento: '',
        documentoTurista: '',
        primerNombreTurista: '',
        segundoNombreTurista: '',
        primerApellidoTurista: '',
        segundoApellidoTurista: '',
        telefono: ''
      });
    } catch (error) {
      console.error('Error al registrar turista:', error);
      setError('Hubo un error al registrar el turista');
    }
  };

  return (
    <div className="w-full max-w-md mx-auto p-6 bg-white rounded-lg shadow-md mt-5">
      <h2 className="text-2xl font-bold text-center text-gray-800 mb-6">Registro de Turista</h2>

      
      {success && <p className="text-center text-green-500">{success}</p>}
      {error && <p className="text-center text-red-500">{error}</p>}

      <form onSubmit={handleSubmit} className="space-y-4">
        
        
        <div>
          <label htmlFor="idTipoDocumento" className="block text-gray-700 font-medium mb-2">Tipo de Documento</label>
          <select
            id="idTipoDocumento"
            name="idTipoDocumento"
            value={formData.idTipoDocumento}
            onChange={handleChange}
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
          >
            <option value="">Selecciona un tipo de documento</option>
            {tiposDocumento.map((tipo) => (
              <option key={tipo.tipodocumetno} value={tipo.tipodocumetno}>
                {tipo.nombredocumentos}
              </option>
            ))}
          </select>
        </div>

        
        <div>
          <label htmlFor="documentoTurista" className="block text-gray-700 font-medium mb-2">Número de Documento</label>
          <input
            type="number"
            id="documentoTurista"
            name="documentoTurista"
            value={formData.documentoTurista}
            onChange={handleChange}
            placeholder="Ingresa tu número de documento"
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
        </div>

       
        <div>
          <label htmlFor="primerNombreTurista" className="block text-gray-700 font-medium mb-2">Primer Nombre</label>
          <input
            type="text"
            id="primerNombreTurista"
            name="primerNombreTurista"
            value={formData.primerNombreTurista}
            onChange={handleChange}
            placeholder="Ingresa tu primer nombre"
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
        </div>

      
        <div>
          <label htmlFor="segundoNombreTurista" className="block text-gray-700 font-medium mb-2">Segundo Nombre</label>
          <input
            type="text"
            id="segundoNombreTurista"
            name="segundoNombreTurista"
            value={formData.segundoNombreTurista}
            onChange={handleChange}
            placeholder="Ingresa tu segundo nombre"
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
        </div>

        
        <div>
          <label htmlFor="primerApellidoTurista" className="block text-gray-700 font-medium mb-2">Primer Apellido</label>
          <input
            type="text"
            id="primerApellidoTurista"
            name="primerApellidoTurista"
            value={formData.primerApellidoTurista}
            onChange={handleChange}
            placeholder="Ingresa tu primer apellido"
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
        </div>

        
        <div>
          <label htmlFor="segundoApellidoTurista" className="block text-gray-700 font-medium mb-2">Segundo Apellido</label>
          <input
            type="text"
            id="segundoApellidoTurista"
            name="segundoApellidoTurista"
            value={formData.segundoApellidoTurista}
            onChange={handleChange}
            placeholder="Ingresa tu segundo apellido"
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
        </div>

        <div>
          <label htmlFor="telefono" className="block text-gray-700 font-medium mb-2">Teléfono</label>
          <input
            type="tel"
            id="telefono"
            name="telefono"
            value={formData.telefono}
            onChange={handleChange}
            placeholder="Ingresa tu teléfono"
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
        </div>

        
        <button
          type="submit"
          className="w-full py-2 px-4 bg-blue-600 text-white font-bold rounded-md hover:bg-blue-700 transition duration-300"
        >
          Registrarse
        </button>
      </form>
    </div>
  );
}

export default RegistroTurista;