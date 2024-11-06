CREATE DATABASE reservas;

\c reservas;


-- CREACION DE LOS SCHEMAS PARA LA BASE DE DATOS

    CREATE SCHEMA usuarios;
    CREATE SCHEMA servicios;
    CREATE SCHEMA reservas;
    CREATE SCHEMA auditoria;

-- Creación de los tipos ENUM para los estados
    CREATE TYPE estado_activo_inactivo AS ENUM ('ACTIVO', 'INACTIVO');
    CREATE TYPE estado_publicada_editada AS ENUM ('PUBLICADA', 'ELIMINADA', 'EDITADA');
    CREATE TYPE estado_pago AS ENUM ('PAGADA', 'REEMBOLSADA', 'CANCELADA');
    CREATE TYPE estado_servicio AS ENUM ('DISPONIBLE', 'RESERVADO');
    CREATE TYPE calificacion AS ENUM ('1', '2', '3', '4', '5');
    CREATE TYPE estado_reserva AS ENUM('ACTIVA', 'CANCELADA', 'FINALIZADA');




-- CREACION DE LAS TABLAS

    -- TABLAS DE AUDITORIA
        -- Tabla de auditoría para la tabla usuarios.turista
            CREATE TABLE auditoria.turistaAuditoria(
                idAuditoriaTurista INT NOT NULL,
                usuario VARCHAR(25) NOT NULL,
                nombreTabla VARCHAR(50) NOT NULL,
                tipoOperacion VARCHAR(25) NOT NULL,
                fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
                datosAnteriores JSONB,
                datosNuevos JSONB
            );

            -- Tabla de auditoría para usuarios.tipoDocumento
            CREATE TABLE auditoria.tipoDocumentoAuditoria(
                idAuditoriaTipoDocumento INT NOT NULL,
                usuario VARCHAR(25) NOT NULL,
                nombreTabla VARCHAR(50) NOT NULL,
                tipoOperacion VARCHAR(25) NOT NULL,
                fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
                datosAnteriores JSONB,
                datosNuevos JSONB
            );

            -- Tabla de auditoría para usuarios.rol
            CREATE TABLE auditoria.rolAuditoria(
                idAuditoriaRol INT NOT NULL,
                usuario VARCHAR(25) NOT NULL,
                nombreTabla VARCHAR(50) NOT NULL,
                tipoOperacion VARCHAR(25) NOT NULL,
                fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
                datosAnteriores JSONB,
                datosNuevos JSONB
            );

            -- Tabla de auditoría para usuarios.municipio
            CREATE TABLE auditoria.municipioAuditoria(
                idAuditoriaMunicipio INT NOT NULL,
                usuario VARCHAR(25) NOT NULL,
                nombreTabla VARCHAR(50) NOT NULL,
                tipoOperacion VARCHAR(25) NOT NULL,
                fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
                datosAnteriores JSONB,
                datosNuevos JSONB
            );

            -- Tabla de auditoría para usuarios.departamento
            CREATE TABLE auditoria.departamentoAuditoria(
                idAuditoriaDepartamento INT NOT NULL,
                usuario VARCHAR(25) NOT NULL,
                nombreTabla VARCHAR(50) NOT NULL,
                tipoOperacion VARCHAR(25) NOT NULL,
                fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
                datosAnteriores JSONB,
                datosNuevos JSONB
            );

            -- Tabla de auditoría para usuarios.establecimiento
            CREATE TABLE auditoria.establecimientoAuditoria(
                idAuditoriaEstablecimiento INT NOT NULL,
                usuario VARCHAR(25) NOT NULL,
                nombreTabla VARCHAR(50) NOT NULL,
                tipoOperacion VARCHAR(25) NOT NULL,
                fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
                datosAnteriores JSONB,
                datosNuevos JSONB
            );

            -- Tabla de auditoría para usuarios.usuario
            CREATE TABLE auditoria.usuarioAuditoria(
                idAuditoriaUsuario INT NOT NULL,
                usuario VARCHAR(25) NOT NULL,
                nombreTabla VARCHAR(50) NOT NULL,
                tipoOperacion VARCHAR(25) NOT NULL,
                fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
                datosAnteriores JSONB,
                datosNuevos JSONB
            );

            -- Tabla de auditoría para reservas.resena
            CREATE TABLE auditoria.resenaAuditoria(
                idAuditoriaResena INT NOT NULL,
                usuario VARCHAR(25) NOT NULL,
                nombreTabla VARCHAR(50) NOT NULL,
                tipoOperacion VARCHAR(25) NOT NULL,
                fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
                datosAnteriores JSONB,
                datosNuevos JSONB
            );

            -- Tabla de auditoría para servicios.ubicacion
            CREATE TABLE auditoria.ubicacionAuditoria(
                idAuditoriaUbicacion INT NOT NULL,
                usuario VARCHAR(25) NOT NULL,
                nombreTabla VARCHAR(50) NOT NULL,
                tipoOperacion VARCHAR(25) NOT NULL,
                fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
                datosAnteriores JSONB,
                datosNuevos JSONB
            );

            -- Tabla de auditoría para reservas.metodoPago
            CREATE TABLE auditoria.metodoPagoAuditoria(
                idAuditoriaMetodoPago INT NOT NULL,
                usuario VARCHAR(25) NOT NULL,
                nombreTabla VARCHAR(50) NOT NULL,
                tipoOperacion VARCHAR(25) NOT NULL,
                fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
                datosAnteriores JSONB,
                datosNuevos JSONB
            );

            -- Tabla de auditoría para reservas.cuponesDescuento
            CREATE TABLE auditoria.cuponesDescuentoAuditoria(
                idAuditoriaCuponesDescuento INT NOT NULL,
                usuario VARCHAR(25) NOT NULL,
                nombreTabla VARCHAR(50) NOT NULL,
                tipoOperacion VARCHAR(25) NOT NULL,
                fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
                datosAnteriores JSONB,
                datosNuevos JSONB
            );

            -- Tabla de auditoría para reservas.facturaReserva
            CREATE TABLE auditoria.facturaReservaAuditoria(
                idAuditoriaFacturaReserva INT NOT NULL,
                usuario VARCHAR(25) NOT NULL,
                nombreTabla VARCHAR(50) NOT NULL,
                tipoOperacion VARCHAR(25) NOT NULL,
                fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
                datosAnteriores JSONB,
                datosNuevos JSONB
            );

            -- Tabla de auditoría para servicios.tipoServicio
            CREATE TABLE auditoria.tipoServicioAuditoria(
                idAuditoriaTipoServicio INT NOT NULL,
                usuario VARCHAR(25) NOT NULL,
                nombreTabla VARCHAR(50) NOT NULL,
                tipoOperacion VARCHAR(25) NOT NULL,
                fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
                datosAnteriores JSONB,
                datosNuevos JSONB
            );

            -- Tabla de auditoría para servicios.promocion
            CREATE TABLE auditoria.promocionAuditoria(
                idAuditoriaPromocion INT NOT NULL,
                usuario VARCHAR(25) NOT NULL,
                nombreTabla VARCHAR(50) NOT NULL,
                tipoOperacion VARCHAR(25) NOT NULL,
                fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
                datosAnteriores JSONB,
                datosNuevos JSONB
            );

            -- Tabla de auditoría para servicios.categoriaServicios
            CREATE TABLE auditoria.categoriaServiciosAuditoria(
                idAuditoriaCategoriaServicios INT NOT NULL,
                usuario VARCHAR(25) NOT NULL,
                nombreTabla VARCHAR(50) NOT NULL,
                tipoOperacion VARCHAR(25) NOT NULL,
                fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
                datosAnteriores JSONB,
                datosNuevos JSONB
            );

            -- Tabla de auditoría para servicios.serviciosCategoriaDetalle
            CREATE TABLE auditoria.serviciosCategoriaDetalleAuditoria(
                idAuditoriaServiciosCategoriaDetalle INT NOT NULL,
                usuario VARCHAR(25) NOT NULL,
                nombreTabla VARCHAR(50) NOT NULL,
                tipoOperacion VARCHAR(25) NOT NULL,
                fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
                datosAnteriores JSONB,
                datosNuevos JSONB
            );

            -- Tabla de auditoría para servicios.servicio
            CREATE TABLE auditoria.servicioAuditoria(
                idAuditoriaServicio INT NOT NULL,
                usuario VARCHAR(25) NOT NULL,
                nombreTabla VARCHAR(50) NOT NULL,
                tipoOperacion VARCHAR(25) NOT NULL,
                fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
                datosAnteriores JSONB,
                datosNuevos JSONB
            );

            -- Tabla de auditoría para reservas.reserva
            CREATE TABLE auditoria.reservaAuditoria(
                idAuditoriaReserva INT NOT NULL,
                usuario VARCHAR(25) NOT NULL,
                nombreTabla VARCHAR(50) NOT NULL,
                tipoOperacion VARCHAR(25) NOT NULL,
                fechaOperacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
                datosAnteriores JSONB,
                datosNuevos JSONB
            );



    CREATE TABLE usuarios.turista (
        idTurista INT NOT NULL,
        idTipoDocumento INT NOT NULL,
        estadoTurista estado_activo_inactivo NOT NULL,
        documentoTurista BIGINT NOT NULL,
        primerNombreTurista VARCHAR(50) NOT NULL,
        segundoNombreTurista VARCHAR(50),
        primerApellidoTurista VARCHAR(50) NOT NULL,
        segundoApellidoTurista VARCHAR(50),
        telefono VARCHAR(10) NOT NULL
    );

    CREATE TABLE usuarios.tipoDocumento (
        idTipoDocumento INT NOT NULL,
        tipoDocumento VARCHAR(50) NOT NULL,
        estadoTipoDocumento estado_activo_inactivo NOT NULL
    );

    CREATE TABLE usuarios.rol (
        idRol INT NOT NULL,
        nombreRol VARCHAR(50) NOT NULL,
        estadoRol estado_activo_inactivo NOT NULL
    );

    CREATE TABLE usuarios.municipio (
        idMunicipio INT NOT NULL,
        nombreMunicipio VARCHAR(50) NOT NULL,
        idDepartamento INT NOT NULL,
        estadoMunicipio estado_activo_inactivo NOT NULL
    );

    CREATE TABLE usuarios.departamento (
        idDepartamento INT NOT NULL,
        nombreDepartamento VARCHAR(50) NOT NULL,
        estadoDepartamento estado_activo_inactivo NOT NULL
    );


    CREATE TABLE usuarios.establecimiento (
        idEstablecimiento INT NOT NULL,
        nombreEstablecimiento VARCHAR(100) NOT NULL,
        nit BIGINT NOT NULL,
        Email VARCHAR(100) NOT NULL,
        idUbicacion INT NOT NULL,
        estadoEstablecimiento estado_activo_inactivo NOT NULL
    );

    CREATE TABLE usuarios.usuario (
        idUsuario INT NOT NULL,
        ContrasenaUsuario VARCHAR(12) NOT NULL,
        Email VARCHAR(100) NOT NULL,
        idTurista INT UNIQUE, -- Relación 1:1 con turista
        idEstablecimiento INT UNIQUE, -- Relación 1:1 con establecimiento
        idRol INT NOT NULL NOT NULL,
        estadoUsuario estado_activo_inactivo NOT NULL
    );



    CREATE TABLE reservas.resena (
        idResena INT NOT NULL,
        ContenidoResena TEXT NOT NULL,
        Calificacion calificacion NOT NULL,
        idReserva INT UNIQUE NOT NULL, -- Relación 1:1 con reserva
        estadoResena estado_publicada_editada NOT NULL
    );


    CREATE TABLE servicios.ubicacion (
        idUbicacion INT NOT NULL,
        idMunicipio INT NOT NULL,
        calle VARCHAR(50) NOT NULL,
        numero VARCHAR(50) NOT NULL,
        InformacionAdicional TEXT,
        estadoUbicacion estado_activo_inactivo NOT NULL
    );



    CREATE TABLE reservas.metodoPago (
        idMetodoPago INT NOT NULL,
        nombreMetodoPago VARCHAR(50) NOT NULL,
        estadoMetodoPago estado_activo_inactivo NOT NULL
    );


    CREATE TABLE reservas.cuponesDescuento (
        idCuponDescuento INT NOT NULL,
        codigoCupon VARCHAR(8) NOT NULL,
        cantidadDescuento INT NOT NULL,
        detalleCuponDescuento TEXT NOT NULL,
        estadoCuponDescuento estado_activo_inactivo NOT NULL
    );



    CREATE TABLE reservas.facturaReserva (
        idFacturaReserva INT NOT NULL,
        FechaEmisionFactura DATE NOT NULL,
        MontoTotal DECIMAL(10,2) NOT NULL,
        idReserva INT NOT NULL,
        estadoFacturaReserva estado_pago NOT NULL
    );



    CREATE TABLE servicios.tipoServicio (
        idTipoServicio INT NOT NULL,
        tipo VARCHAR(50) NOT NULL,
        estadoTipoServicio estado_activo_inactivo NOT NULL
    );



    CREATE TABLE servicios.promocion (
        idPromocion INT NOT NULL,
        descripcion TEXT NOT NULL,
        PorcentajeDescuento INT NOT NULL,
        fechaInicio DATE NOT NULL,
        fechaFinal DATE NOT NULL,
        estadoPromocion estado_activo_inactivo NOT NULL
    );



    CREATE TABLE servicios.categoriaServicios (
        idCategoriaServicio INT NOT NULL,
        descripcion TEXT NOT NULL,
        nombreCategoria VARCHAR(100) NOT NULL,
        estadoCategoriaServicio estado_activo_inactivo NOT NULL
    );





    CREATE TABLE servicios.serviciosCategoriaDetalle (
        idServicioCategoriaDetalle INT NOT NULL,
        Descripcion TEXT NOT NULL,
        idCategoriaServicio INT NOT NULL,
        idServicio INT NOT NULL,
        estadoServicioCategoriaDetalle estado_activo_inactivo NOT NULL
    );



    CREATE TABLE servicios.servicio (
        idServicio INT NOT NULL,
        nombreServicio VARCHAR(50) NOT NULL,
        DescripcionServicio TEXT NOT NULL,
        precioServicio DECIMAL(10,2) NOT NULL,
        idTipoServicio INT NOT NULL,
        idPromocion INT NOT NULL,
        cupoMaximaReservas INT NOT NULL,
        idEstablecimiento INT NOT NULL,
        limiteMaxPersonas INT NOT NULL,
        estadoServicio estado_servicio NOT NULL
    );


    CREATE TABLE reservas.reserva (
        idReserva INT NOT NULL,
        cantidadPersonas INT NOT NULL,
        fechaReserva DATE NOT NULL,
        fechaSalida DATE NOT NULL,
        fechaRegreso DATE NOT NULL,
        totalPago DECIMAL(10,2) NOT NULL,
        idTurista INT NOT NULL,
        idServicio INT NOT NULL,
        idMetodoDePago INT NOT NULL,
        idCuponDescuento INT,
        estadoReserva estado_reserva NOT NULL
    );

