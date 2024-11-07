const pool = require("../db");


const loginUsuarios = async(req, res) => {
    const {email, contrasenaUsuario} = req.body;
    try {
        const query = `
            SELECT * FROM usuarios.iniciarSesion($1, $2);
        `;

        const result = await pool.query(query, [
            email,
            contrasenaUsuario
        ]);

        if(result.rows.length === 0) return res.status(401).json({
                message: 'Credenciales invalidas'
    })
        
        res.status(200).json(result.rows[0]);
    } catch (error) {
        console.log('Error al iniciar sesion:', error);
        res.status(500).json({error: 'Ocurrio un error al inicar sesion'})
        
    }
}

module.exports = {
    loginUsuarios
}