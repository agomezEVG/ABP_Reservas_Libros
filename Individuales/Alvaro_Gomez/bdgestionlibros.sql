-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-12-2024 a las 12:57:14
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdgestionlibros`
--
CREATE DATABASE IF NOT EXISTS `bdgestionlibros` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bdgestionlibros`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrativo`
--

CREATE TABLE `administrativo` (
  `idAdmin` int(10) UNSIGNED NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `contrasenia` varchar(255) NOT NULL,
  `correoAdmin` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrativo`
--

INSERT INTO `administrativo` (`idAdmin`, `usuario`, `contrasenia`, `correoAdmin`) VALUES
(1, 'admin1', '$2y$10$4vTkG5MRXqhvuAdFF8YrnuQKhZfjGnvtXCHv79W93vY9uoRH5cSFa', 'admin1@colegio.com'),
(2, 'admin2', 'password456', 'admin2@colegio.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase`
--

CREATE TABLE `clase` (
  `codCurso` char(10) NOT NULL,
  `idClase` char(1) NOT NULL,
  `nombreClase` varchar(100) NOT NULL,
  `idTutor` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clase`
--

INSERT INTO `clase` (`codCurso`, `idClase`, `nombreClase`, `idTutor`) VALUES
('1BACH', 'A', '1º Bachillerato-A', 1),
('1DAW', 'A', '1º Desarrollo de Aplicaciones Web-A', 3),
('1INF', 'A', '1º Infantil-A', 1),
('2INF', 'B', '2º Infantil-B', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `codCurso` char(10) NOT NULL,
  `nombreCurso` varchar(120) NOT NULL,
  `idEtapa` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`codCurso`, `nombreCurso`, `idEtapa`) VALUES
('1BACH', '1º Bachillerato', 3),
('1DAW', '1º Desarrollo de Aplicaciones Web', 2),
('1INF', '1º Infantil', 1),
('2DAW', '2º Desarrollo de Aplicaciones Web', 2),
('2INF', '2º Infantil', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_libro`
--

CREATE TABLE `curso_libro` (
  `codCurso` char(10) NOT NULL,
  `isbn` char(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `curso_libro`
--

INSERT INTO `curso_libro` (`codCurso`, `isbn`) VALUES
('1DAW', '9781122334455'),
('1INF', '9780987654321'),
('1INF', '9781234567890');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editorial`
--

CREATE TABLE `editorial` (
  `idEditorial` tinyint(3) UNSIGNED NOT NULL,
  `nombreEditorial` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `editorial`
--

INSERT INTO `editorial` (`idEditorial`, `nombreEditorial`) VALUES
(2, 'Anaya'),
(3, 'McGraw-Hill'),
(1, 'Santillana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etapa`
--

CREATE TABLE `etapa` (
  `idEtapa` tinyint(3) UNSIGNED NOT NULL,
  `nombreEtapa` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `etapa`
--

INSERT INTO `etapa` (`idEtapa`, `nombreEtapa`) VALUES
(3, 'Bachillerato'),
(2, 'Ciclos Formativos'),
(1, 'Infantil');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `isbn` char(13) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `stock` int(11) DEFAULT 0,
  `precio` decimal(5,2) NOT NULL,
  `idEditorial` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`isbn`, `titulo`, `stock`, `precio`, `idEditorial`) VALUES
('9780987654321', 'Lengua 1º Infantil', 15, 23.75, 2),
('9781122334455', 'Programación 1º DAW', 20, 50.00, 3),
('9781234567890', 'Matemáticas 1º Infantil', 10, 25.50, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `idReserva` int(10) UNSIGNED NOT NULL,
  `fechaReserva` datetime NOT NULL,
  `metodoPago` char(15) NOT NULL,
  `estadoPago` bit(1) DEFAULT b'0',
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `codCurso` char(10) NOT NULL,
  `idClase` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`idReserva`, `fechaReserva`, `metodoPago`, `estadoPago`, `nombre`, `apellidos`, `correo`, `codCurso`, `idClase`) VALUES
(1, '2024-11-19 10:00:00', 'Transferencia', b'1', 'Carlos', 'Gómez', 'carlos.gomez@correo.com', '1INF', 'A'),
(2, '2024-11-20 12:00:00', 'Efectivo', b'0', 'Lucía', 'Hernández', 'lucia.hernandez@correo.com', '2INF', 'B'),
(3, '2024-11-21 15:00:00', 'TPV', b'1', 'Miguel', 'Ruiz', 'miguel.ruiz@correo.com', '1DAW', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva_libro`
--

CREATE TABLE `reserva_libro` (
  `idReserva` int(10) UNSIGNED NOT NULL,
  `isbn` char(13) NOT NULL,
  `fechaEntrega` datetime DEFAULT NULL,
  `asignado` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reserva_libro`
--

INSERT INTO `reserva_libro` (`idReserva`, `isbn`, `fechaEntrega`, `asignado`) VALUES
(1, '9781234567890', '2024-11-22 09:00:00', b'1'),
(2, '9780987654321', NULL, b'0'),
(3, '9781122334455', '2024-11-23 14:30:00', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutor`
--

CREATE TABLE `tutor` (
  `idTutor` int(10) UNSIGNED NOT NULL,
  `nombreTutor` varchar(30) NOT NULL,
  `correoTutor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tutor`
--

INSERT INTO `tutor` (`idTutor`, `nombreTutor`, `correoTutor`) VALUES
(1, 'María López', 'maria.lopez@colegio.com'),
(2, 'Juan Pérez', 'juan.perez@colegio.com'),
(3, 'Laura Martínez', 'laura.martinez@colegio.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrativo`
--
ALTER TABLE `administrativo`
  ADD PRIMARY KEY (`idAdmin`),
  ADD UNIQUE KEY `uq_usuario` (`usuario`);

--
-- Indices de la tabla `clase`
--
ALTER TABLE `clase`
  ADD PRIMARY KEY (`codCurso`,`idClase`),
  ADD KEY `fk_idTutor` (`idTutor`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`codCurso`),
  ADD UNIQUE KEY `uq_nombreCurso` (`nombreCurso`),
  ADD KEY `fk_idEtapa` (`idEtapa`);

--
-- Indices de la tabla `curso_libro`
--
ALTER TABLE `curso_libro`
  ADD PRIMARY KEY (`codCurso`,`isbn`),
  ADD KEY `fk_CLisbn` (`isbn`);

--
-- Indices de la tabla `editorial`
--
ALTER TABLE `editorial`
  ADD PRIMARY KEY (`idEditorial`),
  ADD UNIQUE KEY `uq_nombreEditorial` (`nombreEditorial`);

--
-- Indices de la tabla `etapa`
--
ALTER TABLE `etapa`
  ADD PRIMARY KEY (`idEtapa`),
  ADD UNIQUE KEY `uq_nombreEtapa` (`nombreEtapa`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`isbn`),
  ADD KEY `fk_idEditorial` (`idEditorial`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`idReserva`),
  ADD KEY `fk_resClase` (`codCurso`,`idClase`);

--
-- Indices de la tabla `reserva_libro`
--
ALTER TABLE `reserva_libro`
  ADD PRIMARY KEY (`idReserva`,`isbn`),
  ADD KEY `fk_reslib_isbn` (`isbn`);

--
-- Indices de la tabla `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`idTutor`),
  ADD UNIQUE KEY `uq_correoTutor` (`correoTutor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrativo`
--
ALTER TABLE `administrativo`
  MODIFY `idAdmin` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `editorial`
--
ALTER TABLE `editorial`
  MODIFY `idEditorial` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `etapa`
--
ALTER TABLE `etapa`
  MODIFY `idEtapa` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `idReserva` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tutor`
--
ALTER TABLE `tutor`
  MODIFY `idTutor` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clase`
--
ALTER TABLE `clase`
  ADD CONSTRAINT `fk_codCurso` FOREIGN KEY (`codCurso`) REFERENCES `curso` (`codCurso`),
  ADD CONSTRAINT `fk_idTutor` FOREIGN KEY (`idTutor`) REFERENCES `tutor` (`idTutor`);

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `fk_idEtapa` FOREIGN KEY (`idEtapa`) REFERENCES `etapa` (`idEtapa`);

--
-- Filtros para la tabla `curso_libro`
--
ALTER TABLE `curso_libro`
  ADD CONSTRAINT `fk_CLcodCurso` FOREIGN KEY (`codCurso`) REFERENCES `curso` (`codCurso`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_CLisbn` FOREIGN KEY (`isbn`) REFERENCES `libro` (`isbn`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `fk_idEditorial` FOREIGN KEY (`idEditorial`) REFERENCES `editorial` (`idEditorial`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `fk_resClase` FOREIGN KEY (`codCurso`,`idClase`) REFERENCES `clase` (`codCurso`, `idClase`);

--
-- Filtros para la tabla `reserva_libro`
--
ALTER TABLE `reserva_libro`
  ADD CONSTRAINT `fk_reslib_idReserva` FOREIGN KEY (`idReserva`) REFERENCES `reserva` (`idReserva`),
  ADD CONSTRAINT `fk_reslib_isbn` FOREIGN KEY (`isbn`) REFERENCES `libro` (`isbn`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
