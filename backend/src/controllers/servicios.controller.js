const pool = require("../db");

const getAllServicios = async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM servicios.vistaServicios;");
    res.json(result.rows);
  } catch (error) {
    console.error("Error al obtener los servicios:", error);
    res
      .status(500)
      .json({ error: "Ocurrió un error al obtener los servicios" });
  }
};

const getServicio = async (req, res) => {
  const { idServicio } = req.params;
  try {
    const query = `
      SELECT * FROM obtenerServicioPorId($1);
    `;

    const result = await pool.query(query, [idServicio]);
    if (result.rows.length === 0) return res.status(404).json(
        {
            message: "Servicio no encontrado"
        }
    )
    res.json(result.rows[0]);
  } catch (error) {
    console.error('Error al obtener el servicio por ID:', error);
    res.status(500).json({ error: 'Ocurrió un error al obtener el servicio' });
  }
};

const createServicio = async (req, res) => {
  const {
    nombreServicio,
    descripcionServicio,
    precioServicio,
    idTipoServicio,
    idPromocion,
    cupoMaximaReservas,
    idEstablecimiento,
    limiteMaxPersonas,
    estadoServicio,
    categorias,
  } = req.body;

  try {
    const query = `
SELECT * FROM crearServicioConCategorias(
        $1, $2, $3, $4, $5, $6, $7, $8, $9, $10
      ) AS idServicio;
        `;

    const result = await pool.query(query, [
      nombreServicio,
      descripcionServicio,
      precioServicio,
      idTipoServicio,
      idPromocion,
      cupoMaximaReservas,
      idEstablecimiento,
      limiteMaxPersonas,
      estadoServicio,
      categorias,
    ]);

    const idServicio = result.rows[0].idservicio;
    res.status(200).json({ idServicio, message: 'Servicio creado exitosamente' });

    
  } catch (error) {
    console.error("Error al crear el servicio:", error);
    res.status(500).json({ error: "Ocurrió un error al crear el servicio" });
  }
};

const updateServicio = async (req, res) => {
  
  const { idServicio } = req.params;
  const {                    
    nombreServicio,
    descripcionServicio,
    precioServicio,
    idTipoServicio,
    idPromocion,
    cupoMaximaReservas,
    idEstablecimiento,
    limiteMaxPersonas,
    estadoServicio,
    categorias,
  } = req.body;

  try {
    const query = `
    CALL modificarServicio(
    pidServicio := $1,                     
    pnombreServicio := $2,
    pdescripcionServicio := $3,
    pprecioServicio := $4,
    pidTipoServicio := $5,                 
    pidPromocion := $6,                    
    pcupoMaximaReservas := $7,
    pidEstablecimiento := $8,              
    plimiteMaxPersonas := $9,
    pestadoServicio := $10,
    pcategorias := $11           
    );
    `
    await pool.query(query, [
        idServicio,
        nombreServicio,
        descripcionServicio,
        precioServicio,
        idTipoServicio,
        idPromocion,
        cupoMaximaReservas,
        idEstablecimiento,
        limiteMaxPersonas,
        estadoServicio,
        categorias,
    ]);

    res.status(200).json({ message: "Servicio actualizado exitosamente" });

  } catch (error) {
    console.error("Error al crear el servicio:", error);
    res.status(500).json({ error: "Ocurrió un error al modificar el servicio" });
  }
  
};

module.exports = {
  getAllServicios,
  getServicio,
  updateServicio,
  createServicio,
};
