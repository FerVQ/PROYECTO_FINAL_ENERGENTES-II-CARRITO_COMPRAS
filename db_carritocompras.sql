/*
 Navicat Premium Data Transfer

 Source Server         : LOCAL
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : db_carritocompras

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 25/06/2024 16:24:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categoria
-- ----------------------------
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria`  (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`idCategoria`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categoria
-- ----------------------------
INSERT INTO `categoria` VALUES (1, 'Electrónica de Consumo');
INSERT INTO `categoria` VALUES (2, 'Computadoras y Accesorios');
INSERT INTO `categoria` VALUES (3, 'Dispositivos Móviles y Accesorios');
INSERT INTO `categoria` VALUES (4, 'Electrodomésticos');

-- ----------------------------
-- Table structure for cliente
-- ----------------------------
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente`  (
  `idCliente` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Dni` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Nombres` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `idRol` int NOT NULL,
  PRIMARY KEY (`idCliente`) USING BTREE,
  UNIQUE INDEX `Dni`(`Dni` ASC) USING BTREE,
  INDEX `idRol`(`idRol` ASC) USING BTREE,
  CONSTRAINT `Usuario_Rol` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cliente
-- ----------------------------
INSERT INTO `cliente` VALUES (1, '12345678', 'Administrador', 'Av.Juan Pablo II', 'admin@gmail.com', '1234', 'img/fotouser/user01.png', 1);
INSERT INTO `cliente` VALUES (2, '13993772', 'Fernando Villca', 'Av. Cecilio Acosta', 'fernandovq@gmail.com', '555', 'img/fotouser/user02.png', 2);
INSERT INTO `cliente` VALUES (4, '14785236', 'Jhosfer', 'Ballivian', 'jhosfer@gmail.com', '1234', 'C:UsersASUSDesktopEJERCICIOS_EMERGENTESTienda_Web_Carritosrcmainwebappimgfotouser', 2);
INSERT INTO `cliente` VALUES (5, '1234578', 'Jhosfer2', 'Ballivian', 'jhosfer2@gmail.com', '310323', 'C:UsersASUSDesktopEJERCICIOS_EMERGENTESTienda_Web_Carritosrcmainwebappimgfotouser/user02.png', 2);
INSERT INTO `cliente` VALUES (8, '15676589', 'Jhoselin Lucia', 'Ballivian', 'jhoselin@gmail.com', '555', NULL, 2);
INSERT INTO `cliente` VALUES (11, '4840607', 'Sarahi ', 'ballivian', 'sarahi@gmail.com', '12345', NULL, 2);
INSERT INTO `cliente` VALUES (12, '12458796', 'Ruben', 'Villa Dela', 'ruben@gmail.com', '123456', NULL, 2);
INSERT INTO `cliente` VALUES (13, '13993778', 'Sharel', 'collpami', 'sharell@gmail.com', '123456', NULL, 2);

-- ----------------------------
-- Table structure for compras
-- ----------------------------
DROP TABLE IF EXISTS `compras`;
CREATE TABLE `compras`  (
  `idCompras` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `idCliente` int UNSIGNED NOT NULL,
  `idPago` int UNSIGNED NOT NULL,
  `FechaCompras` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Monto` double NULL DEFAULT NULL,
  `descuento` double NULL DEFAULT NULL,
  `igv` double NULL DEFAULT NULL,
  `montoFinal` double NULL DEFAULT NULL,
  `Estado` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idCompras`) USING BTREE,
  INDEX `Compras_FKIndex1`(`idPago` ASC) USING BTREE,
  INDEX `Compras_FKIndex2`(`idCliente` ASC) USING BTREE,
  CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`idPago`) REFERENCES `pago` (`idPago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of compras
-- ----------------------------
INSERT INTO `compras` VALUES (94, 8, 119, '2024-06-23', 19000, 0, 3420, 19000, 'Cancelado - En Proceso de Envio');
INSERT INTO `compras` VALUES (95, 8, 121, '2024-06-23', 30500, 0, 5490, 30500, 'Cancelado - En Proceso de Envio');
INSERT INTO `compras` VALUES (96, 8, 122, '2024-06-23', 34000, 0, 6120, 34000, 'Cancelado - En Proceso de Envio');
INSERT INTO `compras` VALUES (97, 8, 123, '2024-06-23', 13500, 0, 2430, 13500, 'Cancelado - En Proceso de Envio');
INSERT INTO `compras` VALUES (98, 8, 124, '2024-06-23', 13500, 0, 2430, 13500, 'Cancelado - En Proceso de Envio');
INSERT INTO `compras` VALUES (99, 8, 125, '2024-06-24', 13500, 0, 2430, 13500, 'Cancelado - En Proceso de Envio');
INSERT INTO `compras` VALUES (100, 8, 126, '2024-06-24', 7000, 0, 1260, 7000, 'Cancelado - En Proceso de Envio');
INSERT INTO `compras` VALUES (101, 8, 127, '2024-06-24', 12480, 0, 2246.4, 12480, 'Cancelado - En Proceso de Envio');
INSERT INTO `compras` VALUES (102, 4, 128, '2024-06-24', 8000, 0, 1440, 8000, 'Cancelado - En Proceso de Envio');
INSERT INTO `compras` VALUES (103, 12, 129, '2024-06-25', 13500, 0, 2430, 13500, 'Cancelado - En Proceso de Envio');
INSERT INTO `compras` VALUES (104, 8, 131, '2024-06-25', 17400, 0, 3132, 17400, 'Cancelado - En Proceso de Envio');
INSERT INTO `compras` VALUES (105, 2, 132, '2024-06-25', 11500, 0, 2070, 11500, 'Cancelado - En Proceso de Envio');
INSERT INTO `compras` VALUES (106, 2, 133, '2024-06-25', 12500, 0, 2250, 12500, 'Cancelado - En Proceso de Envio');
INSERT INTO `compras` VALUES (107, 2, 134, '2024-06-25', 15000, 0, 2700, 15000, 'Cancelado - En Proceso de Envio');
INSERT INTO `compras` VALUES (108, 2, 135, '2024-06-25', 17000, 0, 3060, 17000, 'Cancelado - En Proceso de Envio');
INSERT INTO `compras` VALUES (109, 2, 136, '2024-06-25', 20660, 0, 3718.7999999999997, 20660, 'Cancelado - En Proceso de Envio');
INSERT INTO `compras` VALUES (110, 2, 137, '2024-06-25', 17000, 0, 3060, 17000, 'Cancelado - En Proceso de Envio');
INSERT INTO `compras` VALUES (111, 1, 138, '2024-06-25', 3500, 0, 630, 3500, 'Cancelado - En Proceso de Envio');

-- ----------------------------
-- Table structure for detalle_compras
-- ----------------------------
DROP TABLE IF EXISTS `detalle_compras`;
CREATE TABLE `detalle_compras`  (
  `idDetalle` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `idProducto` int UNSIGNED NOT NULL,
  `idCompras` int UNSIGNED NOT NULL,
  `Cantidad` int UNSIGNED NULL DEFAULT NULL,
  `PrecioCompra` double NULL DEFAULT NULL,
  `descuento` double NULL DEFAULT NULL,
  `precioFinal` double NULL DEFAULT NULL,
  `subtotal` double NULL DEFAULT NULL,
  PRIMARY KEY (`idDetalle`, `idProducto`, `idCompras`) USING BTREE,
  INDEX `Producto_has_Compras_FKIndex1`(`idProducto` ASC) USING BTREE,
  INDEX `Producto_has_Compras_FKIndex2`(`idCompras` ASC) USING BTREE,
  CONSTRAINT `detalle_compras_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `detalle_compras_ibfk_2` FOREIGN KEY (`idCompras`) REFERENCES `compras` (`idCompras`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 211 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detalle_compras
-- ----------------------------
INSERT INTO `detalle_compras` VALUES (163, 3, 94, 2, 5500, 0, 5500, 11000);
INSERT INTO `detalle_compras` VALUES (164, 1, 94, 1, 3500, 0, 3500, 3500);
INSERT INTO `detalle_compras` VALUES (165, 2, 94, 1, 4500, 0, 4500, 4500);
INSERT INTO `detalle_compras` VALUES (166, 2, 95, 4, 4500, 0, 4500, 18000);
INSERT INTO `detalle_compras` VALUES (167, 1, 95, 2, 3500, 0, 3500, 7000);
INSERT INTO `detalle_compras` VALUES (168, 3, 95, 1, 5500, 0, 5500, 5500);
INSERT INTO `detalle_compras` VALUES (169, 1, 96, 4, 3500, 0, 3500, 14000);
INSERT INTO `detalle_compras` VALUES (170, 3, 96, 2, 5500, 0, 5500, 11000);
INSERT INTO `detalle_compras` VALUES (171, 2, 96, 2, 4500, 0, 4500, 9000);
INSERT INTO `detalle_compras` VALUES (172, 1, 97, 1, 3500, 0, 3500, 3500);
INSERT INTO `detalle_compras` VALUES (173, 2, 97, 1, 4500, 0, 4500, 4500);
INSERT INTO `detalle_compras` VALUES (174, 3, 97, 1, 5500, 0, 5500, 5500);
INSERT INTO `detalle_compras` VALUES (175, 1, 98, 1, 3500, 0, 3500, 3500);
INSERT INTO `detalle_compras` VALUES (176, 2, 98, 1, 4500, 0, 4500, 4500);
INSERT INTO `detalle_compras` VALUES (177, 3, 98, 1, 5500, 0, 5500, 5500);
INSERT INTO `detalle_compras` VALUES (178, 1, 99, 1, 3500, 0, 3500, 3500);
INSERT INTO `detalle_compras` VALUES (179, 2, 99, 1, 4500, 0, 4500, 4500);
INSERT INTO `detalle_compras` VALUES (180, 3, 99, 1, 5500, 0, 5500, 5500);
INSERT INTO `detalle_compras` VALUES (181, 1, 100, 2, 3500, 0, 3500, 7000);
INSERT INTO `detalle_compras` VALUES (182, 5, 101, 1, 4480, 0, 4480, 4480);
INSERT INTO `detalle_compras` VALUES (183, 2, 101, 1, 4500, 0, 4500, 4500);
INSERT INTO `detalle_compras` VALUES (184, 1, 101, 1, 3500, 0, 3500, 3500);
INSERT INTO `detalle_compras` VALUES (185, 1, 102, 1, 3500, 0, 3500, 3500);
INSERT INTO `detalle_compras` VALUES (186, 2, 102, 1, 4500, 0, 4500, 4500);
INSERT INTO `detalle_compras` VALUES (187, 2, 103, 1, 4500, 0, 4500, 4500);
INSERT INTO `detalle_compras` VALUES (188, 1, 103, 1, 3500, 0, 3500, 3500);
INSERT INTO `detalle_compras` VALUES (189, 3, 103, 1, 5500, 0, 5500, 5500);
INSERT INTO `detalle_compras` VALUES (190, 1, 104, 1, 3500, 0, 3500, 3500);
INSERT INTO `detalle_compras` VALUES (191, 2, 104, 1, 4500, 0, 4500, 4500);
INSERT INTO `detalle_compras` VALUES (192, 3, 104, 1, 5500, 0, 5500, 5500);
INSERT INTO `detalle_compras` VALUES (193, 6, 104, 1, 3900, 0, 3900, 3900);
INSERT INTO `detalle_compras` VALUES (194, 1, 105, 2, 3500, 0, 3500, 7000);
INSERT INTO `detalle_compras` VALUES (195, 2, 105, 1, 4500, 0, 4500, 4500);
INSERT INTO `detalle_compras` VALUES (196, 1, 106, 1, 3500, 0, 3500, 3500);
INSERT INTO `detalle_compras` VALUES (197, 2, 106, 2, 4500, 0, 4500, 9000);
INSERT INTO `detalle_compras` VALUES (198, 1, 107, 3, 3500, 0, 3500, 10500);
INSERT INTO `detalle_compras` VALUES (199, 2, 107, 1, 4500, 0, 4500, 4500);
INSERT INTO `detalle_compras` VALUES (200, 1, 108, 2, 3500, 0, 3500, 7000);
INSERT INTO `detalle_compras` VALUES (201, 2, 108, 1, 4500, 0, 4500, 4500);
INSERT INTO `detalle_compras` VALUES (202, 3, 108, 1, 5500, 0, 5500, 5500);
INSERT INTO `detalle_compras` VALUES (203, 2, 109, 2, 4500, 0, 4500, 9000);
INSERT INTO `detalle_compras` VALUES (204, 4, 109, 1, 3280, 0, 3280, 3280);
INSERT INTO `detalle_compras` VALUES (205, 6, 109, 1, 3900, 0, 3900, 3900);
INSERT INTO `detalle_compras` VALUES (206, 5, 109, 1, 4480, 0, 4480, 4480);
INSERT INTO `detalle_compras` VALUES (207, 1, 110, 2, 3500, 0, 3500, 7000);
INSERT INTO `detalle_compras` VALUES (208, 2, 110, 1, 4500, 0, 4500, 4500);
INSERT INTO `detalle_compras` VALUES (209, 3, 110, 1, 5500, 0, 5500, 5500);
INSERT INTO `detalle_compras` VALUES (210, 1, 111, 1, 3500, 0, 3500, 3500);

-- ----------------------------
-- Table structure for pago
-- ----------------------------
DROP TABLE IF EXISTS `pago`;
CREATE TABLE `pago`  (
  `idPago` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Monto` double NULL DEFAULT NULL,
  `idTarjeta` int NOT NULL,
  PRIMARY KEY (`idPago`) USING BTREE,
  INDEX `idTarjeta`(`idTarjeta` ASC) USING BTREE,
  CONSTRAINT `fgfdgfdgfd` FOREIGN KEY (`idTarjeta`) REFERENCES `tarjeta` (`idTarjeta`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 139 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pago
-- ----------------------------
INSERT INTO `pago` VALUES (119, 19000, 1);
INSERT INTO `pago` VALUES (120, 19000, 2);
INSERT INTO `pago` VALUES (121, 30500, 2);
INSERT INTO `pago` VALUES (122, 34000, 2);
INSERT INTO `pago` VALUES (123, 13500, 2);
INSERT INTO `pago` VALUES (124, 13500, 2);
INSERT INTO `pago` VALUES (125, 13500, 2);
INSERT INTO `pago` VALUES (126, 7000, 2);
INSERT INTO `pago` VALUES (127, 12480, 2);
INSERT INTO `pago` VALUES (128, 8000, 2);
INSERT INTO `pago` VALUES (129, 13500, 2);
INSERT INTO `pago` VALUES (130, 13500, 3);
INSERT INTO `pago` VALUES (131, 17400, 2);
INSERT INTO `pago` VALUES (132, 11500, 1);
INSERT INTO `pago` VALUES (133, 12500, 1);
INSERT INTO `pago` VALUES (134, 15000, 1);
INSERT INTO `pago` VALUES (135, 17000, 1);
INSERT INTO `pago` VALUES (136, 20660, 1);
INSERT INTO `pago` VALUES (137, 17000, 2);
INSERT INTO `pago` VALUES (138, 3500, 4);

-- ----------------------------
-- Table structure for producto
-- ----------------------------
DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto`  (
  `idProducto` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Foto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Precio` double NULL DEFAULT NULL,
  `Stock` int UNSIGNED NULL DEFAULT NULL,
  `idCategoria` int NOT NULL,
  `estado` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idProducto`) USING BTREE,
  UNIQUE INDEX `Nombres`(`Nombres` ASC) USING BTREE,
  INDEX `idCategoria`(`idCategoria` ASC) USING BTREE,
  CONSTRAINT `clave-foranea` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of producto
-- ----------------------------
INSERT INTO `producto` VALUES (1, 'Laptop HP 240 G7 Core i3', 'img/productos/lap1.jpg', 'Modelo: 151D5LT#ABM,Pantalla: 14p,Tecnología de pantalla:LED,Resolución: 1366 x 768 HD,Procesador: Intel Core i3-1005G1 1.2Ghz,Memoria: DDR4 4GB,Almacenamiento: 1TB, Programación Orientada  Objeto.', 3500, 9970, 2, 'Nuevo');
INSERT INTO `producto` VALUES (2, 'Laptop HP 360 G7 Core i5', 'img/productos/lap2.jpg', 'Modelo: 123GT#ABM,Pantalla: 14p,Tecnología de pantalla:LED,Resolución: 1366 x 768 HD,Procesador: Intel Core i5-1005G2 1.2Ghz,Memoria: DDR4 8GB,Almacenamiento: 1TB, Programación Orientada  Objeto.', 4500, 9975, 2, 'Nuevo');
INSERT INTO `producto` VALUES (3, 'Laptop Dell NB latitude 3410 Core i5', 'img/productos/lap3.jpg', 'Modelo: 123GT#ABM,Pantalla: 14p,Tecnología de pantalla:LED,Resolución: 1366 x 768 HD,Procesador: Intel Core i5-1005G2 1.2Ghz,Memoria: DDR4 16GB,Almacenamiento: 2TB, Programación Orientada  Objeto.', 5500, 9985, 2, 'Nuevo');
INSERT INTO `producto` VALUES (4, 'Notebook HP 15-fd0006la 15.6\" FHD Core i7-1355U hasta 5GHz 12GB DDR4-3200 (1x4GB / 1x8GB)', 'img/productos/lap4.jpg', 'Marca: HP\r\nModelo: 15-fd0006la\r\nProcesador: INTEL CORE i7 1355U HASTA 5.0 GHZ\r\nPantalla de pulgadas: 15.6\" FULL HD RESOLUCION MAXIMA 1920 x 1080\r\nMemoria RAM: 12 GB DDR4 - 3200 MHZ\r\nAlmacenamiento: 512GB SSD M.2 PCIe NVMe\r\nVideo Integrado Intel Iris Xᵉ Gr', 3280, 99, 2, 'Nuevo');
INSERT INTO `producto` VALUES (5, 'Laptop HP ProBook 440 G10, Core i7-1355U', 'img/productos/lap5.jpg', 'Marca: HP\r\nModelo: PROBOOK 440 G10\r\nProcesador: INTEL CORE i7 1355U HASTA 5.0 GHZ CACHE L3 12 MB\r\nMemoria RAM: 8 GB DDR4 - 3200 MHZ\r\nAlmacenamiento: 512GB SSD M.2 PCIe NVMe\r\nVideo Integrado Gráficos Intel UHD Graphics\r\nTeclado HP Premium (resistente a sal', 4480, 198, 2, 'Nuevo');
INSERT INTO `producto` VALUES (6, 'Laptop HP 240 G7 Core i7', 'img/productos/lap13.jpg', 'Modelo: 151D5LT#ABM,Pantalla: 14p,Tecnología de pantalla:LED,Resolución: 1366 x 768 HD,Procesador: Intel Core i3-1005G1 1.2Ghz,Memoria: DDR4 4GB,Almacenamiento: 1TB, Programación Orientada  Objeto.', 3900, 9995, 2, 'Nuevo');

-- ----------------------------
-- Table structure for rol
-- ----------------------------
DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol`  (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`idRol`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rol
-- ----------------------------
INSERT INTO `rol` VALUES (1, 'Administrador');
INSERT INTO `rol` VALUES (2, 'Usuarios');

-- ----------------------------
-- Table structure for tarjeta
-- ----------------------------
DROP TABLE IF EXISTS `tarjeta`;
CREATE TABLE `tarjeta`  (
  `idTarjeta` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Numero` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FechaCaducidad` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CodSeguridad` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `saldo` double NOT NULL,
  PRIMARY KEY (`idTarjeta`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tarjeta
-- ----------------------------
INSERT INTO `tarjeta` VALUES (1, 'Fernando', '1111111111111111', '06/23', '555', 4340);
INSERT INTO `tarjeta` VALUES (2, 'Jhoselin', '2222222222222222', '06/23', '123', 620);
INSERT INTO `tarjeta` VALUES (3, 'Ruben', '3333333333333333', '24/24', '123', 786500);
INSERT INTO `tarjeta` VALUES (4, 'Fercho', '3333333333333333', '12/24', '123', 996500);

SET FOREIGN_KEY_CHECKS = 1;
