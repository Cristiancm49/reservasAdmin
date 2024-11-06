INSERT INTO usuarios.rol (nombreRol, estadoRol)
VALUES 
    ('ADMINISTRADOR', 'ACTIVO'),
    ('TURISTA', 'ACTIVO'),
    ('ESTABLECIMIENTO', 'ACTIVO');

INSERT INTO usuarios.tipoDocumento (tipoDocumento, estadoTipoDocumento)
VALUES 
    ('Cédula de Ciudadanía', 'ACTIVO'),
    ('Pasaporte', 'ACTIVO'),
    ('Cédula de Extranjería', 'ACTIVO');


INSERT INTO usuarios.departamento (nombreDepartamento, estadoDepartamento)
VALUES 
    ('Antioquia', 'ACTIVO'),
    ('Cundinamarca', 'ACTIVO'),
    ('Valle del Cauca', 'ACTIVO');

INSERT INTO usuarios.municipio (nombreMunicipio, idDepartamento, estadoMunicipio)
VALUES 
    ('Medellín', 1, 'ACTIVO'),
    ('Bogotá', 2, 'ACTIVO'),
    ('Cali', 3, 'ACTIVO');


INSERT INTO servicios.ubicacion (idMunicipio, calle, numero, InformacionAdicional, estadoUbicacion)
VALUES 
    (1, 'Calle 10', '25', 'Cerca del parque principal', 'ACTIVO'),
    (2, 'Avenida 7', '54', 'En el centro', 'ACTIVO'),
    (3, 'Carrera 3', '33', 'Frente a la iglesia', 'ACTIVO');


INSERT INTO usuarios.establecimiento (nombreEstablecimiento, nit, Email, idUbicacion, estadoEstablecimiento)
VALUES 
    ('Hotel El Descanso', 900123456, 'contacto@hoteldescanso.com', 1, 'ACTIVO'),
    ('Restaurante Delicias', 900654321, 'info@restaurantedelicias.com', 2, 'ACTIVO');


INSERT INTO usuarios.turista (idTipoDocumento, estadoTurista, documentoTurista, primerNombreTurista, segundoNombreTurista, primerApellidoTurista, segundoApellidoTurista, telefono)
VALUES 
    (1, 'ACTIVO', 1234567890, 'Carlos', 'Andrés', 'López', 'García', '3001234567');


-- Usuario de un turista (idTurista 1)
INSERT INTO usuarios.usuario (ContrasenaUsuario, Email, idTurista, idEstablecimiento, idRol, estadoUsuario)
VALUES 
    ('password123', 'carlos.lopez@gmail.com', 1, NULL, 2, 'ACTIVO');  -- Usuario TURISTA

-- Usuario de un establecimiento (idEstablecimiento 1)
INSERT INTO usuarios.usuario (ContrasenaUsuario, Email, idTurista, idEstablecimiento, idRol, estadoUsuario)
VALUES 
    ('securepass', 'admin@hoteldescanso.com', NULL, 1, 3, 'ACTIVO');  -- Usuario ESTABLECIMIENTO

INSERT INTO servicios.tipoServicio (tipo, estadoTipoServicio)
VALUES 
    ('Hospedaje', 'ACTIVO'),
    ('Alimentación', 'ACTIVO'),
    ('Actividades Turísticas', 'ACTIVO');


INSERT INTO servicios.promocion (descripcion, PorcentajeDescuento, fechaInicio, fechaFinal, estadoPromocion)
VALUES 
    ('Descuento de temporada baja', 10, '2024-01-01', '2024-03-31', 'ACTIVO'),
    ('Promoción de verano', 15, '2024-06-01', '2024-08-31', 'ACTIVO'),
    ('Descuento por reservas anticipadas', 5, '2024-04-01', '2024-06-30', 'ACTIVO'),
    ('Promoción de navidad', 20, '2024-12-01', '2024-12-31', 'ACTIVO'),
    ('Promoción de Año Nuevo', 25, '2024-12-31', '2025-01-05', 'ACTIVO');