--- CREACION DE SECUENCIA DE ID PARA LAS TABLAS
    -- Secuencias para las tablas de usuarios
        CREATE SEQUENCE secuenciaIdTurista START WITH 1 INCREMENT BY 1 MINVALUE 1 NO MAXVALUE CACHE 1;
        CREATE SEQUENCE secuenciaIdtipoDocumento START WITH 1 INCREMENT BY 1 MINVALUE 1 NO MAXVALUE CACHE 1;
        CREATE SEQUENCE secuenciaIdMunicipio START WITH 1 INCREMENT BY 1 MINVALUE 1 NO MAXVALUE CACHE 1;
        CREATE SEQUENCE secuenciaIdDepartamento START WITH 1 INCREMENT BY 1 MINVALUE 1 NO MAXVALUE CACHE 1;
        CREATE SEQUENCE secuenciaIdEstablecimiento START WITH 1 INCREMENT BY 1 MINVALUE 1 NO MAXVALUE CACHE 1;
        CREATE SEQUENCE secuenciaIdUsuario START WITH 1 INCREMENT BY 1 MINVALUE 1 NO MAXVALUE CACHE 1;
        CREATE SEQUENCE secuenciaIdRol START WITH 1 INCREMENT BY 1 MINVALUE 1 NO MAXVALUE CACHE 1; 

    -- Secuencias para las tablas de reservas
        CREATE SEQUENCE secuenciaIdResena START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;
        CREATE SEQUENCE secuenciaIdMetodoPago START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;
        CREATE SEQUENCE secuenciaIdCuponDescuento START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;
        CREATE SEQUENCE secuenciaIdFacturaReserva START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;
        CREATE SEQUENCE secuenciaIdReserva START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;

    -- Secuencias para las tablas de servicios
        CREATE SEQUENCE secuenciaIdUbicacion START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;
        CREATE SEQUENCE secuenciaIdTipoServicio START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;
        CREATE SEQUENCE secuenciaIdPromocion START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;
        CREATE SEQUENCE secuenciaIdCategoriaServicio START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;
        CREATE SEQUENCE secuenciaIdServicioCategoriaDetalle START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;
        CREATE SEQUENCE secuenciaIdServicio START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;

    -- Secuencias para las tablas de auditoria

    -- Secuencia y alteración para auditoriaTurista
