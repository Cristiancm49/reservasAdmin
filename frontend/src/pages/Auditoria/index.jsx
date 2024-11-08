import React, { useState, useEffect } from "react";
import axios from "axios";

function Auditoria() {
  const [auditorias, setAuditorias] = useState([]);
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(true);
  const [expandedRow, setExpandedRow] = useState(null);

  useEffect(() => {
    const fetchAuditoria = async () => {
      try {
        const response = await axios.get("http://localhost:3000/api/caracteristicas/getAllAuditoria");
        setAuditorias(response.data);
      } catch (error) {
        console.error("Error al cargar auditoría:", error);
        setError("Hubo un problema al cargar los datos de auditoría.");
      } finally {
        setLoading(false);
      }
    };

    fetchAuditoria();
  }, []);

  if (loading) return <p className="text-center mt-5">Cargando datos de auditoría...</p>;
  if (error) return <p className="text-center mt-5 text-red-500">{error}</p>;

  return (
    <div className="p-4">
      <h2 className="text-2xl font-bold text-center mb-6">Auditoría de Reservas</h2>
      <table className="min-w-full bg-white border border-gray-200">
        <thead>
          <tr>
            <th className="py-2 px-4 border-b">ID Auditoría</th>
            <th className="py-2 px-4 border-b">Usuario</th>
            <th className="py-2 px-4 border-b">Tabla</th>
            <th className="py-2 px-4 border-b">Operación</th>
            <th className="py-2 px-4 border-b">Fecha de Operación</th>
            <th className="py-2 px-4 border-b">Detalles</th>
          </tr>
        </thead>
        <tbody>
          {auditorias.map((auditoria) => (
            <React.Fragment key={auditoria.idauditoriareserva}>
              <tr className="text-center">
                <td className="py-2 px-4 border-b">{auditoria.idauditoriareserva}</td>
                <td className="py-2 px-4 border-b">{auditoria.usuario}</td>
                <td className="py-2 px-4 border-b">{auditoria.nombretabla}</td>
                <td className="py-2 px-4 border-b">{auditoria.tipooperacion}</td>
                <td className="py-2 px-4 border-b">{new Date(auditoria.fechaoperacion).toLocaleString()}</td>
                <td className="py-2 px-4 border-b">
                  <button
                    onClick={() => setExpandedRow(expandedRow === auditoria.idauditoriareserva ? null : auditoria.idauditoriareserva)}
                    className="bg-blue-500 text-white py-1 px-2 rounded"
                  >
                    {expandedRow === auditoria.idauditoriareserva ? "Ocultar" : "Ver"}
                  </button>
                </td>
              </tr>
              {expandedRow === auditoria.idauditoriareserva && (
                <tr>
                  <td colSpan="6" className="p-4 bg-gray-50">
                    <div className="grid grid-cols-2 gap-4">
                      <div>
                        <h3 className="font-semibold mb-2">Datos Anteriores</h3>
                        <pre className="text-sm bg-gray-100 p-2 rounded">
                          {JSON.stringify(auditoria.datosanteriores, null, 2)}
                        </pre>
                      </div>
                      <div>
                        <h3 className="font-semibold mb-2">Datos Nuevos</h3>
                        <pre className="text-sm bg-gray-100 p-2 rounded">
                          {JSON.stringify(auditoria.datosnuevos, null, 2)}
                        </pre>
                      </div>
                    </div>
                  </td>
                </tr>
              )}
            </React.Fragment>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export default Auditoria;