INSERT INTO servicios.promocion (descripcion, PorcentajeDescuento, fechaInicio, fechaFinal, estadoPromocion)
VALUES 
    ('Descuento de hallowen', 10, '2024-10-01', '2024-10-31', 'ACTIVO');


INSERT INTO servicios.categoriaServicios (descripcion, nombreCategoria, estadoCategoriaServicio)
VALUES 
    ('Plan para parejas', 'Pareja', 'ACTIVO'),
    ('Plan familiar con actividades', 'Familiar', 'ACTIVO'),
    ('Turismo cultural', 'Turismo', 'ACTIVO'),
    ('Opciones veganas', 'Vegano', 'ACTIVO'),
    ('Experiencia de parrilla', 'Parrillas', 'ACTIVO'),
    ('Comida tradicional', 'Tradicional', 'ACTIVO');


INSERT INTO servicios.servicio (nombreServicio, DescripcionServicio, precioServicio, idTipoServicio, idPromocion, cupoMaximaReservas, idEstablecimiento, limiteMaxPersonas, estadoServicio)
VALUES 
    ('Habitación Doble', 'Habitación con vista al mar para 2 personas', 120000.00, 1, 1, 10, 1, 2, 'DISPONIBLE'),
    ('Suite Familiar', 'Suite para 4 personas con balcón', 250000.00, 1, 2, 5, 1, 4, 'DISPONIBLE'),
    ('Cena Romántica', 'Cena a la luz de las velas para parejas', 80000.00, 2, 1, 8, 2, 2, 'DISPONIBLE'),
    ('Desayuno Buffet', 'Desayuno tipo buffet con opciones variadas', 35000.00, 2, 3, 15, 2, 10, 'DISPONIBLE'),
    ('Tour Histórico', 'Recorrido por los principales lugares históricos de la ciudad', 50000.00, 3, 4, 20, 1, 15, 'DISPONIBLE'),
    ('Clase de Cocina', 'Clase de cocina tradicional para turistas', 60000.00, 3, 2, 10, 2, 5, 'DISPONIBLE'),
    ('Paseo en Barco', 'Paseo en barco por la bahía', 150000.00, 3, 5, 5, 1, 10, 'DISPONIBLE'),
    ('Almuerzo Vegano', 'Delicioso almuerzo vegano', 40000.00, 2, 3, 10, 2, 5, 'DISPONIBLE');

INSERT INTO servicios.servicio (nombreServicio, DescripcionServicio, precioServicio, idTipoServicio, idPromocion, cupoMaximaReservas, idEstablecimiento, limiteMaxPersonas, estadoServicio)
VALUES 
    ('Habitación terror', 'Habitación con vista al mar para 2 personas', 120000, 1, 6, 10, 1, 2, 'DISPONIBLE'),
    ('Habitación terror', 'Habitación con vista al mar para 2 personas', 12400, 1, 6, 10, 1, 2, 'DISPONIBLE'),
    ('Habitación terror', 'Habitación con vista al mar para 2 personas', 20000, 1, 6, 10, 1, 2, 'DISPONIBLE'),
    ('Habitación terror', 'Habitación con vista al mar para 2 personas', 147000, 1, 6, 10, 1, 2, 'DISPONIBLE');




INSERT INTO reservas.metodoPago (nombreMetodoPago, estadoMetodoPago)
VALUES 
    ('Tarjeta de Crédito', 'ACTIVO'),
    ('Efecty', 'ACTIVO'),
    ('PayPal', 'ACTIVO'),
    ('PSE', 'ACTIVO');

INSERT INTO reservas.cuponesDescuento (codigoCupon, cantidadDescuento, detalleCuponDescuento, estadoCuponDescuento)
VALUES 
    ('DESC10', 10, 'Descuento del 10% en reservas', 'ACTIVO'),
    ('VER15', 15, 'Descuento del 15% en verano', 'ACTIVO'),
    ('INV20', 20, 'Descuento del 20% en invierno', 'ACTIVO'),
    ('PRO50', 50, 'Descuento del 50% en servicios seleccionados', 'ACTIVO');


