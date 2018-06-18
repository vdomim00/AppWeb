-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-06-2018 a las 22:47:24
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cine`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add comentario', 1, 'add_comentario'),
(2, 'Can change comentario', 1, 'change_comentario'),
(3, 'Can delete comentario', 1, 'delete_comentario'),
(4, 'Can add pelicula', 2, 'add_pelicula'),
(5, 'Can change pelicula', 2, 'change_pelicula'),
(6, 'Can delete pelicula', 2, 'delete_pelicula'),
(7, 'Can add log entry', 3, 'add_logentry'),
(8, 'Can change log entry', 3, 'change_logentry'),
(9, 'Can delete log entry', 3, 'delete_logentry'),
(10, 'Can add permission', 4, 'add_permission'),
(11, 'Can change permission', 4, 'change_permission'),
(12, 'Can delete permission', 4, 'delete_permission'),
(13, 'Can add group', 5, 'add_group'),
(14, 'Can change group', 5, 'change_group'),
(15, 'Can delete group', 5, 'delete_group'),
(16, 'Can add user', 6, 'add_user'),
(17, 'Can change user', 6, 'change_user'),
(18, 'Can delete user', 6, 'delete_user'),
(19, 'Can add content type', 7, 'add_contenttype'),
(20, 'Can change content type', 7, 'change_contenttype'),
(21, 'Can delete content type', 7, 'delete_contenttype'),
(22, 'Can add session', 8, 'add_session'),
(23, 'Can change session', 8, 'change_session'),
(24, 'Can delete session', 8, 'delete_session'),
(25, 'Can add reserva', 9, 'add_reserva'),
(26, 'Can change reserva', 9, 'change_reserva'),
(27, 'Can delete reserva', 9, 'delete_reserva'),
(28, 'Can add sesion', 10, 'add_sesion'),
(29, 'Can change sesion', 10, 'change_sesion'),
(30, 'Can delete sesion', 10, 'delete_sesion'),
(31, 'Can add sala', 11, 'add_sala'),
(32, 'Can change sala', 11, 'change_sala'),
(33, 'Can delete sala', 11, 'delete_sala'),
(34, 'Can add asiento', 12, 'add_asiento'),
(35, 'Can change asiento', 12, 'change_asiento'),
(36, 'Can delete asiento', 12, 'delete_asiento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$100000$h20pfKT3OWU6$UC0dzW8tEa7wT8VGc+HwNHIm2RqC14jcs5KDkbkxXaE=', '2018-06-16 21:29:47.821521', 1, 'riesco', '', '', 'adrian.riesco6635@gmail.com', 1, 1, '2018-06-15 15:53:27.116717');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cine_asiento`
--

