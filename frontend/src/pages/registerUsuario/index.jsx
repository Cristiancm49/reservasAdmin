import React, { useState } from 'react';

function RegistroUsuario() {
  const [formData, setFormData] = useState({
    contrasenaUsuario: '',
    emailUsuario: '',
    idRol: ''
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    // Aquí puedes manejar el envío del formulario
    console.log('Datos del formulario:', formData);
  };

  return (
    <div className="w-full max-w-md mx-auto p-6 bg-white rounded-lg shadow-md mt-5">
      <h2 className="text-2xl font-bold text-center text-gray-800 mb-6">Registro de Usuario</h2>
      <form onSubmit={handleSubmit} className="space-y-4">
        
        {/* Email */}
        <div>
          <label htmlFor="emailUsuario" className="block text-gray-700 font-medium mb-2">Correo Electrónico</label>
          <input
            type="email"
            id="emailUsuario"
            name="emailUsuario"
            value={formData.emailUsuario}
            onChange={handleChange}
            placeholder="Ingresa tu correo"
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
        </div>

        {/* Contraseña */}
        <div>
          <label htmlFor="contrasenaUsuario" className="block text-gray-700 font-medium mb-2">Contraseña</label>
          <input
            type="password"
            id="contrasenaUsuario"
            name="contrasenaUsuario"
            value={formData.contrasenaUsuario}
            onChange={handleChange}
            placeholder="Ingresa tu contraseña"
            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
        </div>

        {/* Selección de Rol */}
        <div>
          <p className="text-gray-700 font-medium mb-2">Selecciona un Rol</p>
          <div className="flex items-center space-x-4">
            <label className="flex items-center">
              <input
                type="radio"
                name="idRol"
                value="1"
                checked={formData.idRol === '2'}
                onChange={handleChange}
                className="form-radio h-5 w-5 text-blue-600"
              />
              <span className="ml-2 text-gray-700">Turista</span>
            </label>
            <label className="flex items-center">
              <input
                type="radio"
                name="idRol"
                value="2"
                checked={formData.idRol === '3'}
                onChange={handleChange}
                className="form-radio h-5 w-5 text-blue-600"
              />
              <span className="ml-2 text-gray-700">Establecimiento</span>
            </label>
          </div>
        </div>

        {/* Botón de Registro */}
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

export default RegistroUsuario;