-- Secuencia y alteración para turistaAuditoria
    CREATE SEQUENCE secuenciaIdAuditoriaTurista START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;
    ALTER TABLE auditoria.turistaAuditoria
        ADD CONSTRAINT pkIdAuditoriaTurista PRIMARY KEY (idAuditoriaTurista),
        ALTER COLUMN idAuditoriaTurista SET DEFAULT nextval('secuenciaIdAuditoriaTurista');

    -- Secuencia y alteración para tipoDocumentoAuditoria
    CREATE SEQUENCE secuenciaIdAuditoriaTipoDocumento START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;
    ALTER TABLE auditoria.tipoDocumentoAuditoria
        ADD CONSTRAINT pkIdAuditoriaTipoDocumento PRIMARY KEY (idAuditoriaTipoDocumento),
        ALTER COLUMN idAuditoriaTipoDocumento SET DEFAULT nextval('secuenciaIdAuditoriaTipoDocumento');

    -- Secuencia y alteración para rolAuditoria
    CREATE SEQUENCE secuenciaIdAuditoriaRol START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;
    ALTER TABLE auditoria.rolAuditoria
        ADD CONSTRAINT pkIdAuditoriaRol PRIMARY KEY (idAuditoriaRol),
        ALTER COLUMN idAuditoriaRol SET DEFAULT nextval('secuenciaIdAuditoriaRol');

    -- Secuencia y alteración para municipioAuditoria
    CREATE SEQUENCE secuenciaIdAuditoriaMunicipio START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;
    ALTER TABLE auditoria.municipioAuditoria
        ADD CONSTRAINT pkIdAuditoriaMunicipio PRIMARY KEY (idAuditoriaMunicipio),
        ALTER COLUMN idAuditoriaMunicipio SET DEFAULT nextval('secuenciaIdAuditoriaMunicipio');

    -- Secuencia y alteración para departamentoAuditoria
    CREATE SEQUENCE secuenciaIdAuditoriaDepartamento START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;
    ALTER TABLE auditoria.departamentoAuditoria
        ADD CONSTRAINT pkIdAuditoriaDepartamento PRIMARY KEY (idAuditoriaDepartamento),
        ALTER COLUMN idAuditoriaDepartamento SET DEFAULT nextval('secuenciaIdAuditoriaDepartamento');

    -- Secuencia y alteración para establecimientoAuditoria
    CREATE SEQUENCE secuenciaIdAuditoriaEstablecimiento START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;
    ALTER TABLE auditoria.establecimientoAuditoria
        ADD CONSTRAINT pkIdAuditoriaEstablecimiento PRIMARY KEY (idAuditoriaEstablecimiento),
        ALTER COLUMN idAuditoriaEstablecimiento SET DEFAULT nextval('secuenciaIdAuditoriaEstablecimiento');

    -- Secuencia y alteración para usuarioAuditoria
    CREATE SEQUENCE secuenciaIdAuditoriaUsuario START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;
    ALTER TABLE auditoria.usuarioAuditoria
        ADD CONSTRAINT pkIdAuditoriaUsuario PRIMARY KEY (idAuditoriaUsuario),
        ALTER COLUMN idAuditoriaUsuario SET DEFAULT nextval('secuenciaIdAuditoriaUsuario');

    -- Secuencia y alteración para resenaAuditoria
    CREATE SEQUENCE secuenciaIdAuditoriaResena START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;
    ALTER TABLE auditoria.resenaAuditoria
        ADD CONSTRAINT pkIdAuditoriaResena PRIMARY KEY (idAuditoriaResena),
        ALTER COLUMN idAuditoriaResena SET DEFAULT nextval('secuenciaIdAuditoriaResena');

    -- Secuencia y alteración para ubicacionAuditoria
    CREATE SEQUENCE secuenciaIdAuditoriaUbicacion START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;
    ALTER TABLE auditoria.ubicacionAuditoria
        ADD CONSTRAINT pkIdAuditoriaUbicacion PRIMARY KEY (idAuditoriaUbicacion),
        ALTER COLUMN idAuditoriaUbicacion SET DEFAULT nextval('secuenciaIdAuditoriaUbicacion');

    -- Secuencia y alteración para metodoPagoAuditoria
    CREATE SEQUENCE secuenciaIdAuditoriaMetodoPago START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;
    ALTER TABLE auditoria.metodoPagoAuditoria
        ADD CONSTRAINT pkIdAuditoriaMetodoPago PRIMARY KEY (idAuditoriaMetodoPago),
        ALTER COLUMN idAuditoriaMetodoPago SET DEFAULT nextval('secuenciaIdAuditoriaMetodoPago');

    -- Secuencia y alteración para cuponesDescuentoAuditoria
    CREATE SEQUENCE secuenciaIdAuditoriaCuponesDescuento START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;
    ALTER TABLE auditoria.cuponesDescuentoAuditoria
        ADD CONSTRAINT pkIdAuditoriaCuponesDescuento PRIMARY KEY (idAuditoriaCuponesDescuento),
        ALTER COLUMN idAuditoriaCuponesDescuento SET DEFAULT nextval('secuenciaIdAuditoriaCuponesDescuento');

    -- Secuencia y alteración para facturaReservaAuditoria
    CREATE SEQUENCE secuenciaIdAuditoriaFacturaReserva START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;
    ALTER TABLE auditoria.facturaReservaAuditoria
        ADD CONSTRAINT pkIdAuditoriaFacturaReserva PRIMARY KEY (idAuditoriaFacturaReserva),
        ALTER COLUMN idAuditoriaFacturaReserva SET DEFAULT nextval('secuenciaIdAuditoriaFacturaReserva');

    -- Secuencia y alteración para tipoServicioAuditoria
    CREATE SEQUENCE secuenciaIdAuditoriaTipoServicio START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;
    ALTER TABLE auditoria.tipoServicioAuditoria
        ADD CONSTRAINT pkIdAuditoriaTipoServicio PRIMARY KEY (idAuditoriaTipoServicio),
        ALTER COLUMN idAuditoriaTipoServicio SET DEFAULT nextval('secuenciaIdAuditoriaTipoServicio');

    -- Secuencia y alteración para promocionAuditoria
    CREATE SEQUENCE secuenciaIdAuditoriaPromocion START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;
    ALTER TABLE auditoria.promocionAuditoria
        ADD CONSTRAINT pkIdAuditoriaPromocion PRIMARY KEY (idAuditoriaPromocion),
        ALTER COLUMN idAuditoriaPromocion SET DEFAULT nextval('secuenciaIdAuditoriaPromocion');

    -- Secuencia y alteración para categoriaServiciosAuditoria
    CREATE SEQUENCE secuenciaIdAuditoriaCategoriaServicios START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;
    ALTER TABLE auditoria.categoriaServiciosAuditoria
        ADD CONSTRAINT pkIdAuditoriaCategoriaServicios PRIMARY KEY (idAuditoriaCategoriaServicios),
        ALTER COLUMN idAuditoriaCategoriaServicios SET DEFAULT nextval('secuenciaIdAuditoriaCategoriaServicios');

    -- Secuencia y alteración para serviciosCategoriaDetalleAuditoria
    CREATE SEQUENCE secuenciaIdAuditoriaServiciosCategoriaDetalle START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;
    ALTER TABLE auditoria.serviciosCategoriaDetalleAuditoria
        ADD CONSTRAINT pkIdAuditoriaServiciosCategoriaDetalle PRIMARY KEY (idAuditoriaServiciosCategoriaDetalle),
        ALTER COLUMN idAuditoriaServiciosCategoriaDetalle SET DEFAULT nextval('secuenciaIdAuditoriaServiciosCategoriaDetalle');

    -- Secuencia y alteración para servicioAuditoria
    CREATE SEQUENCE secuenciaIdAuditoriaServicio START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;
    ALTER TABLE auditoria.servicioAuditoria
        ADD CONSTRAINT pkIdAuditoriaServicio PRIMARY KEY (idAuditoriaServicio),
        ALTER COLUMN idAuditoriaServicio SET DEFAULT nextval('secuenciaIdAuditoriaServicio');

    -- Secuencia y alteración para reservaAuditoria
    CREATE SEQUENCE secuenciaIdAuditoriaReserva START WITH 1 INCREMENT BY 1 NO MAXVALUE CACHE 1;
    ALTER TABLE auditoria.reservaAuditoria
        ADD CONSTRAINT pkIdAuditoriaReserva PRIMARY KEY (idAuditoriaReserva),
        ALTER COLUMN idAuditoriaReserva SET DEFAULT nextval('secuenciaIdAuditoriaReserva');



-- CREACION DE ROLES
    CREATE ROLE usuarioRol;
    CREATE ROLE desarrolloRol;
    CREATE ROLE administradorRol;

-- CREACION DE USUARIOS Y ASIGNACION DE ROLES
    CREATE USER appUsuario WITH PASSWORD '40727501';
    CREATE USER devUsuario WITH PASSWORD '1518';
    CREATE USER admUsuario WITH PASSWORD 'qwerty';

    GRANT devUsuario TO desarrolloRol;
    GRANT usuarioRol TO appUsuario;
    GRANT admUsuario TO administradorRol;
        
-- ESTABLECER LOS PERMISOS EN LAS TABLAS
    -- PERMISOS PARA USUARIOS
    -- Permisos completos (SELECT, INSERT, UPDATE, DELETE) para tablas específicas
        GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE usuarios.usuario TO usuarioRol;
        GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE usuarios.turista TO usuarioRol;
        GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE servicios.ubicacion TO usuarioRol;
        GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE reservas.resena TO usuarioRol;
        GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE usuarios.establecimiento TO usuarioRol;
        GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE servicios.servicio TO usuarioRol;
        GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE reservas.reserva TO usuarioRol;

        GRANT SELECT ON TABLE usuarios.tipoDocumento TO usuarioRol;
        GRANT SELECT ON TABLE usuarios.rol TO usuarioRol;
        GRANT SELECT ON TABLE usuarios.municipio TO usuarioRol;
        GRANT SELECT ON TABLE usuarios.departamento TO usuarioRol;

        GRANT SELECT ON TABLE servicios.tipoServicio TO usuarioRol;
        GRANT SELECT ON TABLE servicios.promocion TO usuarioRol;
        GRANT SELECT ON TABLE servicios.categoriaServicios TO usuarioRol;
        GRANT SELECT ON TABLE servicios.serviciosCategoriaDetalle TO usuarioRol;

        GRANT SELECT ON TABLE reservas.metodoPago TO usuarioRol;
        GRANT SELECT ON TABLE reservas.cuponesDescuento TO usuarioRol;
        GRANT SELECT ON TABLE reservas.facturaReserva TO usuarioRol;


        GRANT SELECT ON TABLE reservas.metodoPago TO usuarioRol;
        GRANT SELECT ON TABLE reservas.cuponesDescuento TO usuarioRol;
        GRANT SELECT ON TABLE reservas.facturaReserva TO usuarioRol;

        

    -- PERMISOS PARA DESARROLLADOR
        GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE usuarios.turista TO desarrolloRol;
        GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE usuarios.tipoDocumento TO desarrolloRol;
        GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE usuarios.rol TO desarrolloRol;
        GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE usuarios.municipio TO desarrolloRol;
        GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE usuarios.departamento TO desarrolloRol;
        GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE usuarios.usuario TO desarrolloRol;
        GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE usuarios.establecimiento TO desarrolloRol;

        GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE servicios.ubicacion TO desarrolloRol;
        GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE servicios.tipoServicio TO desarrolloRol;
        GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE servicios.promocion TO desarrolloRol;
        GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE servicios.categoriaServicios TO desarrolloRol;
        GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE servicios.serviciosCategoriaDetalle TO desarrolloRol;
        GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE servicios.servicio TO desarrolloRol;

        GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE reservas.metodoPago TO desarrolloRol;
        GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE reservas.resena TO desarrolloRol;
        GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE reservas.cuponesDescuento TO desarrolloRol;
        GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE reservas.facturaReserva TO desarrolloRol;
        GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE reservas.reserva TO desarrolloRol;

    -- PERMISOS PARA ADMINISTRADOR
        GRANT ALL PRIVILEGES ON TABLE usuarios.turista TO administradorRol;
        GRANT ALL PRIVILEGES ON TABLE usuarios.tipoDocumento TO administradorRol;
        GRANT ALL PRIVILEGES ON TABLE usuarios.rol TO administradorRol;
        GRANT ALL PRIVILEGES ON TABLE usuarios.municipio TO administradorRol;
        GRANT ALL PRIVILEGES ON TABLE usuarios.departamento TO administradorRol;
        GRANT ALL PRIVILEGES ON TABLE usuarios.usuario TO administradorRol;
        GRANT ALL PRIVILEGES ON TABLE usuarios.establecimiento TO administradorRol;

        GRANT ALL PRIVILEGES ON TABLE servicios.ubicacion TO administradorRol;
        GRANT ALL PRIVILEGES ON TABLE servicios.tipoServicio TO administradorRol;
        GRANT ALL PRIVILEGES ON TABLE servicios.promocion TO administradorRol;
        GRANT ALL PRIVILEGES ON TABLE servicios.categoriaServicios TO administradorRol;
        GRANT ALL PRIVILEGES ON TABLE servicios.serviciosCategoriaDetalle TO administradorRol;
        GRANT ALL PRIVILEGES ON TABLE servicios.servicio TO administradorRol;

        GRANT ALL PRIVILEGES ON TABLE reservas.metodoPago TO administradorRol;
        GRANT ALL PRIVILEGES ON TABLE reservas.resena TO administradorRol;
        GRANT ALL PRIVILEGES ON TABLE reservas.cuponesDescuento TO administradorRol;
        GRANT ALL PRIVILEGES ON TABLE reservas.facturaReserva TO administradorRol;
        GRANT ALL PRIVILEGES ON TABLE reservas.reserva TO administradorRol;


