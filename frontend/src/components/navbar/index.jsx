import React from 'react';
import { Link } from 'react-router-dom';

function Navbar({primerNombre, setSearchTerm}) {
  const handleSearchChange = (e) => {
    setSearchTerm(e.target.value); 
  };

  return (
    <nav className="flex items-center justify-between px-4 py-2 bg-gray-800 text-white">
      <div className="flex items-center">
        <img src="https://cdn-icons-png.flaticon.com/512/489/489848.png" alt="Logo" className="h-10" />
      </div>

      
      <div className="flex-grow mx-8">
        <input
          type="text"
          placeholder="Buscar..."
          onChange={handleSearchChange}
          className="w-full h-1/4 p-2 rounded-lg border text-black border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>

      
      <div className="flex items-center space-x-4">
      <Link to="/reseervasRegistradas" className="hover:text-blue-400">
          Mis Reservas
        </Link>
        <Link to="/resenas" className="hover:text-blue-400">
          Mis Reseñas
        </Link>
        <span className="font-semibold">{primerNombre}</span>
        <img
          src="https://b2472105.smushcdn.com/2472105/wp-content/uploads/2023/01/Perfil-Profesional-_63-819x1024.jpg?lossy=1&strip=1&webp=1"
          alt="Foto de perfil"
          className="w-6 h-6 rounded-full object-cover"
        />
      </div>
    </nav>
  );
}

export default Navbar;
