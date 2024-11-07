const pool = require("../db");

const createEstablecimiento = async (req, res) => {
    const {
        idUsuario,
        nombreEstablecimiento,
        nit,
        emailEstablecimiento,
        idMunicipio,
        calle,
        numero,
        informacionAdicional,
        estadoUbicacion,
        estadoEstablecimiento
    } = req.body;

    try {
        const query = `
            CALL crearEstablecimiento(
                pidUsuario := $1,
                pnombreEstablecimiento := $2,
                pnit := $3,
                pemailEstablecimiento := $4,
                pidMunicipio := $5,
                pcalle := $6,
                pnumero := $7,
                pinformacionAdicional := $8,
                pestadoUbicacion := $9,
                pestadoEstablecimiento := $10
            );
        `;

        await pool.query(query, [
            idUsuario,
            nombreEstablecimiento,
            nit,
            emailEstablecimiento,
            idMunicipio,
            calle,
            numero,
            informacionAdicional,
            estadoUbicacion,
            estadoEstablecimiento
        ]);

        res.status(200).json({ message: 'Establecimiento creado exitosamente' });
    } catch (error) {
        console.error("Error al crear el establecimiento:", error);
        res.status(500).json({ error: "Ocurrió un error al crear el establecimiento" });
    }
};

const updateEstablecimiento = async (req, res) => {
    const { idEstablecimiento } = req.params;
    const {
        nombreEstablecimiento,
        nit,
        emailEstablecimiento,
        idMunicipio,
        calle,
        numero,
        informacionAdicional,
        estadoUbicacion,
        estadoEstablecimiento
    } = req.body;

    try {
        const query = `
            CALL editarEstablecimiento(
                pidEstablecimiento := $1,
                pnombreEstablecimiento := $2,
                pnit := $3,
                pemailEstablecimiento := $4,
                pidMunicipio := $5,
                pcalle := $6,
                pnumero := $7,
                pinformacionAdicional := $8,
                pestadoUbicacion := $9,
                pestadoEstablecimiento := $10
            );
        `;

        await pool.query(query, [
            idEstablecimiento,
            nombreEstablecimiento,
            nit,
            emailEstablecimiento,
            idMunicipio,
            calle,
            numero,
            informacionAdicional,
            estadoUbicacion,
            estadoEstablecimiento
        ]);

        res.status(200).json({ message: 'Establecimiento editado exitosamente' });
    } catch (error) {
        console.error("Error al editar el establecimiento:", error);
        res.status(500).json({ error: "Ocurrió un error al editar el establecimiento" });
    }
};

const getEstablecimiento = async (req, res) => {
    const { idEstablecimiento } = req.params;

    try {
        const query = `
            SELECT * FROM usuarios.establecimientoPorId($1);
        `;

        const result = await pool.query(query, [idEstablecimiento]);

        if (result.rows.length === 0) {
            return res.status(404).json({
                message: 'Establecimiento no encontrado'
            });
        }
        res.status(200).json(result.rows[0]);
    } catch (error) {
        console.error("Error al buscar el establecimiento:", error);
        res.status(500).json({ error: "Ocurrió un error al buscar el establecimiento" });
    }
};



module.exports = { 
    createEstablecimiento,
    updateEstablecimiento,
    getEstablecimiento
 };