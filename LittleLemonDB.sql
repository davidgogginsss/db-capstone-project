DROP DATABASE IF EXISTS LittleLemonDM;

CREATE DATABASE `LittleLemonDM` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION = 'N' */;

USE LittleLemonDM;


-- LittleLemonDM.Delivery definition

CREATE TABLE `Delivery`
(
    `DeliveryID`     INT         NOT NULL,
    `DeliveryDate`   DATE        NOT NULL,
    `DeliveryStatus` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`DeliveryID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;


-- LittleLemonDM.Menus definition

CREATE TABLE `Menus`
(
    `MenuID`  INT          NOT NULL,
    `Cuisine` VARCHAR(100) NOT NULL,
    `Starter` VARCHAR(100) NOT NULL,
    `Course`  VARCHAR(100) NOT NULL,
    `Drink`   VARCHAR(100) NOT NULL,
    `Dessert` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`MenuID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;


-- LittleLemonDM.Customers definition

CREATE TABLE `Customers`
(
    `CustomerID`    INT          NOT NULL,
    `CustomerName`  VARCHAR(100) NOT NULL,
    `CustomerEmail` VARCHAR(100) NOT NULL,
    `CustomerPhone` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`CustomerID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;


-- LittleLemonDM.Staffs definition

CREATE TABLE `Staffs`
(
    `StaffID`     INT            NOT NULL,
    `StaffRole`   VARCHAR(100)   NOT NULL,
    `StaffSalary` DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (`StaffID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;


-- LittleLemonDM.Bookings definition

CREATE TABLE `Bookings`
(
    `BookingID`    INT  NOT NULL,
    `BookingDate`  DATE NOT NULL,
    `BookingTable` INT  NOT NULL,
    `CustomerID`   INT  NOT NULL,
    PRIMARY KEY (`BookingID`),
    KEY `Bookings_Customers_FK` (`CustomerID`),
    CONSTRAINT `Bookings_Customers_FK` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;


-- LittleLemonDM.Orders definition

CREATE TABLE `Orders`
(
    `OrderID`       INT            NOT NULL,
    `OrderDate`     DATE           NOT NULL,
    `OrderQuantity` INT            NOT NULL,
    `TotalCost`     DECIMAL(10, 2) NOT NULL,
    `BookingID`     INT            NOT NULL,
    `MenuID`        INT            NOT NULL,
    `DeliveryID`    INT            NOT NULL,
    `StaffID`       INT            NOT NULL,
    PRIMARY KEY (`OrderID`),
    KEY `Orders_Bookings_FK` (`BookingID`),
    KEY `Orders_Delivery_FK` (`DeliveryID`),
    KEY `Orders_Menus_FK` (`MenuID`),
    KEY `Orders_Staffs_FK` (`StaffID`),
    CONSTRAINT `Orders_Bookings_FK` FOREIGN KEY (`BookingID`) REFERENCES `Bookings` (`BookingID`),
    CONSTRAINT `Orders_Delivery_FK` FOREIGN KEY (`DeliveryID`) REFERENCES `Delivery` (`DeliveryID`),
    CONSTRAINT `Orders_Menus_FK` FOREIGN KEY (`MenuID`) REFERENCES `Menus` (`MenuID`),
    CONSTRAINT `Orders_Staffs_FK` FOREIGN KEY (`StaffID`) REFERENCES `Staffs` (`StaffID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;