-- ESTABLECER LAS LLAVES PRIMARIAS DE LAS TABLAS CON LAS SECUENCIAS   

    ALTER TABLE usuarios.turista
    ADD CONSTRAINT pkTurista PRIMARY KEY (idTurista),
    ALTER COLUMN idTurista SET DEFAULT nextval('secuenciaIdTurista');

    ALTER TABLE reservas.reserva
    ADD CONSTRAINT pkReservas PRIMARY KEY (idReserva),
    ALTER COLUMN idReserva SET DEFAULT nextval('secuenciaIdReserva');

    ALTER TABLE servicios.servicio
    ADD CONSTRAINT pkServicios PRIMARY KEY (idServicio),
    ALTER COLUMN idServicio SET DEFAULT nextval('secuenciaIdServicio');
    
    ALTER TABLE usuarios.tipoDocumento
    ADD CONSTRAINT pkIdTipoDocumento PRIMARY KEY (idTipoDocumento),
    ALTER COLUMN idTipoDocumento SET DEFAULT nextval('secuenciaIdtipoDocumento');
    
    ALTER TABLE usuarios.rol
    ADD CONSTRAINT pkRol PRIMARY KEY (idRol),
    ALTER COLUMN idRol SET DEFAULT nextval('secuenciaIdRol');
    
    ALTER TABLE servicios.ubicacion
    ADD CONSTRAINT pkIdUbicacion PRIMARY KEY (idUbicacion),
    ALTER COLUMN idUbicacion SET DEFAULT nextval('secuenciaIdUbicacion');

    ALTER TABLE reservas.metodoPago
    ADD CONSTRAINT pkMetodoPago PRIMARY KEY (idMetodoPago),
    ALTER COLUMN idMetodoPago SET DEFAULT nextval('secuenciaIdMetodoPago');

    ALTER TABLE usuarios.municipio 
    ADD CONSTRAINT pkMunicipio PRIMARY KEY (idMunicipio),
    ALTER COLUMN idMunicipio SET DEFAULT nextval('secuenciaIdMunicipio');

    ALTER TABLE usuarios.departamento 
    ADD CONSTRAINT pkDepartamento PRIMARY KEY (idDepartamento),
    ALTER COLUMN idDepartamento SET DEFAULT nextval('secuenciaIdDepartamento');

    ALTER TABLE usuarios.usuario 
    ADD CONSTRAINT pkUsuario PRIMARY KEY (idUsuario),
    ALTER COLUMN idUsuario SET DEFAULT nextval('secuenciaIdUsuario');

    ALTER TABLE reservas.resena 
    ADD CONSTRAINT pkResena PRIMARY KEY (idResena),
    ALTER COLUMN idResena SET DEFAULT nextval('secuenciaIdResena');

    ALTER TABLE reservas.cuponesDescuento
    ADD CONSTRAINT pkCuponesDescuento PRIMARY KEY (idCuponDescuento),
    ALTER COLUMN idCuponDescuento SET DEFAULT nextval('secuenciaIdCuponDescuento');

    ALTER TABLE reservas.facturaReserva
    ADD CONSTRAINT pkFacturaReserva PRIMARY KEY (idFacturaReserva),
    ALTER COLUMN idFacturaReserva SET DEFAULT nextval('secuenciaIdFacturaReserva');

    ALTER TABLE servicios.tipoServicio
    ADD CONSTRAINT pkTipoServicio PRIMARY KEY (idTipoServicio),
    ALTER COLUMN idTipoServicio SET DEFAULT nextval('secuenciaIdTipoServicio');
    
    ALTER TABLE servicios.promocion
    ADD CONSTRAINT pkPromocion PRIMARY KEY (idPromocion),
    ALTER COLUMN idPromocion SET DEFAULT nextval('secuenciaIdPromocion');

    ALTER TABLE servicios.categoriaServicios
    ADD CONSTRAINT pkCategoriaServicio PRIMARY KEY (idCategoriaServicio),
    ALTER COLUMN idCategoriaServicio SET DEFAULT nextval('secuenciaIdCategoriaServicio');

    ALTER TABLE usuarios.establecimiento 
    ADD CONSTRAINT pkEstablecimiento PRIMARY KEY (idEstablecimiento),
    ALTER COLUMN idEstablecimiento SET DEFAULT nextval('secuenciaIdEstablecimiento');

    ALTER TABLE servicios.serviciosCategoriaDetalle
    ADD CONSTRAINT pkServicioCategoriaDetalle PRIMARY KEY (idServicioCategoriaDetalle),
    ALTER COLUMN idServicioCategoriaDetalle SET DEFAULT nextval('secuenciaIdServicioCategoriaDetalle');




-- ESTABLECER LLAVES FORANEAS
    ALTER TABLE usuarios.usuario
    ADD CONSTRAINT uq_usuario_turista UNIQUE (idTurista),
    ADD CONSTRAINT uq_usuario_establecimiento UNIQUE (idEstablecimiento);


    ALTER TABLE usuarios.turista
    ADD CONSTRAINT fk_turista_tipoDocumento FOREIGN KEY (idTipoDocumento) REFERENCES usuarios.tipoDocumento(idTipoDocumento);

    ALTER TABLE usuarios.usuario
    ADD CONSTRAINT fk_usuario_turista FOREIGN KEY (idTurista) REFERENCES usuarios.turista(idTurista),
    ADD CONSTRAINT fk_usuario_establecimiento FOREIGN KEY (idEstablecimiento) REFERENCES usuarios.establecimiento(idEstablecimiento),
    ADD CONSTRAINT fk_usuario_rol FOREIGN KEY (idRol) REFERENCES usuarios.rol(idRol);

    ALTER TABLE usuarios.municipio
    ADD CONSTRAINT fk_municipio_departamento FOREIGN KEY (idDepartamento) REFERENCES usuarios.departamento(idDepartamento);

    ALTER TABLE servicios.ubicacion
    ADD CONSTRAINT fk_ubicacion_municipio FOREIGN KEY (idMunicipio) REFERENCES usuarios.municipio(idMunicipio);

    ALTER TABLE usuarios.establecimiento
    ADD CONSTRAINT fk_establecimiento_ubicacion FOREIGN KEY (idUbicacion) REFERENCES servicios.ubicacion(idUbicacion);

    ALTER TABLE servicios.servicio
    ADD CONSTRAINT fk_servicio_tipoServicio FOREIGN KEY (idTipoServicio) REFERENCES servicios.tipoServicio(idTipoServicio),
    ADD CONSTRAINT fk_servicio_promocion FOREIGN KEY (idPromocion) REFERENCES servicios.promocion(idPromocion),
    ADD CONSTRAINT fk_servicio_establecimiento FOREIGN KEY (idEstablecimiento) REFERENCES usuarios.establecimiento(idEstablecimiento);


    ALTER TABLE servicios.serviciosCategoriaDetalle
    ADD CONSTRAINT fk_servicios_categoriaDetalle_categoria FOREIGN KEY (idCategoriaServicio) REFERENCES servicios.categoriaServicios(idCategoriaServicio),
    ADD CONSTRAINT fk_servicios_categoriaDetalle_servicio FOREIGN KEY (idServicio) REFERENCES servicios.servicio(idServicio);

    ALTER TABLE reservas.reserva
    ADD CONSTRAINT fk_reserva_metodoPago FOREIGN KEY (idMetodoDePago) REFERENCES reservas.metodoPago(idMetodoPago);

    ALTER TABLE reservas.resena
    ADD CONSTRAINT uq_resena_reserva UNIQUE (idReserva);
    ALTER TABLE reservas.resena
    ADD CONSTRAINT fk_resena_reserva FOREIGN KEY (idReserva) REFERENCES reservas.reserva(idReserva);

    ALTER TABLE reservas.reserva
    ADD CONSTRAINT fk_reserva_turista FOREIGN KEY (idTurista) REFERENCES usuarios.turista(idTurista),
    ADD CONSTRAINT fk_reserva_cupon FOREIGN KEY (idCuponDescuento) REFERENCES reservas.cuponesDescuento(idCuponDescuento),
    ADD CONSTRAINT fk_reserva_servicio FOREIGN KEY (idServicio) REFERENCES servicios.servicio(idServicio);

    ALTER TABLE reservas.facturaReserva
    ADD CONSTRAINT fk_facturaReserva_reserva FOREIGN KEY (idReserva) REFERENCES reservas.reserva(idReserva);

