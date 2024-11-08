import React, { useState, useEffect } from "react";
import axios from "axios";
import CardServicio from "../../components/cardServicio";
import NavBar from "../../components/navbar";

function Home() {
  const [servicios, setServicios] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [searchTerm, setSearchTerm] = useState("");

  const dataTurista = JSON.parse(localStorage.getItem("dataTurista"));
  const primerNombre = dataTurista ? dataTurista.primernombre : "Usuario";


  
  useEffect(() => {
    const fetchServicios = async () => {
      try {
        const response = await axios.get(
          "http://localhost:3000/api/servicios/getservicios"
        );
        setServicios(response.data); 
      } catch (error) {
        console.error("Error al cargar los servicios:", error);
        setError("Hubo un error al cargar los servicios.");
      } finally {
        setLoading(false);
      }
    };

    fetchServicios();
  }, []);

  if (loading) {
    return (
      <div className="flex justify-center items-center min-h-screen">
        Cargando servicios...
      </div>
    );
  }

  if (error) {
    return (
      <div className="flex justify-center items-center min-h-screen text-red-500">
        {error}
      </div>
    );
  }
    const filteredServicios = servicios.filter((servicio) =>
    servicio.servicionombre.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div>
      <NavBar primerNombre={primerNombre} setSearchTerm={setSearchTerm}/>
      <div className="flex flex-wrap justify-center items-start min-h-screen bg-gray-100 p-4">
      {filteredServicios.length > 0 ? (
          filteredServicios.map((servicio) => (
            <CardServicio key={servicio.servicioid} servicio={servicio} />
          ))
        ) : (
          <p className="text-gray-600">No se encontraron servicios.</p>
        )}
      </div>
    </div>
  );
}

export default Home;
