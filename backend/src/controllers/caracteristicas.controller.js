const pool = require("../db");

const getAllCategorias = async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM servicios.vistaCategorias;");
    res.json(result.rows);
  } catch (error) {
    console.error("Error al obtener las categorias:", error);
    res
      .status(500)
      .json({ error: "Ocurrió un error al obtener las categorias" });
  }
};

const getAllmPagos = async (req, res) => {
    try {
      const result = await pool.query("SELECT * FROM reservas.vistaPagos;");
      res.json(result.rows);
    } catch (error) {
      console.error("Error al obtener los metodos de pago:", error);
      res
        .status(500)
        .json({ error: "Ocurrió un error al obtener los metodos de pago" });
    }
  };

  const getAllTiposDocumentos = async (req, res) => {
    try {
      const result = await pool.query("SELECT * FROM usuarios.vistaDocumentos");
      res.json(result.rows);
    } catch (error) {
      console.error("Error al obtener los tipos de documentos:", error);
      res
        .status(500)
        .json({ error: "Ocurrió un error al obtener los tipos de documentos" });
    }
  };

  const getAllMunicipios = async (req, res) => {
    try {
      const result = await pool.query("SELECT * FROM usuarios.vistaMunicipio");
      res.json(result.rows);
    } catch (error) {
      console.error("Error al obtener los Municipios:", error);
      res
        .status(500)
        .json({ error: "Ocurrió un error al obtener los Municipios" });
    }
  };

  const getAllTiposServicios = async (req, res) => {
    try {
      const result = await pool.query("SELECT * FROM servicios.vwTipoServicio");
      res.json(result.rows);
    } catch (error) {
      console.error("Error al obtener los tipos de servicios:", error);
      res
        .status(500)
        .json({ error: "Ocurrió un error al obtener los tipos de servicios" });
    }
  };


module.exports = {
    getAllCategorias,
    getAllmPagos,
    getAllTiposDocumentos,
    getAllMunicipios, 
    getAllTiposServicios
}