-- SE HACE CREACION DE TABLAS DE AUDITORIA CON SUS TRIGGERS Y FUNCIONES

    -- FUNCIONES DE AUDITORIA

        -- Función para Auditoría de INSERT

            CREATE OR REPLACE FUNCTION registroAuditoriaInsert()
            RETURNS trigger AS $$
            BEGIN
                EXECUTE format(
                    'INSERT INTO auditoria.%I(
                        usuario,
                        nombreTabla,
                        tipoOperacion,
                        fechaOperacion,
                        datosNuevos
                    ) VALUES ($1, $2, $3, $4, $5)',
                    TG_TABLE_NAME || 'auditoria'
                )
                USING CURRENT_USER, TG_TABLE_NAME, TG_OP, NOW(), row_to_json(NEW)::JSONB;

                RETURN NEW;
            END;
            $$ LANGUAGE plpgsql;


        -- Función para Auditoría de UPDATE

            CREATE OR REPLACE FUNCTION registroAuditoriaUpdate()
            RETURNS trigger AS $$
            BEGIN
                EXECUTE format(
                    'INSERT INTO auditoria.%I(
                        usuario,
                        nombreTabla,
                        tipoOperacion,
                        fechaOperacion,
                        datosAnteriores,
                        datosNuevos
                    ) VALUES ($1, $2, $3, $4, $5, $6)',
                    TG_TABLE_NAME || 'auditoria'
                )
                USING CURRENT_USER, TG_TABLE_NAME, TG_OP, NOW(), row_to_json(OLD)::JSONB, row_to_json(NEW)::JSONB;

                RETURN NEW;
            END;
            $$ LANGUAGE plpgsql;


        -- Función para Auditoría de DELETE

            CREATE OR REPLACE FUNCTION registroAuditoriaDelete()
            RETURNS trigger AS $$
            BEGIN
                EXECUTE format(
                    'INSERT INTO auditoria.%I(
                        usuario,
                        nombreTabla,
                        tipoOperacion,
                        fechaOperacion,
                        datosAnteriores
                    ) VALUES ($1, $2, $3, $4, $5)',
                    TG_TABLE_NAME || 'auditoria'
                )
                USING CURRENT_USER, TG_TABLE_NAME, TG_OP, NOW(), row_to_json(OLD)::JSONB;

                RETURN OLD;
            END;
            $$ LANGUAGE plpgsql;


    -- TRIGGERS PARA LOS CAMBIOS DE LAS TABLAS

        CREATE TRIGGER turistaAuditoriaInsert
        AFTER INSERT ON usuarios.turista
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaInsert();

        CREATE TRIGGER turistaAuditoriaUpdate
        AFTER UPDATE ON usuarios.turista
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaUpdate();

        CREATE TRIGGER turistaAuditoriaDelete
        AFTER DELETE ON usuarios.turista
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaDelete();

        -- Triggers para la tabla usuarios.tipoDocumento
        CREATE TRIGGER tipoDocumentoAuditoriaInsert
        AFTER INSERT ON usuarios.tipoDocumento
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaInsert();

        CREATE TRIGGER tipoDocumentoAuditoriaUpdate
        AFTER UPDATE ON usuarios.tipoDocumento
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaUpdate();

        CREATE TRIGGER tipoDocumentoAuditoriaDelete
        AFTER DELETE ON usuarios.tipoDocumento
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaDelete();

        -- Triggers para la tabla usuarios.rol
        CREATE TRIGGER rolAuditoriaInsert
        AFTER INSERT ON usuarios.rol
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaInsert();

        CREATE TRIGGER rolAuditoriaUpdate
        AFTER UPDATE ON usuarios.rol
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaUpdate();

        CREATE TRIGGER rolAuditoriaDelete
        AFTER DELETE ON usuarios.rol
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaDelete();

        -- Triggers para la tabla usuarios.municipio
        CREATE TRIGGER municipioAuditoriaInsert
        AFTER INSERT ON usuarios.municipio
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaInsert();

        CREATE TRIGGER municipioAuditoriaUpdate
        AFTER UPDATE ON usuarios.municipio
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaUpdate();

        CREATE TRIGGER municipioAuditoriaDelete
        AFTER DELETE ON usuarios.municipio
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaDelete();

        -- Triggers para la tabla usuarios.departamento
        CREATE TRIGGER departamentoAuditoriaInsert
        AFTER INSERT ON usuarios.departamento
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaInsert();

        CREATE TRIGGER departamentoAuditoriaUpdate
        AFTER UPDATE ON usuarios.departamento
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaUpdate();

        CREATE TRIGGER departamentoAuditoriaDelete
        AFTER DELETE ON usuarios.departamento
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaDelete();

        -- Triggers para la tabla usuarios.establecimiento
        CREATE TRIGGER establecimientoAuditoriaInsert
        AFTER INSERT ON usuarios.establecimiento
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaInsert();

        CREATE TRIGGER establecimientoAuditoriaUpdate
        AFTER UPDATE ON usuarios.establecimiento
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaUpdate();

        CREATE TRIGGER establecimientoAuditoriaDelete
        AFTER DELETE ON usuarios.establecimiento
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaDelete();

        -- Triggers para la tabla usuarios.usuario
        CREATE TRIGGER usuarioAuditoriaInsert
        AFTER INSERT ON usuarios.usuario
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaInsert();

        CREATE TRIGGER usuarioAuditoriaUpdate
        AFTER UPDATE ON usuarios.usuario
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaUpdate();

        CREATE TRIGGER usuarioAuditoriaDelete
        AFTER DELETE ON usuarios.usuario
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaDelete();

        -- Triggers para la tabla reservas.resena
        CREATE TRIGGER resenaAuditoriaInsert
        AFTER INSERT ON reservas.resena
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaInsert();

        CREATE TRIGGER resenaAuditoriaUpdate
        AFTER UPDATE ON reservas.resena
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaUpdate();

        CREATE TRIGGER resenaAuditoriaDelete
        AFTER DELETE ON reservas.resena
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaDelete();

        -- Triggers para la tabla servicios.ubicacion
        CREATE TRIGGER ubicacionAuditoriaInsert
        AFTER INSERT ON servicios.ubicacion
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaInsert();

        CREATE TRIGGER ubicacionAuditoriaUpdate
        AFTER UPDATE ON servicios.ubicacion
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaUpdate();

        CREATE TRIGGER ubicacionAuditoriaDelete
        AFTER DELETE ON servicios.ubicacion
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaDelete();

        -- Triggers para la tabla reservas.metodoPago
        CREATE TRIGGER metodoPagoAuditoriaInsert
        AFTER INSERT ON reservas.metodoPago
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaInsert();

        CREATE TRIGGER metodoPagoAuditoriaUpdate
        AFTER UPDATE ON reservas.metodoPago
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaUpdate();

        CREATE TRIGGER metodoPagoAuditoriaDelete
        AFTER DELETE ON reservas.metodoPago
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaDelete();

        -- Triggers para la tabla reservas.cuponesDescuento
        CREATE TRIGGER cuponesDescuentoAuditoriaInsert
        AFTER INSERT ON reservas.cuponesDescuento
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaInsert();

        CREATE TRIGGER cuponesDescuentoAuditoriaUpdate
        AFTER UPDATE ON reservas.cuponesDescuento
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaUpdate();

        CREATE TRIGGER cuponesDescuentoAuditoriaDelete
        AFTER DELETE ON reservas.cuponesDescuento
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaDelete();

        -- Triggers para la tabla reservas.facturaReserva
        CREATE TRIGGER facturaReservaAuditoriaInsert
        AFTER INSERT ON reservas.facturaReserva
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaInsert();

        CREATE TRIGGER facturaReservaAuditoriaUpdate
        AFTER UPDATE ON reservas.facturaReserva
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaUpdate();

        CREATE TRIGGER facturaReservaAuditoriaDelete
        AFTER DELETE ON reservas.facturaReserva
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaDelete();

        -- Triggers para la tabla servicios.tipoServicio
        CREATE TRIGGER tipoServicioAuditoriaInsert
        AFTER INSERT ON servicios.tipoServicio
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaInsert();

        CREATE TRIGGER tipoServicioAuditoriaUpdate
        AFTER UPDATE ON servicios.tipoServicio
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaUpdate();

        CREATE TRIGGER tipoServicioAuditoriaDelete
        AFTER DELETE ON servicios.tipoServicio
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaDelete();

        -- Triggers para la tabla servicios.promocion
        CREATE TRIGGER promocionAuditoriaInsert
        AFTER INSERT ON servicios.promocion
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaInsert();

        CREATE TRIGGER promocionAuditoriaUpdate
        AFTER UPDATE ON servicios.promocion
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaUpdate();

        CREATE TRIGGER promocionAuditoriaDelete
        AFTER DELETE ON servicios.promocion
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaDelete();

        -- Triggers para la tabla servicios.categoriaServicios
        CREATE TRIGGER categoriaServiciosAuditoriaInsert
        AFTER INSERT ON servicios.categoriaServicios
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaInsert();

        CREATE TRIGGER categoriaServiciosAuditoriaUpdate
        AFTER UPDATE ON servicios.categoriaServicios
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaUpdate();

        CREATE TRIGGER categoriaServiciosAuditoriaDelete
        AFTER DELETE ON servicios.categoriaServicios
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaDelete();

        -- Triggers para la tabla servicios.serviciosCategoriaDetalle
        CREATE TRIGGER serviciosCategoriaDetalleAuditoriaInsert
        AFTER INSERT ON servicios.serviciosCategoriaDetalle
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaInsert();

        CREATE TRIGGER serviciosCategoriaDetalleAuditoriaUpdate
        AFTER UPDATE ON servicios.serviciosCategoriaDetalle
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaUpdate();

        CREATE TRIGGER serviciosCategoriaDetalleAuditoriaDelete
        AFTER DELETE ON servicios.serviciosCategoriaDetalle
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaDelete();

        -- Triggers para la tabla servicios.servicio
        CREATE TRIGGER servicioAuditoriaInsert
        AFTER INSERT ON servicios.servicio
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaInsert();

        CREATE TRIGGER servicioAuditoriaUpdate
        AFTER UPDATE ON servicios.servicio
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaUpdate();

        CREATE TRIGGER servicioAuditoriaDelete
        AFTER DELETE ON servicios.servicio
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaDelete();

        -- Triggers para la tabla reservas.reserva
        CREATE TRIGGER reservaAuditoriaInsert
        AFTER INSERT ON reservas.reserva
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaInsert();

        CREATE TRIGGER reservaAuditoriaUpdate
        AFTER UPDATE ON reservas.reserva
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaUpdate();

        CREATE TRIGGER reservaAuditoriaDelete
        AFTER DELETE ON reservas.reserva
        FOR EACH ROW EXECUTE FUNCTION registroAuditoriaDelete();


-- PROCESOS PARA CREAR UNA RESERVA

    -- VISTAS
    --Vista para traer las categorias de los servicios
    CREATE VIEW servicios.vistaCategorias AS
    SELECT 
        categoriaServicios.idCategoriaServicio,
        categoriaServicios.nombreCategoria,
        categoriaServicios.descripcion,
        categoriaServicios.estadoCategoriaServicio
    FROM 
        servicios.categoriaServicios
    WHERE 
        categoriaServicios.estadoCategoriaServicio = 'ACTIVO';


    --Vista para traer los metodo de pago
    
    CREATE VIEW reservas.vistaPagos AS
    SELECT 
        metodoPago.idMetodoPago AS numeroMetodo,
        metodoPago.nombreMetodoPago AS nombreMetodo,
        metodoPago.estadoMetodoPago AS estado
    FROM 
        reservas.metodoPago
    WHERE 
        metodoPago.estadoMetodoPago = 'ACTIVO';

    
    -- Vista para los tipos de documentos
    CREATE VIEW usuarios.vistaDocumentos AS
    SELECT 
        tipoDocumento.idTipoDocumento AS tipoDocumetno,
        tipoDocumento.tipoDocumento AS nombreDocumentos,
        tipoDocumento.estadoTipoDocumento as estado
    FROM 
        usuarios.tipoDocumento
    WHERE 
        tipoDocumento.estadoTipoDocumento = 'ACTIVO';

    -- Vista para los municipios

    CREATE VIEW usuarios.vistaMunicipio AS
    SELECT 
        municipio.idMunicipio AS municipio,
        municipio.nombreMunicipio AS nombreMuni,
        departamento.nombreDepartamento AS departamento,
        municipio.estadoMunicipio AS estadoMuni
    FROM 
        usuarios.municipio 
    JOIN 
        usuarios.departamento ON municipio.idDepartamento = departamento.idDepartamento
    WHERE 
        municipio.estadoMunicipio = 'ACTIVO' AND departamento.estadoDepartamento = 'ACTIVO';
    
    -- Vista para los tipos de servicios
    CREATE VIEW servicios.vwTipoServicio AS
    SELECT 
        tipoServicio.idTipoServicio as servicio,
        tipoServicio.tipo AS nombreServicio,
        tipoServicio.estadoTipoServicio as estado
    FROM 
        servicios.tipoServicio
    WHERE 
        tipoServicio.estadoTipoServicio = 'ACTIVO';



    -- Vista para traer a los servicios con su precio y aplicando descuetno de promociones
    -- utilizando una funcion.
    CREATE OR REPLACE FUNCTION calcularPrecioDescuento(
        precioBase DECIMAL,
        fechaInicio DATE,
        fechaFinal DATE,
        porcentajeDescuento INT
    ) RETURNS DECIMAL AS $$
    DECLARE
        precioDescuento DECIMAL;
    BEGIN
        IF (to_char(CURRENT_DATE, 'MM-DD') >= to_char(fechaInicio, 'MM-DD'))
        AND (to_char(CURRENT_DATE, 'MM-DD') <= to_char(fechaFinal, 'MM-DD')) THEN
            precioDescuento := ROUND(precioBase - (precioBase * (porcentajeDescuento / 100.0)), 2);
        ELSE
            precioDescuento := ROUND(precioBase, 2);
        END IF;

        RETURN precioDescuento;
    END;
    $$ LANGUAGE plpgsql;


 
    CREATE OR REPLACE VIEW servicios.vistaServicios AS
    SELECT 
        -- Datos del servicio
        servicio.idServicio AS servicioId,
        servicio.nombreServicio AS servicioNombre,
        servicio.descripcionServicio AS servicioDescripcion,
        servicio.cupoMaximaReservas AS maximoReservasCupo,
        servicio.limiteMaxPersonas AS maxPersonasLimite,
        servicio.estadoServicio AS servicioEstado,
		servicio.precioServicio As servicioPrecio,
        servicio.idPromocion AS fkPromocion,
        calcularPrecioDescuento(
            servicio.precioServicio, 
            promocion.fechaInicio, 
            promocion.fechaFinal, 
            promocion.porcentajeDescuento
        ) AS finalPrecio,
        tipoServicio.tipo AS servicioTipoNombre,
        STRING_AGG(categoriaServicios.nombreCategoria, ', ') AS categoriasNombres,
        establecimiento.nombreEstablecimiento AS establecimientoNombre

    FROM 
        servicios.servicio
    JOIN 
        servicios.promocion ON servicio.idPromocion = promocion.idPromocion
    JOIN 
        servicios.tipoServicio ON servicio.idTipoServicio = tipoServicio.idTipoServicio
    LEFT JOIN 
        servicios.serviciosCategoriaDetalle ON servicio.idServicio = serviciosCategoriaDetalle.idServicio
    LEFT JOIN 
        servicios.categoriaServicios ON serviciosCategoriaDetalle.idCategoriaServicio = categoriaServicios.idCategoriaServicio
    JOIN 
        usuarios.establecimiento ON servicio.idEstablecimiento = establecimiento.idEstablecimiento

    GROUP BY 
    servicio.idServicio, 
    tipoServicio.tipo, 
    promocion.fechaInicio, 
    promocion.fechaFinal, 
    promocion.porcentajeDescuento,
	establecimiento.nombreEstablecimiento;