CREATE TABLE `cine_asiento` (
  `id` int(11) NOT NULL,
  `numeroFila` int(11) NOT NULL,
  `numeroAsiento` int(11) NOT NULL,
  `reserva_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cine_comentario`
--

CREATE TABLE `cine_comentario` (
  `id` int(11) NOT NULL,
  `asunto` varchar(200) DEFAULT NULL,
  `opinion` longtext NOT NULL,
  `pelicula_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cine_comentario`
--

INSERT INTO `cine_comentario` (`id`, `asunto`, `opinion`, `pelicula_id`) VALUES
(15, 'Recomendable', 'Te mantiene en vilo hasta el final', 3),
(16, 'Pésima', 'No me ha gustado nada', 3),
(17, 'Regular', 'Bastante predecible', 3),
(18, 'Buena', 'Efectos especiales alucinantes', 7),
(19, 'Increíble', 'Llevaba esperándola muchos años, es genial y no ha defraudado.\r\nHe ido con mis amigos a verla y todos hemos salido encantados.', 7),
(20, 'Divertida', 'Muy buena. Por cierto, me encanta vuestra página web, muy bien hecha.', 6),
(21, 'Regularcilla', 'Buenos efectos especiales, pero nada muy notable.', 4),
(22, 'Pasable', 'Se deja ver.', 4),
(23, 'Alucinante', 'Llevaba tiempo sin ver una película tan buena.', 4),
(24, 'Tirando a mala', 'Me aburrí mucho en la primera mitad de la película.', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cine_pelicula`
--

CREATE TABLE `cine_pelicula` (
  `id` int(11) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `director` varchar(200) NOT NULL,
  `genero` varchar(200) NOT NULL,
  `sinopsis` longtext NOT NULL,
  `foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cine_pelicula`
--

INSERT INTO `cine_pelicula` (`id`, `titulo`, `director`, `genero`, `sinopsis`, `foto`) VALUES
(3, 'Verdad o reto', 'Jeff Wadlow', 'Suspense', 'Un juego de \"verdad o reto\" se convierte en una pesadilla infernal para un grupo de universitarios de vacaciones en México. Las reglas son simples: di la verdad o morirás, cumple el reto o morirás, si dejas de jugar, morirás.', 'verdadoreto.jpeg'),
(4, 'Jurassic World', 'Juan Antonio Bayona', 'Accion', 'Tras cuatro años de abandono del complejo turístico Jurassic World, Isla Nublar sólo está habitada por los dinosaurios supervivientes. Cuando el volcán de la isla entra en erupción, Owen (Chris Pratt) y Claire (Bryce Dallas Howard) vuelven allí para rescatar a los dinosaurios de la extinción. Owen va en busca de Blue, el raptor al que crió mientras que Claire, que ha empezado a valorar a estas criaturas, se centra más en salvar al resto. Cuando llegan a la isla descubren una conspiración que pretende llevar al planeta de nuevo a la era prehistórica. Esta película dirigida por Juan Antonio Bayona es la quinta de la franquicia que comenzó en 1993 con \'Jurassic Park\' y dirigida por Steven Spielberg. La historia se ha basado en los libros de Michael Crichton. Además, el guión de la cinta ha sido escrito por Derek Connolly y Colin Trevorrow, siendo este último el director de la próxima entrega. Chris Pratt y Bryce Dallas Howard regresan en esta entrega junto a la presencia de nuevos actores como son Toby Jones, Ted Levine, Daniella Pineda y Rafe Spall.', 'Jurassic.jpg'),
(5, 'Guardianes de la Galaxia', 'James Gunn', 'Suspense', 'Una poderosa raza alienígena contrata a los Guardianes para que protejan sus valiosas baterías de energía, pero cuando Rocket las roba, los alienígenas envían a sus tropas de combate a vengarse de los Guardianes. Mientras tratan de escapar con vida, intentan resolver el misterio de los verdaderos orígenes de Peter Quill.', 'guardianes.jfif'),
(6, 'Coco', 'Lee Unkrich', 'Animación', 'Miguel es un niño que sueña con ser músico, pero su familia se lo prohíbe porque su tatarabuelo, músico, los abandonó, y quieren obligar a Miguel a ser zapatero, como todos los miembros de la familia. Por accidente, Miguel entra en la Tierra de los Muertos, de donde sólo podrá salir si un familiar difunto le concede su bendición, pero su tatarabuela se niega a dejarlo volver con los vivos si no promete que no será músico. Debido a eso, Miguel escapa de ella y empieza a buscar a su tatarabuelo.', 'Coco.jpg'),
(7, 'Vengadores: Infinity War', 'Russo', 'Acción', 'Los superhéroes se alían para vencer al poderoso Thanos, el peor enemigo al que se han enfrentado. Si Thanos logra reunir las seis gemas del infinito: poder, tiempo, alma, realidad, mente y espacio, nadie podrá detenerlo.', 'Vengadores.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cine_reserva`
--

CREATE TABLE `cine_reserva` (
  `id` int(11) NOT NULL,
  `numeroEntradas` int(11) NOT NULL,
  `sesion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cine_sala`
--

CREATE TABLE `cine_sala` (
  `id` int(11) NOT NULL,
  `numeroSala` int(11) NOT NULL,
  `numeroFilas` int(11) NOT NULL,
  `numeroAsientosFila` int(11) NOT NULL,
  `numeroAsientosUltimaFila` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cine_sala`
--

INSERT INTO `cine_sala` (`id`, `numeroSala`, `numeroFilas`, `numeroAsientosFila`, `numeroAsientosUltimaFila`) VALUES
(1, 1, 8, 16, 10),
(2, 2, 7, 10, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cine_sesion`
--

CREATE TABLE `cine_sesion` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time(6) NOT NULL,
  `pelicula_id` int(11) NOT NULL,
  `sala_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cine_sesion`
--

INSERT INTO `cine_sesion` (`id`, `fecha`, `hora`, `pelicula_id`, `sala_id`) VALUES
(1, '2018-06-29', '20:00:00.000000', 3, 1),
(2, '2018-06-29', '22:30:00.000000', 3, 2),
(3, '2018-06-27', '12:00:00.000000', 4, 2),
(4, '2018-06-28', '12:00:00.000000', 4, 2),
(5, '2018-06-30', '12:00:00.000000', 4, 1),
(6, '2018-06-01', '12:39:29.000000', 5, 1),
(10, '2018-06-17', '12:00:00.000000', 5, 2),
(11, '2018-06-29', '20:00:00.000000', 3, 2),
(12, '2018-06-28', '20:00:00.000000', 6, 1),
(13, '2018-06-28', '20:00:00.000000', 6, 2),
(14, '2018-06-30', '18:00:00.000000', 7, 2),
(15, '2018-06-30', '22:30:00.000000', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2018-06-15 15:54:15.461820', '1', 'Pelicula object (1)', 1, '[{\"added\": {}}]', 2, 1),
(2, '2018-06-15 15:54:39.003994', '1', 'Comentario object (1)', 1, '[{\"added\": {}}]', 1, 1),
(3, '2018-06-15 15:54:56.660539', '2', 'Comentario object (2)', 1, '[{\"added\": {}}]', 1, 1),
(4, '2018-06-15 16:55:08.064552', '2', 'Pelicula object (2)', 1, '[{\"added\": {}}]', 2, 1),
(5, '2018-06-15 16:57:23.773235', '2', 'Pelicula object (2)', 2, '[{\"changed\": {\"fields\": [\"foto\"]}}]', 2, 1),
(6, '2018-06-15 16:57:34.488040', '2', 'Pelicula object (2)', 3, '', 2, 1),
(7, '2018-06-15 16:57:45.619582', '3', 'Pelicula object (3)', 1, '[{\"added\": {}}]', 2, 1),
(8, '2018-06-15 17:02:22.861185', '3', 'Pelicula object (3)', 2, '[{\"changed\": {\"fields\": [\"foto\"]}}]', 2, 1),
(9, '2018-06-16 21:30:14.277466', '1', 'Comentario object (1)', 1, '[{\"added\": {}}]', 1, 1),
(10, '2018-06-16 21:30:25.011788', '2', 'Comentario object (2)', 1, '[{\"added\": {}}]', 1, 1),
(11, '2018-06-16 21:34:58.476512', '4', 'Pelicula object (4)', 1, '[{\"added\": {}}]', 2, 1),
(12, '2018-06-16 21:35:26.717284', '3', 'Comentario object (3)', 1, '[{\"added\": {}}]', 1, 1),
(13, '2018-06-16 21:35:53.846078', '4', 'Comentario object (4)', 1, '[{\"added\": {}}]', 1, 1),
(14, '2018-06-16 21:36:29.348511', '1', 'Sala object (1)', 1, '[{\"added\": {}}]', 11, 1),
(15, '2018-06-16 21:36:46.270368', '2', 'Sala object (2)', 1, '[{\"added\": {}}]', 11, 1),
(16, '2018-06-16 21:37:29.150494', '1', 'Sesion object (1)', 1, '[{\"added\": {}}]', 10, 1),
(17, '2018-06-16 21:37:54.052130', '2', 'Sesion object (2)', 1, '[{\"added\": {}}]', 10, 1),
(18, '2018-06-16 21:38:12.584446', '3', 'Sesion object (3)', 1, '[{\"added\": {}}]', 10, 1),
(19, '2018-06-16 21:38:27.456708', '4', 'Sesion object (4)', 1, '[{\"added\": {}}]', 10, 1),
(20, '2018-06-16 21:38:42.284910', '5', 'Sesion object (5)', 1, '[{\"added\": {}}]', 10, 1),
(21, '2018-06-17 12:39:09.313593', '5', 'Pelicula object (5)', 1, '[{\"added\": {}}]', 2, 1),
(22, '2018-06-17 12:39:31.320083', '6', 'Sesion object (6)', 1, '[{\"added\": {}}]', 10, 1),
(23, '2018-06-17 12:40:11.847999', '7', 'Sesion object (7)', 1, '[{\"added\": {}}]', 10, 1),
(24, '2018-06-17 12:40:38.190891', '8', 'Sesion object (8)', 1, '[{\"added\": {}}]', 10, 1),
(25, '2018-06-17 12:41:00.273921', '9', 'Sesion object (9)', 1, '[{\"added\": {}}]', 10, 1),
(26, '2018-06-17 12:41:18.630387', '9', 'Sesion object (9)', 3, '', 10, 1),
(27, '2018-06-17 12:41:32.667833', '8', 'Sesion object (8)', 3, '', 10, 1),
(28, '2018-06-17 12:41:59.046371', '7', 'Sesion object (7)', 3, '', 10, 1),
(29, '2018-06-17 12:44:38.726798', '10', 'Sesion object (10)', 1, '[{\"added\": {}}]', 10, 1),
(30, '2018-06-17 12:49:39.846584', '10', 'Sesion object (10)', 2, '[{\"changed\": {\"fields\": [\"hora\"]}}]', 10, 1),
(31, '2018-06-18 12:47:47.906972', '5', 'Pelicula object (5)', 2, '[{\"changed\": {\"fields\": [\"foto\"]}}]', 2, 1),
(32, '2018-06-18 12:48:01.590865', '5', 'Pelicula object (5)', 2, '[{\"changed\": {\"fields\": [\"foto\"]}}]', 2, 1),
(33, '2018-06-18 12:48:08.838745', '5', 'Pelicula object (5)', 2, '[{\"changed\": {\"fields\": [\"foto\"]}}]', 2, 1),
(34, '2018-06-18 12:48:36.641566', '5', 'Pelicula object (5)', 2, '[{\"changed\": {\"fields\": [\"foto\"]}}]', 2, 1),
(35, '2018-06-18 13:08:35.906556', '5', 'Pelicula object (5)', 2, '[{\"changed\": {\"fields\": [\"foto\"]}}]', 2, 1),
(36, '2018-06-18 13:08:43.020816', '5', 'Pelicula object (5)', 2, '[{\"changed\": {\"fields\": [\"foto\"]}}]', 2, 1),
(37, '2018-06-18 14:21:12.584541', '11', 'Sesion object (11)', 1, '[{\"added\": {}}]', 10, 1),
(38, '2018-06-18 20:19:07.815333', '3', 'Pelicula object (3)', 2, '[{\"changed\": {\"fields\": [\"director\", \"sinopsis\"]}}]', 2, 1),
(39, '2018-06-18 20:21:12.050952', '4', 'Pelicula object (4)', 2, '[{\"changed\": {\"fields\": [\"sinopsis\"]}}]', 2, 1),
(40, '2018-06-18 20:22:49.830001', '5', 'Pelicula object (5)', 2, '[{\"changed\": {\"fields\": [\"titulo\", \"director\", \"sinopsis\", \"foto\"]}}]', 2, 1),
(41, '2018-06-18 20:23:12.655137', '5', 'Pelicula object (5)', 2, '[{\"changed\": {\"fields\": [\"foto\"]}}]', 2, 1),
(42, '2018-06-18 20:28:12.007769', '6', 'Pelicula object (6)', 1, '[{\"added\": {}}]', 2, 1),
(43, '2018-06-18 20:32:51.760605', '7', 'Pelicula object (7)', 1, '[{\"added\": {}}]', 2, 1),
(44, '2018-06-18 20:33:37.783213', '12', 'Sesion object (12)', 1, '[{\"added\": {}}]', 10, 1),
(45, '2018-06-18 20:34:01.010018', '13', 'Sesion object (13)', 1, '[{\"added\": {}}]', 10, 1),
(46, '2018-06-18 20:34:21.041163', '14', 'Sesion object (14)', 1, '[{\"added\": {}}]', 10, 1),
(47, '2018-06-18 20:34:48.518117', '15', 'Sesion object (15)', 1, '[{\"added\": {}}]', 10, 1),
(48, '2018-06-18 20:35:04.219440', '14', 'Comentario object (14)', 3, '', 1, 1),
(49, '2018-06-18 20:35:09.828766', '13', 'Comentario object (13)', 3, '', 1, 1),
(50, '2018-06-18 20:35:18.784532', '12', 'Comentario object (12)', 3, '', 1, 1),
(51, '2018-06-18 20:35:25.876933', '11', 'Comentario object (11)', 3, '', 1, 1),
(52, '2018-06-18 20:35:33.425853', '10', 'Comentario object (10)', 3, '', 1, 1),
(53, '2018-06-18 20:35:42.710253', '9', 'Comentario object (9)', 3, '', 1, 1),
(54, '2018-06-18 20:35:42.725893', '8', 'Comentario object (8)', 3, '', 1, 1),
(55, '2018-06-18 20:35:42.725893', '7', 'Comentario object (7)', 3, '', 1, 1),
(56, '2018-06-18 20:35:42.725893', '6', 'Comentario object (6)', 3, '', 1, 1),
(57, '2018-06-18 20:35:42.741467', '5', 'Comentario object (5)', 3, '', 1, 1),
(58, '2018-06-18 20:35:42.741467', '4', 'Comentario object (4)', 3, '', 1, 1),
(59, '2018-06-18 20:35:42.757124', '3', 'Comentario object (3)', 3, '', 1, 1),
(60, '2018-06-18 20:35:42.757124', '2', 'Comentario object (2)', 3, '', 1, 1),
(61, '2018-06-18 20:35:42.757124', '1', 'Comentario object (1)', 3, '', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(3, 'admin', 'logentry'),
(5, 'auth', 'group'),
(4, 'auth', 'permission'),
(6, 'auth', 'user'),
(12, 'cine', 'asiento'),
(1, 'cine', 'comentario'),
(2, 'cine', 'pelicula'),
(9, 'cine', 'reserva'),
(11, 'cine', 'sala'),
(10, 'cine', 'sesion'),
(7, 'contenttypes', 'contenttype'),
(8, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2018-06-15 15:51:50.748076'),
(2, 'auth', '0001_initial', '2018-06-15 15:51:51.296730'),
(3, 'admin', '0001_initial', '2018-06-15 15:51:51.485988'),
(4, 'admin', '0002_logentry_remove_auto_add', '2018-06-15 15:51:51.501614'),
(5, 'contenttypes', '0002_remove_content_type_name', '2018-06-15 15:51:51.610986'),
(6, 'auth', '0002_alter_permission_name_max_length', '2018-06-15 15:51:51.673487'),
(7, 'auth', '0003_alter_user_email_max_length', '2018-06-15 15:51:51.751611'),
(8, 'auth', '0004_alter_user_username_opts', '2018-06-15 15:51:51.767235'),
(9, 'auth', '0005_alter_user_last_login_null', '2018-06-15 15:51:51.814109'),
(10, 'auth', '0006_require_contenttypes_0002', '2018-06-15 15:51:51.829736'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2018-06-15 15:51:51.845363'),
(12, 'auth', '0008_alter_user_username_max_length', '2018-06-15 15:51:51.972423'),
(13, 'auth', '0009_alter_user_last_name_max_length', '2018-06-15 15:51:52.050547'),
(14, 'cine', '0001_initial', '2018-06-15 15:51:52.210614'),
(15, 'sessions', '0001_initial', '2018-06-15 15:51:52.256991'),
(16, 'cine', '0002_auto_20180615_1818', '2018-06-15 16:18:19.596067'),
(17, 'cine', '0003_auto_20180618_1502', '2018-06-18 13:02:56.584324');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('u2thaipjg8a1tjnmn52t79uos6u43xun', 'MjMxZDI0NzZjZTczNjhhNDUyOGYzNTA0OTQ2MGQ4ZTJmNmRlMzdiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5YWJjNDA4YzM0OThiOTllZDBjZWI2MWU3M2Y2YzI4ZTY1ZTkxOGJjIn0=', '2018-06-30 21:29:47.821521');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `cine_asiento`
--
ALTER TABLE `cine_asiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cine_asiento_reserva_id_27ea8acf_fk_cine_reserva_id` (`reserva_id`);

--
-- Indices de la tabla `cine_comentario`
--
ALTER TABLE `cine_comentario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cine_comentario_pelicula_id_98b4b446_fk_cine_pelicula_id` (`pelicula_id`);

--
-- Indices de la tabla `cine_pelicula`
--
ALTER TABLE `cine_pelicula`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cine_reserva`
--
ALTER TABLE `cine_reserva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cine_reserva_sesion_id_d5d1ebbf_fk_cine_sesion_id` (`sesion_id`);

--
-- Indices de la tabla `cine_sala`
--
ALTER TABLE `cine_sala`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cine_sesion`
--
ALTER TABLE `cine_sesion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cine_sesion_pelicula_id_224747be_fk_cine_pelicula_id` (`pelicula_id`),
  ADD KEY `cine_sesion_sala_id_f3c3cc7c_fk_cine_sala_id` (`sala_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cine_asiento`
--
ALTER TABLE `cine_asiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cine_comentario`
--
ALTER TABLE `cine_comentario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `cine_pelicula`
--
ALTER TABLE `cine_pelicula`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `cine_reserva`
--
ALTER TABLE `cine_reserva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cine_sala`
--
ALTER TABLE `cine_sala`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cine_sesion`
--
ALTER TABLE `cine_sesion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `cine_asiento`
--
ALTER TABLE `cine_asiento`
  ADD CONSTRAINT `cine_asiento_reserva_id_27ea8acf_fk_cine_reserva_id` FOREIGN KEY (`reserva_id`) REFERENCES `cine_reserva` (`id`);

--
-- Filtros para la tabla `cine_comentario`
--
ALTER TABLE `cine_comentario`
  ADD CONSTRAINT `cine_comentario_pelicula_id_98b4b446_fk_cine_pelicula_id` FOREIGN KEY (`pelicula_id`) REFERENCES `cine_pelicula` (`id`);

--
-- Filtros para la tabla `cine_reserva`
--
ALTER TABLE `cine_reserva`
  ADD CONSTRAINT `cine_reserva_sesion_id_d5d1ebbf_fk_cine_sesion_id` FOREIGN KEY (`sesion_id`) REFERENCES `cine_sesion` (`id`);

--
-- Filtros para la tabla `cine_sesion`
--
ALTER TABLE `cine_sesion`
  ADD CONSTRAINT `cine_sesion_pelicula_id_224747be_fk_cine_pelicula_id` FOREIGN KEY (`pelicula_id`) REFERENCES `cine_pelicula` (`id`),
  ADD CONSTRAINT `cine_sesion_sala_id_f3c3cc7c_fk_cine_sala_id` FOREIGN KEY (`sala_id`) REFERENCES `cine_sala` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
