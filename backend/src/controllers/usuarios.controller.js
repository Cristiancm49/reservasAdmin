const pool = require("../db");

const updateUsuario = async(req, res) => {
    const { idUsuario } = req.params;
    const { nuevaContrasena } = req.body;

    try {
        const query = `
         call editarUsuario(
            pidUsuario := $1,
            pnuevaContrasena := $2 
         );
        `

        await pool.query(query,[idUsuario, nuevaContrasena]);
        res.status(200).json({
            message: 'Cambio de constrasena exitoso'
        });
        
    } catch (error) {
        console.log('Error al modificar el usuario:', error);
        res.status(500).json({error: 'Ocurrio un error al modificar el usuario'})
        
    }
}

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

const createUsuario = async (req, res) => {
    const { contrasenaUsuario, emailUsuario, idRol, estadoUsuario } = req.body;

    try {
        const query = `
            CALL crearUsuario(
                pcontrasenaUsuario := $1,
                pemailUsuario := $2,
                pidRol := $3,
                pestadoUsuario := $4
            );
        `;

        await pool.query(query, [
            contrasenaUsuario,
            emailUsuario,
            idRol,
            estadoUsuario
        ]);

        res.status(200).json({ message: 'Usuario creado exitosamente' });
    } catch (error) {
        console.error("Error al crear el usuario:", error);
        res.status(500).json({ error: "Ocurrió un error al crear el usuario" });
    }
};



module.exports = {
    loginUsuarios,
    updateUsuario,
    createUsuario
}