-- Funcion para traer un servicio
    CREATE OR REPLACE FUNCTION obtenerServicioPorId(p_idServicio INT)
    RETURNS TABLE(
        servicioId INT,
        servicioNombre VARCHAR,
        servicioDescripcion TEXT,
        maximoReservasCupo INT,
        maxPersonasLimite INT,
        servicioEstado estado_servicio,
        servicioPrecio DECIMAL(10,2),
        fkPromocion INT,
        finalPrecio DECIMAL(10,2),
        servicioTipoNombre VARCHAR,
        categoriasNombres TEXT,
        establecimientoNombre VARCHAR
    ) AS $$
    BEGIN
        RETURN QUERY
        SELECT 
            -- Datos del servicio
            servicio.idServicio AS servicioId,
            servicio.nombreServicio AS servicioNombre,
            servicio.descripcionServicio AS servicioDescripcion,
            servicio.cupoMaximaReservas AS maximoReservasCupo,
            servicio.limiteMaxPersonas AS maxPersonasLimite,
            servicio.estadoServicio AS servicioEstado,
            servicio.precioServicio AS servicioPrecio,
            servicio.idPromocion AS fkPromocion,
            calcularPrecioDescuento(
                servicio.precioServicio, 
                promocion.fechaInicio, 
                promocion.fechaFinal, 
                promocion.porcentajeDescuento
            ) AS finalPrecio,
            tipoServicio.tipo AS servicioTipoNombre,
            STRING_AGG(categoriaServicios.nombreCategoria, ', ') AS categoriasNombres,
            establecimiento.nombreEstablecimiento AS establecimientoNombre

        FROM 
            servicios.servicio
        JOIN 
            servicios.promocion ON servicio.idPromocion = promocion.idPromocion
        JOIN 
            servicios.tipoServicio ON servicio.idTipoServicio = tipoServicio.idTipoServicio
        LEFT JOIN 
            servicios.serviciosCategoriaDetalle ON servicio.idServicio = serviciosCategoriaDetalle.idServicio
        LEFT JOIN 
            servicios.categoriaServicios ON serviciosCategoriaDetalle.idCategoriaServicio = categoriaServicios.idCategoriaServicio
        JOIN 
            usuarios.establecimiento ON servicio.idEstablecimiento = establecimiento.idEstablecimiento

        WHERE 
            servicio.idServicio = p_idServicio  

        GROUP BY 
            servicio.idServicio, 
            tipoServicio.tipo, 
            promocion.fechaInicio, 
            promocion.fechaFinal, 
            promocion.porcentajeDescuento,
            establecimiento.nombreEstablecimiento;
    END;
    $$ LANGUAGE plpgsql;


-- Procesos relacionados a la reservas
    -- actializar el estado automatico de las reservas
   CREATE OR REPLACE FUNCTION actualizarEstadoReserva() RETURNS VOID AS $$
    BEGIN
        UPDATE reservas.reserva
        SET estadoReserva = 'FINALIZADA'
        WHERE estadoReserva = 'ACTIVA'
        AND fechaRegreso <= CURRENT_DATE;

        RAISE NOTICE 'Estados de reservas actualizadas';
    END;
    $$ LANGUAGE plpgsql;

    SELECT actualizarEstadoReserva();


    -- crear una reserva nueva
    CREATE OR REPLACE PROCEDURE crearReserva(
        pidTurista INT,
        pidServicio INT,
        pidMetodoDePago INT,
        pcantidadPersonas INT,
        pfechaReserva DATE,
        pfechaSalida DATE,
        pfechaRegreso DATE,
        pcodigoCupon VARCHAR(5) DEFAULT NULL
    )
    LANGUAGE plpgsql
    AS $$
    DECLARE
        vcupoMaximoReservas INT;
        vreservasSimultaneas INT;
        vprecioFinal DECIMAL;
        vtotalPago DECIMAL;
        vdescuento INT DEFAULT 0;
        vdiasReserva INT;
        vidReserva INT;
    BEGIN
        
        
        IF pfechaSalida < CURRENT_DATE THEN
            RAISE EXCEPTION 'La fecha de salida (%), no puede ser anterior a la fecha actual', pfechaSalida;
        END IF;

        
        IF pfechaRegreso < pfechaSalida THEN
            RAISE EXCEPTION 'La fecha de regreso (%) no puede ser anterior a la fecha de salida (%)', pfechaRegreso, pfechaSalida;
        END IF;

        
        vdiasReserva := (pfechaRegreso - pfechaSalida) + 1;

        
        SELECT servicio.cupoMaximaReservas INTO vcupoMaximoReservas
        FROM servicios.servicio
        WHERE servicio.idServicio = pidServicio;

        
        SELECT COUNT(*)
        INTO vreservasSimultaneas
        FROM reservas.reserva
        WHERE reserva.idServicio = pidServicio
        AND reserva.estadoReserva = 'ACTIVA'
        AND reserva.fechaSalida <= pfechaRegreso
        AND reserva.fechaRegreso >= pfechaSalida;

        
        IF vreservasSimultaneas >= vcupoMaximoReservas THEN
            RAISE EXCEPTION 'No hay capacidad disponible para el servicio en las fechas solicitadas';
        END IF;

        
        SELECT finalPrecio INTO vprecioFinal
        FROM servicios.vistaServicios
        WHERE vistaServicios.servicioId = pidServicio;

        
        IF vprecioFinal IS NULL THEN
            RAISE EXCEPTION 'No se encontró el precio final para el servicio con id %', pidServicio;
        END IF;

        
        IF pcodigoCupon IS NOT NULL THEN
            SELECT cuponesDescuento.cantidadDescuento INTO vdescuento
            FROM reservas.cuponesDescuento
            WHERE UPPER(cuponesDescuento.codigoCupon) = UPPER(pcodigoCupon)
            AND cuponesDescuento.estadoCuponDescuento = 'ACTIVO';

            IF NOT FOUND THEN
                RAISE EXCEPTION 'El código de cupón (%) no es válido o no está activo', pcodigoCupon;
            END IF;
            
            vprecioFinal := vprecioFinal - (vprecioFinal * (vdescuento / 100.00));
            
        END IF;

      
        vtotalPago := vprecioFinal * pcantidadPersonas * vdiasReserva;

        
        INSERT INTO reservas.reserva (
            cantidadPersonas,
            fechaReserva,
            fechaSalida,
            fechaRegreso,
            totalPago,
            idTurista,
            idServicio,
            idMetodoDePago,
            idCuponDescuento,  
            estadoReserva
        ) VALUES (
            pcantidadPersonas,
            pfechaReserva,
            pfechaSalida,
            pfechaRegreso,
            vtotalPago,
            pidTurista,
            pidServicio,
            pidMetodoDePago,
            NULL,  
            'ACTIVA'
        ) RETURNING idReserva INTO vidReserva;

        -- Crear la factura asociada a la reserva
        INSERT INTO reservas.facturaReserva (
            idReserva,
            fechaEmisionFactura,
            montoTotal,
            estadoFacturaReserva
        ) VALUES (
            vidReserva,
            CURRENT_DATE,
            vtotalPago,
            'PAGADA'
        );

        RAISE NOTICE 'Reserva creada exitosamente: %', ROUND(vtotalPago, 2);
    END;
    $$;


    CALL crearReserva(
    pidTurista => 1,             
    pidServicio => 1,           
    pidMetodoDePago => 3,         
    pcantidadPersonas => 2,       
    pfechaReserva => CURRENT_DATE, 
    pfechaSalida => '2025-12-05', 
    pfechaRegreso => '2025-12-10', 
    pcodigoCupon => 'desc10'       
);




