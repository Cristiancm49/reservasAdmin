const pool = require('../db');

const getTurista = async (req, res) => {
    const { idTurista } = req.params;

    try {
        const query = `
            SELECT * FROM usuarios.buscarTuristaPorId($1);
        `;

        const result = await pool.query(query, [idTurista]);

        if (result.rows.length === 0) {
            return res.status(404).json({
                message: 'Turista no encontrado'
            });
        }

        res.status(200).json(result.rows[0]);
    } catch (error) {
        console.error("Error al buscar el turista:", error);
        res.status(500).json({ error: "Ocurrió un error al buscar el turista" });
    }
};



const createTurista = async (req, res) => {
    const {
        idUsuario,
        idTipoDocumento,
        documentoTurista,
        primerNombreTurista,
        segundoNombreTurista,
        primerApellidoTurista,
        segundoApellidoTurista,
        telefono
    } = req.body;

    try {
        const query = `
            CALL crearTurista(
                pidUsuario := $1,
                pidTipoDocumento := $2,
                pdocumentoTurista := $3,
                pprimerNombreTurista := $4,
                psegundoNombreTurista := $5,
                pprimerApellidoTurista := $6,
                psegundoApellidoTurista := $7,
                ptelefono := $8
            );
        `;

        await pool.query(query, [
            idUsuario,
            idTipoDocumento,
            documentoTurista,
            primerNombreTurista,
            segundoNombreTurista,
            primerApellidoTurista,
            segundoApellidoTurista,
            telefono
        ]);

        const result = await pool.query(
            `SELECT * FROM turistaPorUsuario($1);`, [idUsuario]
        );

        const dataTurista = result.rows[0]
        

        res.status(200).json({ dataTurista,message: 'Turista creado y relacionado con el usuario exitosamente' });
    } catch (error) {
        console.error("Error al crear el turista:", error);
        res.status(500).json({ error: "Ocurrió un error al crear el turista" });
    }
};

const updateTurista = async (req, res) => {
    const { idTurista } = req.params;
    const {
        idTipoDocumento,
        documentoTurista,
        primerNombreTurista,
        segundoNombreTurista,
        primerApellidoTurista,
        segundoApellidoTurista,
        telefono,
        estadoTurista
    } = req.body;

    try {
        const query = `
            CALL editarTurista(
                pidTurista := $1,
                pidTipoDocumento := $2,
                pdocumentoTurista := $3,
                pprimerNombreTurista := $4,
                psegundoNombreTurista := $5,
                pprimerApellidoTurista := $6,
                psegundoApellidoTurista := $7,
                ptelefono := $8,
                pestadoTurista := $9
            );
        `;

        await pool.query(query, [
            idTurista,
            idTipoDocumento,
            documentoTurista,
            primerNombreTurista,
            segundoNombreTurista,
            primerApellidoTurista,
            segundoApellidoTurista,
            telefono,
            estadoTurista
        ]);

        res.status(200).json({ message: 'Turista editado exitosamente' });
    } catch (error) {
        console.error("Error al editar el turista:", error);
        res.status(500).json({ error: "Ocurrió un error al editar el turista" });
    }
};

module.exports = {
    createTurista,
    updateTurista,
    getTurista
}
