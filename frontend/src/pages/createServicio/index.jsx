import React, { useState, useEffect } from 'react';
import axios from 'axios';

function RegistroServicio() {
  const idEstablecimientolc = localStorage.getItem("idEstablecimiento");

  const [formData, setFormData] = useState({
    nombreServicio: '',
    descripcionServicio: '',
    precioServicio: '',
    idTipoServicio: '',
    idPromocion: '',
    cupoMaximaReservas: '',
    idEstablecimiento: idEstablecimientolc || '', 
    limiteMaxPersonas: '',
    estadoServicio: 'DISPONIBLE',
    categorias: []
  });
  const [file, setFile] = useState(null); // Estado para el archivo de imagen
  const [categorias, setCategorias] = useState([]);
  const [promociones, setPromociones] = useState([]);
  const [tiposServicio, setTiposServicio] = useState([]);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');
  const [idServicio, setIdServicio] = useState(null); // Estado para el idServicio

  useEffect(() => {
    const fetchCategorias = async () => {
      try {
        const response = await axios.get('http://localhost:3000/api/caracteristicas/getCategorias');
        setCategorias(response.data);
      } catch (error) {
        console.error('Error al cargar categorías:', error);
      }
    };

    const fetchPromociones = async () => {
      try {
        const response = await axios.get('http://localhost:3000/api/caracteristicas/getPromociones');
        setPromociones(response.data);
      } catch (error) {
        console.error('Error al cargar promociones:', error);
      }
    };

    const fetchTiposServicio = async () => {
      try {
        const response = await axios.get('http://localhost:3000/api/caracteristicas/getTipos');
        setTiposServicio(response.data);
      } catch (error) {
        console.error('Error al cargar tipos de servicio:', error);
      }
    };

    fetchCategorias();
    fetchPromociones();
    fetchTiposServicio();
  }, []);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };

  const handleCategoriasChange = (e) => {
    const selectedOptions = Array.from(e.target.selectedOptions, option => option.value);
    setFormData({ ...formData, categorias: selectedOptions });
  };

  const handleFileChange = (e) => {
    setFile(e.target.files[0]);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError('');
    setSuccess('');

    const dataToSend = {
      ...formData,
      precioServicio: parseFloat(formData.precioServicio),
      idTipoServicio: parseInt(formData.idTipoServicio),
      idPromocion: parseInt(formData.idPromocion),
      cupoMaximaReservas: parseInt(formData.cupoMaximaReservas),
      idEstablecimiento: parseInt(formData.idEstablecimiento),
      limiteMaxPersonas: parseInt(formData.limiteMaxPersonas)
    };

    try {
      const response = await axios.post('http://localhost:3000/api/servicios/createServicio', dataToSend);
      const newIdServicio = response.data.idServicio;

      setIdServicio(newIdServicio);
      setSuccess('Servicio registrado exitosamente');
      localStorage.setItem("idServicio", newIdServicio);

      // Subir imagen a MongoDB con el ID del servicio
      if (file) {
        const formData = new FormData();
        formData.append('image', file);

        try {
          await axios.post(`http://localhost:3000/api/imageService/uploadImage/${newIdServicio}`, formData, {
            headers: { 'Content-Type': 'multipart/form-data' }
          });
          setSuccess('Servicio y imagen registrados exitosamente');
        } catch (error) {
          console.error('Error al subir la imagen:', error);
          setError('Servicio registrado, pero hubo un error al subir la imagen');
        }
      }

      setFormData({
        nombreServicio: '',
        descripcionServicio: '',
        precioServicio: '',
        idTipoServicio: '',
        idPromocion: '',
        cupoMaximaReservas: '',
        idEstablecimiento: idEstablecimientolc,
        limiteMaxPersonas: '',
        estadoServicio: 'DISPONIBLE',
        categorias: []
      });
      setFile(null);
    } catch (error) {
      console.error('Error al registrar servicio:', error);
      setError('Hubo un error al registrar el servicio');
    }
  };

  return (
    <div className="w-full max-w-md mx-auto p-6 bg-white rounded-lg shadow-md mt-5">
      <h2 className="text-2xl font-bold text-center text-gray-800 mb-6">Registro de Servicio</h2>

      {error && <p className="text-center text-red-500">{error}</p>}
      {success && <p className="text-center text-green-500">{success}</p>}
      {idServicio && <p className="text-center text-gray-700">ID del Servicio Creado: {idServicio}</p>}

      <form onSubmit={handleSubmit} className="space-y-4">
        
        {/* Nombre del Servicio */}
        <div>
          <label htmlFor="nombreServicio" className="block text-gray-700 font-medium mb-2">Nombre del Servicio</label>
          <input
            type="text"
            id="nombreServicio"
            name="nombreServicio"
            value={formData.nombreServicio}
            onChange={handleChange}
            placeholder="Ingresa el nombre del servicio"
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            required
          />
        </div>

        {/* Descripción del Servicio */}
        <div>
          <label htmlFor="descripcionServicio" className="block text-gray-700 font-medium mb-2">Descripción del Servicio</label>
          <textarea
            id="descripcionServicio"
            name="descripcionServicio"
            value={formData.descripcionServicio}
            onChange={handleChange}
            placeholder="Ingresa una descripción"
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            required
          />
        </div>

        {/* Precio del Servicio */}
        <div>
          <label htmlFor="precioServicio" className="block text-gray-700 font-medium mb-2">Precio del Servicio</label>
          <input
            type="number"
            id="precioServicio"
            name="precioServicio"
            value={formData.precioServicio}
            onChange={handleChange}
            placeholder="Ingresa el precio"
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            required
          />
        </div>

        {/* Tipo de Servicio */}
        <div>
          <label htmlFor="idTipoServicio" className="block text-gray-700 font-medium mb-2">Tipo de Servicio</label>
          <select
            id="idTipoServicio"
            name="idTipoServicio"
            value={formData.idTipoServicio}
            onChange={handleChange}
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            required
          >
            <option value="">Selecciona un tipo de servicio</option>
            {tiposServicio.map((tipo) => (
              <option key={tipo.servicio} value={tipo.servicio}>
                {tipo.nombreservicio}
              </option>
            ))}
          </select>
        </div>

        {/* Promoción */}
        <div>
          <label htmlFor="idPromocion" className="block text-gray-700 font-medium mb-2">Promoción</label>
          <select
            id="idPromocion"
            name="idPromocion"
            value={formData.idPromocion}
            onChange={handleChange}
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
          >
            <option value="">Selecciona una promoción</option>
            {promociones.map((promo) => (
              <option key={promo.promocionid} value={promo.promocionid}>
                {promo.descripcionpromocion}
              </option>
            ))}
          </select>
        </div>

        {/* Categorías */}
        <div>
          <label htmlFor="categorias" className="block text-gray-700 font-medium mb-2">Categorías</label>
          <select
            id="categorias"
            name="categorias"
            multiple
            value={formData.categorias}
            onChange={handleCategoriasChange}
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
          >
            {categorias.map((categoria) => (
              <option key={categoria.idcategoriaservicio} value={categoria.idcategoriaservicio}>
                {categoria.nombrecategoria}
              </option>
            ))}
          </select>
        </div>

        {/* Cupo Máximo de Reservas */}
        <div>
          <label htmlFor="cupoMaximaReservas" className="block text-gray-700 font-medium mb-2">Cupo Máximo de Reservas</label>
          <input
            type="number"
            id="cupoMaximaReservas"
            name="cupoMaximaReservas"
            value={formData.cupoMaximaReservas}
            onChange={handleChange}
            placeholder="Máximo de reservas"
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            required
          />
        </div>

        {/* Límite Máximo de Personas */}
        <div>
          <label htmlFor="limiteMaxPersonas" className="block text-gray-700 font-medium mb-2">Límite Máximo de Personas</label>
          <input
            type="number"
            id="limiteMaxPersonas"
            name="limiteMaxPersonas"
            value={formData.limiteMaxPersonas}
            onChange={handleChange}
            placeholder="Límite máximo de personas"
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            required
          />
        </div>

        {/* Estado del Servicio */}
        <div>
          <label htmlFor="estadoServicio" className="block text-gray-700 font-medium mb-2">Estado del Servicio</label>
          <select
            id="estadoServicio"
            name="estadoServicio"
            value={formData.estadoServicio}
            onChange={handleChange}
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
          >
            <option value="DISPONIBLE">Disponible</option>
          </select>
        </div>

        {/* Imagen del Servicio */}
        <div>
          <label htmlFor="image" className="block text-gray-700 font-medium mb-2">Imagen del Servicio</label>
          <input
            type="file"
            id="image"
            onChange={handleFileChange}
            accept="image/*"
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
        </div>

        <button
          type="submit"
          className="w-full py-2 px-4 bg-blue-600 text-white font-bold rounded-md hover:bg-blue-700 transition duration-300"
        >
          Registrar Servicio
        </button>
      </form>
    </div>
  );
}

export default RegistroServicio;
