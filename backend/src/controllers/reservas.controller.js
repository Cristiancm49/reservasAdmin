const pool = require('../db');

const getReservasPorTurista = async (req, res) => {
    const { idTurista } = req.params;
    try {
        const query = `
            SELECT * FROM obtenerReservasPorTurista($1);
        `;

        const result = await pool.query(query, [idTurista])
        if (result.rows.length === 0) return res.status(404).json(
            {message: 'No se encontraron reservas asociadas a este usuario'}
        )
        res.json(result.rows)
    } catch (error) {
        console.error('Error al obtener el resevas por ID de turista:', error);
        res.status(500).json({ error: 'Ocurrió un error al obtener las reservas' });
    }

}

const getReserva = async (req, res) => {
    const { idReserva } = req.params

    try{
        const query = `
        SELECT * FROM obtenerReservaPorId($1);
        `
        const result = await pool.query(query, [idReserva])
        if(result.rows.length === 0) return res.status(404).json({
            message: 'No se encontraron reservas con este id'
        })
        res.json(result.rows[0])
    } catch (error) {
        console.error('Error al obtener el resevas por ID:', error);
        res.status(500).json({ error: 'Ocurrió un error al obtener las reservas' });
    }
}

const getReservasPorEstablecimiento = async (req, res) => {
    const { idEstablecimiento } = req.params;

    try {
      const query = `
        SELECT * FROM obtenerReservasPorEstablecimiento($1);
      `;
  
      const result = await pool.query(query, [idEstablecimiento]);
      if (result.rows.length === 0) return res.status(404).json(
          {
              message: "No hay reservas relacionadas a ese establecimiento"
          }
      )
      res.json(result.rows);
    } catch (error) {
      console.error('Error al obtener el resevas por ID de establecimiento:', error);
      res.status(500).json({ error: 'Ocurrió un error al obtener las reservas' });
    }
  };

const createReserva = async(req, res) => {
    const {
        idTurista,
        idServicio,
        idMetodoDePago,
        cantidadPersonas,
        fechaSalida,
        fechaRegreso,
        codigoCupon
    } = req.body;
    try{
        const query = `
        CALL crearReserva(
        pidTurista := $1,
        pidServicio := $2,
        pidMetodoDePago := $3,
        pcantidadPersonas := $4,
        pfechaSalida := $5,
        pfechaRegreso := $6,
        pcodigoCupon := $7
        );
        `;

        await pool.query(query, [
            idTurista,
            idServicio,
            idMetodoDePago,
            cantidadPersonas,
            fechaSalida,
            fechaRegreso,
            codigoCupon || null,
        ])
        res.status(200).json({ message: 'Reserva creada exitosamente'})
    } catch (error) {
        console.error("Error al crear una reserva:", error);
    res
      .status(500)
      .json({ error: "Ocurrió un error al crear una reserva" });
    }
};


module.exports = {
    createReserva,
    getReservasPorEstablecimiento,
    getReservasPorTurista,
    getReserva
}