-- Actualizar una reserva existente
CREATE OR REPLACE PROCEDURE actualizarReserva(
    pidReserva INT,
    pfechaSalida DATE,
    pfechaRegreso DATE,
    pcantidadPersonas INT,
    pidMetodoDePago INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    vcupoMaximoReservas INT;
    vreservasSimultaneas INT;
    vprecioFinal DECIMAL;
    vtotalPago DECIMAL;
    vdescuento INT DEFAULT 0;
    vdiasReserva INT;
    vidServicio INT;
    vidTurista INT;
    vidCuponDescuento INT;
BEGIN
    
    SELECT idServicio, idTurista, idCuponDescuento INTO vidServicio, vidTurista, vidCuponDescuento
    FROM reservas.reserva
    WHERE idReserva = pidReserva;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'No se encontró la reserva con id %', pidReserva;
    END IF;

    
    IF pfechaSalida < CURRENT_DATE THEN
        RAISE EXCEPTION 'La fecha de salida (%), no puede ser anterior a la fecha actual', pfechaSalida;
    END IF;

    
    IF pfechaRegreso < pfechaSalida THEN
        RAISE EXCEPTION 'La fecha de regreso (%) no puede ser anterior a la fecha de salida (%)', pfechaRegreso, pfechaSalida;
    END IF;

   
    vdiasReserva := (pfechaRegreso - pfechaSalida) + 1;

    SELECT servicio.cupoMaximaReservas INTO vcupoMaximoReservas
    FROM servicios.servicio
    WHERE servicio.idServicio = vidServicio;

    SELECT COUNT(*)
    INTO vreservasSimultaneas
    FROM reservas.reserva
    WHERE idServicio = vidServicio
      AND estadoReserva = 'ACTIVA'
      AND idReserva != pidReserva  
      AND fechaSalida <= pfechaRegreso
      AND fechaRegreso >= pfechaSalida;

    IF vreservasSimultaneas >= vcupoMaximoReservas THEN
        RAISE EXCEPTION 'No hay capacidad disponible para el servicio en las fechas solicitadas';
    END IF;

    SELECT finalPrecio INTO vprecioFinal
    FROM servicios.vistaServicios
    WHERE vistaServicios.servicioId = vidServicio;

    IF vprecioFinal IS NULL THEN
        RAISE EXCEPTION 'No se encontró el precio final para el servicio con id %', vidServicio;
    END IF;

    IF vidCuponDescuento IS NOT NULL THEN
        SELECT cuponesDescuento.cantidadDescuento INTO vdescuento
        FROM reservas.cuponesDescuento
        WHERE idCuponDescuento = vidCuponDescuento
          AND estadoCuponDescuento = 'ACTIVO';

        IF FOUND THEN
            vprecioFinal := vprecioFinal - (vprecioFinal * (vdescuento / 100.00));
        END IF;
    END IF;

    vtotalPago := vprecioFinal * pcantidadPersonas * vdiasReserva;

    UPDATE reservas.reserva
    SET fechaSalida = pfechaSalida,
        fechaRegreso = pfechaRegreso,
        cantidadPersonas = pcantidadPersonas,
        idMetodoDePago = pidMetodoDePago,
        totalPago = vtotalPago
    WHERE idReserva = pidReserva;

   
    UPDATE reservas.facturaReserva
    SET montoTotal = vtotalPago
    WHERE idReserva = pidReserva;


    RAISE NOTICE 'Reserva con ID % modificada exitosamente con un nuevo total de pago de: %', pidReserva, ROUND(vtotalPago, 2);
END;
$$;

CALL actualizarReserva(
    pidReserva => 1,               
    pfechaSalida => '2025-12-05',  
    pfechaRegreso => '2025-12-10', 
    pcantidadPersonas => 3,       
    pidMetodoDePago => 2           
);


-- Procedimiento para crear reseñas

CREATE OR REPLACE PROCEDURE crearResena(
    pidReserva INT,
    pcontenidoResena TEXT,
    pcalificacion INT
)
LANGUAGE plpgsql
AS $$
DECLARE 
    vcalificacion calificacion;
BEGIN
    
    IF NOT EXISTS (
        SELECT 1 
        FROM reservas.reserva 
        WHERE idReserva = pidReserva 
          AND estadoReserva = 'FINALIZADA'
    ) THEN
        RAISE EXCEPTION 'La reserva con ID % no existe o no está finalizada', pidReserva;
    END IF;

    vcalificacion := (pcalificacion::TEXT)::calificacion;

    
    INSERT INTO reservas.resena (
        idReserva,
        contenidoResena,
        calificacion,
        estadoResena
    ) VALUES (
        pidReserva,
        pcontenidoResena,
        vcalificacion,
        'PUBLICADA'
    );

    RAISE NOTICE 'Reseña creada exitosamente para la reserva con ID %', pidReserva;
END;
$$;

 CALL crearResena(
    pidReserva => 1,             
    pcontenidoResena => 'Excelente servicio y atención',  
    pcalificacion => 5
);




-- Procedimiento para editar una reseña

CREATE OR REPLACE PROCEDURE editarResena(
    pidResena INT,
    pcontenidoResena TEXT,
    pcalificacion INT
)
LANGUAGE plpgsql
AS $$
DECLARE 
    vcalificacion calificacion;
BEGIN
    
    IF NOT EXISTS (
        SELECT 1 
        FROM reservas.resena 
        WHERE idResena = pidResena
    ) THEN
        RAISE EXCEPTION 'La reseña con ID % no existe', pidResena;
    END IF;

    vcalificacion := (pcalificacion::TEXT)::calificacion;

    UPDATE reservas.resena
    SET contenidoResena = pcontenidoResena,
        calificacion = vcalificacion,
        estadoResena = 'EDITADA'
    WHERE idResena = pidResena;

    RAISE NOTICE 'Reseña con ID % editada exitosamente', pidResena;
END;
$$;

CALL editarResena(
    pidResena => 1,               
    pcontenidoResena => 'El servicio fue muy bueno, pero con algunos detalles a mejorar',  
    pcalificacion => 4            
);

-- crear uusario relacionado a un turista y un establecimiento
    -- Crear usuario
        CREATE OR REPLACE PROCEDURE crearUsuario(
            pcontrasenaUsuario VARCHAR(12),
            pemailUsuario VARCHAR(100),
            pidRol INT,
            pestadoUsuario estado_activo_inactivo
        )
        LANGUAGE plpgsql
        AS $$
        DECLARE
            vidUsuario INT;
        BEGIN
            
            INSERT INTO usuarios.usuario (
                contrasenaUsuario,
                email,
                idRol,
                estadoUsuario
            ) VALUES (
                pcontrasenaUsuario,
                pemailUsuario,
                pidRol,
                pestadoUsuario
            ) RETURNING idUsuario INTO vidUsuario;

            RAISE NOTICE 'Usuario creado exitosamente con ID %', vidUsuario;
        END;
        $$;


        CALL crearUsuario(
        pcontrasenaUsuario => 'password123',
        pemailUsuario => 'usuario@example.com',
        pidRol => 2,  
        pestadoUsuario => 'ACTIVO'
        );

        -- verificar email de usuario que no de duplique
            CREATE OR REPLACE FUNCTION prevenirEmailDuplicado()
            RETURNS TRIGGER AS $$
            BEGIN
                IF EXISTS (
                    SELECT 1 FROM usuarios.usuario
                    WHERE email = NEW.email AND idUsuario != NEW.idUsuario
                ) THEN
                    RAISE EXCEPTION 'El correo % ya está registrado en otro usuario', NEW.email;
                END IF;
                RETURN NEW;
            END;
            $$ LANGUAGE plpgsql;

            CREATE TRIGGER triggerPrevenirEmailDuplicado
            BEFORE INSERT OR UPDATE ON usuarios.usuario
            FOR EACH ROW EXECUTE FUNCTION prevenirEmailDuplicado();
                

    -- modificar usuario existente
        CREATE OR REPLACE PROCEDURE editarUsuario(
        pidUsuario INT,
        pnuevaContrasena VARCHAR(12)
        )
        LANGUAGE plpgsql
        AS $$
        BEGIN
            
            IF NOT EXISTS (
                SELECT 1 
                FROM usuarios.usuario 
                WHERE idUsuario = pidUsuario
            ) THEN
                RAISE EXCEPTION 'El usuario con ID % no existe', pidUsuario;
            END IF;

            UPDATE usuarios.usuario
            SET contrasenaUsuario = pnuevaContrasena
            WHERE idUsuario = pidUsuario;

            RAISE NOTICE 'Contraseña del usuario con ID % editada exitosamente', pidUsuario;
        END;
        $$;

        CALL editarUsuario(
        pidUsuario => 1,            
        pnuevaContrasena => 'nuevaPas'  
        );


    -- crear turista relacionado con el usuario
        CREATE OR REPLACE PROCEDURE crearTurista(
        pidUsuario INT,
        pidTipoDocumento INT,
        pdocumentoTurista BIGINT,
        pprimerNombreTurista VARCHAR(50),
        psegundoNombreTurista VARCHAR(50),
        pprimerApellidoTurista VARCHAR(50),
        psegundoApellidoTurista VARCHAR(50),
        ptelefono VARCHAR(10),
        pestadoTurista estado_activo_inactivo
        )
        LANGUAGE plpgsql
        AS $$
        DECLARE
            vidTurista INT;
        BEGIN
            
                INSERT INTO usuarios.turista (
                    idTipoDocumento,
                    estadoTurista,
                    documentoTurista,
                    primerNombreTurista,
                    segundoNombreTurista,
                    primerApellidoTurista,
                    segundoApellidoTurista,
                    telefono
                ) VALUES (
                    pidTipoDocumento,
                    pestadoTurista,
                    pdocumentoTurista,
                    pprimerNombreTurista,
                    psegundoNombreTurista,
                    pprimerApellidoTurista,
                    psegundoApellidoTurista,
                    ptelefono
                ) RETURNING idTurista INTO vidTurista;

                
                UPDATE usuarios.usuario
                SET idTurista = vidTurista
                WHERE idUsuario = pidUsuario;

                RAISE NOTICE 'Turista con ID % creado y relacionado con el usuario con ID %', vidTurista, pidUsuario;
        END;
        $$;

        CALL crearTurista(
        pidUsuario => 3,               
        pidTipoDocumento => 1,          
        pdocumentoTurista => 1234567890,
        pprimerNombreTurista => 'Juan',
        psegundoNombreTurista => 'Carlos',
        pprimerApellidoTurista => 'Pérez',
        psegundoApellidoTurista => 'Gómez',
        ptelefono => '1234567890',
        pestadoTurista => 'ACTIVO'
        );

    -- editar turista
        CREATE OR REPLACE PROCEDURE editarTurista(
            pidTurista INT,
            pidTipoDocumento INT,
            pdocumentoTurista BIGINT,
            pprimerNombreTurista VARCHAR(50),
            psegundoNombreTurista VARCHAR(50),
            pprimerApellidoTurista VARCHAR(50),
            psegundoApellidoTurista VARCHAR(50),
            ptelefono VARCHAR(10),
            pestadoTurista estado_activo_inactivo
        )
        LANGUAGE plpgsql
        AS $$
        BEGIN
            
            IF NOT EXISTS (
                SELECT 1 
                FROM usuarios.turista 
                WHERE idTurista = pidTurista
            ) THEN
                RAISE EXCEPTION 'El turista con ID % no existe', pidTurista;
            END IF;

            -- Actualizar los detalles del turista
            UPDATE usuarios.turista
            SET idTipoDocumento = pidTipoDocumento,
                documentoTurista = pdocumentoTurista,
                primerNombreTurista = pprimerNombreTurista,
                segundoNombreTurista = psegundoNombreTurista,
                primerApellidoTurista = pprimerApellidoTurista,
                segundoApellidoTurista = psegundoApellidoTurista,
                telefono = ptelefono,
                estadoTurista = pestadoTurista
            WHERE idTurista = pidTurista;

            RAISE NOTICE 'Turista con ID % editado exitosamente', pidTurista;
        END;
        $$;

        CALL editarTurista(
        pidTurista => 1,                 
        pidTipoDocumento => 2,           
        pdocumentoTurista => 123456789,  
        pprimerNombreTurista => 'Juan',
        psegundoNombreTurista => 'Carlos',
        pprimerApellidoTurista => 'Pérez',
        psegundoApellidoTurista => 'Gómez',
        ptelefono => '1234567890',
        pestadoTurista => 'ACTIVO'
    );

   

    
    -- Crear establecimiento relacionado con el usuario y una direccion
        CREATE OR REPLACE PROCEDURE crearEstablecimiento(
            pidUsuario INT,
            pnombreEstablecimiento VARCHAR(100),
            pnit BIGINT,
            pemailEstablecimiento VARCHAR(100),
            pidMunicipio INT,
            pcalle VARCHAR(50),
            pnumero VARCHAR(50),
            pinformacionAdicional TEXT,
            pestadoUbicacion estado_activo_inactivo,
            pestadoEstablecimiento estado_activo_inactivo
        )
        LANGUAGE plpgsql
        AS $$
        DECLARE
            vidUbicacion INT;
            vidEstablecimiento INT;
        BEGIN
            
            INSERT INTO servicios.ubicacion (
                idMunicipio,
                calle,
                numero,
                informacionAdicional,
                estadoUbicacion
            ) VALUES (
                pidMunicipio,
                pcalle,
                pnumero,
                pinformacionAdicional,
                pestadoUbicacion
            ) RETURNING idUbicacion INTO vidUbicacion;

            
            INSERT INTO usuarios.establecimiento (
                nombreEstablecimiento,
                nit,
                email,
                idUbicacion,
                estadoEstablecimiento
            ) VALUES (
                pnombreEstablecimiento,
                pnit,
                pemailEstablecimiento,
                vidUbicacion,
                pestadoEstablecimiento
            ) RETURNING idEstablecimiento INTO vidEstablecimiento;

            
            UPDATE usuarios.usuario
            SET idEstablecimiento = vidEstablecimiento
            WHERE idUsuario = pidUsuario;

            RAISE NOTICE 'Establecimiento con ID % y dirección con ID % creados y relacionados con el usuario con ID %', vidEstablecimiento, vidUbicacion, pidUsuario;
        END;
        $$;

        CALL crearEstablecimiento(
            pidUsuario => 4,
            pnombreEstablecimiento => 'Hotel Sol',
            pnit => 123456789,
            pemailEstablecimiento => 'hotel@example.com',
            pidMunicipio => 2,
            pcalle => 'Calle Principal',
            pnumero => '123',
            pinformacionAdicional => 'Frente al parque',
            pestadoUbicacion => 'ACTIVO',
            pestadoEstablecimiento => 'ACTIVO'
        );



        CREATE OR REPLACE PROCEDURE editarEstablecimiento(
            pidEstablecimiento INT,
            pnombreEstablecimiento VARCHAR(100),
            pnit BIGINT,
            pemailEstablecimiento VARCHAR(100),
            pidMunicipio INT,
            pcalle VARCHAR(50),
            pnumero VARCHAR(50),
            pinformacionAdicional TEXT,
            pestadoUbicacion estado_activo_inactivo,
            pestadoEstablecimiento estado_activo_inactivo
        )
        LANGUAGE plpgsql
        AS $$
        DECLARE
            vidUbicacion INT;
        BEGIN
            
            SELECT idUbicacion INTO vidUbicacion
            FROM usuarios.establecimiento 
            WHERE idEstablecimiento = pidEstablecimiento;

            IF NOT FOUND THEN
                RAISE EXCEPTION 'El establecimiento con ID % no existe', pidEstablecimiento;
            END IF;

            
            UPDATE usuarios.establecimiento
            SET nombreEstablecimiento = pnombreEstablecimiento,
                nit = pnit,
                email = pemailEstablecimiento,
                estadoEstablecimiento = pestadoEstablecimiento
            WHERE idEstablecimiento = pidEstablecimiento;

            
            UPDATE servicios.ubicacion
            SET idMunicipio = pidMunicipio,
                calle = pcalle,
                numero = pnumero,
                informacionAdicional = pinformacionAdicional,
                estadoUbicacion = pestadoUbicacion
            WHERE idUbicacion = vidUbicacion;

            RAISE NOTICE 'Establecimiento con ID % y su dirección con ID % editados exitosamente', pidEstablecimiento, vidUbicacion;
        END;
        $$;


        CALL editarEstablecimiento(
            pidEstablecimiento => 1,               
            pnombreEstablecimiento => 'Hotel Sol y Mar',
            pnit => 987654321,
            pemailEstablecimiento => 'hotelsoleymar@example.com',
            pidMunicipio => 2,                     
            pcalle => 'Av. Principal',
            pnumero => '456',
            pinformacionAdicional => 'A una cuadra de la playa',
            pestadoUbicacion => 'ACTIVO',
            pestadoEstablecimiento => 'ACTIVO'
        );



    -- Crear un servicio
       CREATE OR REPLACE PROCEDURE crearServicio(
            pnombreServicio VARCHAR(50),
            pdescripcionServicio TEXT,
            pprecioServicio DECIMAL(10,2),
            pidTipoServicio INT,
            pidPromocion INT,
            pcupoMaximaReservas INT,
            pidEstablecimiento INT,
            plimiteMaxPersonas INT,
            pestadoServicio estado_servicio,
            pcategorias INT[]  
        )
        LANGUAGE plpgsql
        AS $$
        DECLARE
            vidServicio INT;
            categoria INT;  
        BEGIN
            
            INSERT INTO servicios.servicio (
                nombreServicio,
                descripcionServicio,
                precioServicio,
                idTipoServicio,
                idPromocion,
                cupoMaximaReservas,
                idEstablecimiento,
                limiteMaxPersonas,
                estadoServicio
            ) VALUES (
                pnombreServicio,
                pdescripcionServicio,
                pprecioServicio,
                pidTipoServicio,
                pidPromocion,
                pcupoMaximaReservas,
                pidEstablecimiento,
                plimiteMaxPersonas,
                pestadoServicio
            ) RETURNING idServicio INTO vidServicio;

            
            FOREACH categoria IN ARRAY pcategorias LOOP
                INSERT INTO servicios.serviciosCategoriaDetalle (
                    idCategoriaServicio,
                    idServicio,
                    descripcion,
                    estadoServicioCategoriaDetalle
                ) VALUES (
                    categoria,
                    vidServicio,
                    'Descripción de la relación',  
                    'ACTIVO'
                );
            END LOOP;

            RAISE NOTICE 'Servicio creado con ID % y categorías asignadas', vidServicio;
        END;
        $$;




    -- Modificar un servicio
           CREATE OR REPLACE PROCEDURE modificarServicio(
                pidServicio INT,
                pnombreServicio VARCHAR(50),
                pdescripcionServicio TEXT,
                pprecioServicio DECIMAL(10,2),
                pidTipoServicio INT,
                pidPromocion INT,
                pcupoMaximaReservas INT,
                pidEstablecimiento INT,
                plimiteMaxPersonas INT,
                pestadoServicio estado_servicio,
                pcategorias INT[]  
            )
            LANGUAGE plpgsql
            AS $$
            DECLARE
                categoria INT;  
            BEGIN
                
                IF NOT EXISTS (SELECT 1 FROM servicios.servicio WHERE idServicio = pidServicio) THEN
                    RAISE EXCEPTION 'El servicio con ID % no existe', pidServicio;
                END IF;

                
                UPDATE servicios.servicio
                SET nombreServicio = pnombreServicio,
                    descripcionServicio = pdescripcionServicio,
                    precioServicio = pprecioServicio,
                    idTipoServicio = pidTipoServicio,
                    idPromocion = pidPromocion,
                    cupoMaximaReservas = pcupoMaximaReservas,
                    idEstablecimiento = pidEstablecimiento,
                    limiteMaxPersonas = plimiteMaxPersonas,
                    estadoServicio = pestadoServicio
                WHERE idServicio = pidServicio;

                
                DELETE FROM servicios.serviciosCategoriaDetalle
                WHERE idServicio = pidServicio;

            
                FOREACH categoria IN ARRAY pcategorias LOOP
                    INSERT INTO servicios.serviciosCategoriaDetalle (
                        idCategoriaServicio,
                        idServicio,
                        descripcion,
                        estadoServicioCategoriaDetalle
                    ) VALUES (
                        categoria,
                        pidServicio,
                        'Descripción de la relación',  
                        'ACTIVO'
                    );
                END LOOP;

                RAISE NOTICE 'Servicio con ID % modificado y categorías actualizadas', pidServicio;
            END;
            $$;


CALL crearServicio(
    pnombreServicio => 'Excursión a la Playa',
    pdescripcionServicio => 'Una experiencia de día completo en la playa con actividades acuáticas.',
    pprecioServicio => 120000.00,
    pidTipoServicio => 1,                 
    pidPromocion => 2,                    
    pcupoMaximaReservas => 20,
    pidEstablecimiento => 1,              
    plimiteMaxPersonas => 10,
    pestadoServicio => 'DISPONIBLE',
    pcategorias => ARRAY[1, 3]            
);


CALL modificarServicio(
    pidServicio => 14,                     
    pnombreServicio => 'Tour por la Ciudad',
    pdescripcionServicio => 'Explora los lugares más importantes de la ciudad con un guía turístico.',
    pprecioServicio => 80000.00,
    pidTipoServicio => 2,                 
    pidPromocion => 3,                    
    pcupoMaximaReservas => 15,
    pidEstablecimiento => 2,              
    plimiteMaxPersonas => 8,
    pestadoServicio => 'DISPONIBLE',
    pcategorias => ARRAY[2, 4]           
);















