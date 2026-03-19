-- =============================================
-- SHIPPING COMPANY DATABASE FOR PRACTICE
-- 4 tables • 25 realistic rows each
-- Perfect for SELECTs, JOINs (INNER/LEFT), filters, aggregates, dates, etc.
-- Works in PostgreSQL, MySQL, or SQLite (minor tweaks for BOOLEAN)
-- =============================================

-- 1. CREATE TABLES
create database test;

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(20),
    City VARCHAR(50),
    Country VARCHAR(50),
    SignupDate DATE
);

CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Phone VARCHAR(20),
    LicenseNumber VARCHAR(50) UNIQUE,
    HireDate DATE,
    Rating DECIMAL(3,2) CHECK (Rating BETWEEN 1.0 AND 5.0),
    IsActive BOOLEAN DEFAULT TRUE
);

CREATE TABLE Vehicles (
    VehicleID INT PRIMARY KEY,
    PlateNumber VARCHAR(20) UNIQUE,
    VehicleType VARCHAR(50),
    MaxCapacityKG INT CHECK (MaxCapacityKG > 0),
    YearManufactured INT,
    LastMaintenance DATE
);

CREATE TABLE Shipments (
    ShipmentID INT PRIMARY KEY,
    CustomerID INT,
    DriverID INT,
    VehicleID INT,
    OriginCity VARCHAR(50),
    DestinationCity VARCHAR(50),
    DistanceKM INT CHECK (DistanceKM >= 0),
    ShipmentDate DATE,
    ExpectedDelivery DATE,
    ActualDelivery DATE,
    Status VARCHAR(20),
    WeightKG DECIMAL(8,2),
    FreightCost DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID),
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID)
);

-- 2. INSERT 25 rows into each table (realistic shipping data)
-- Customers
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, City, Country, SignupDate) VALUES (1, 'Jacob Brown', 'jacob.brown@example.com', '+1-125-859-5506', 'San Diego', 'USA', '2023-04-05');
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, City, Country, SignupDate) VALUES (2, 'Emily Brown', 'emily.brown@example.com', '+1-792-858-9935', 'Chicago', 'USA', '2023-10-14');
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, City, Country, SignupDate) VALUES (3, 'Emma Smith', 'emma.smith@example.com', '+1-195-323-4811', 'Indianapolis', 'USA', '2023-10-01');
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, City, Country, SignupDate) VALUES (4, 'Harper Miller', 'harper.miller@example.com', '+1-833-765-9928', 'Columbus', 'USA', '2023-04-15');
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, City, Country, SignupDate) VALUES (5, 'Ethan Rodriguez', 'ethan.rodriguez@example.com', '+1-928-990-1106', 'Memphis', 'USA', '2023-03-23');
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, City, Country, SignupDate) VALUES (6, 'Charlotte Hernandez', 'charlotte.hernandez@example.com', '+1-384-259-4527', 'Memphis', 'USA', '2023-06-04');
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, City, Country, SignupDate) VALUES (7, 'Michael Gonzalez', 'michael.gonzalez@example.com', '+1-199-467-6635', 'Washington', 'USA', '2023-05-26');
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, City, Country, SignupDate) VALUES (8, 'Emma White', 'emma.white@example.com', '+1-570-649-3045', 'Fort Worth', 'USA', '2023-02-18');
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, City, Country, SignupDate) VALUES (9, 'Isabella Lee', 'isabella.lee@example.com', '+1-733-982-6925', 'Denver', 'USA', '2023-04-23');
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, City, Country, SignupDate) VALUES (10, 'Michael Johnson', 'michael.johnson@example.com', '+1-777-333-5741', 'Chicago', 'USA', '2023-04-28');
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, City, Country, SignupDate) VALUES (11, 'Sophia Gonzalez', 'sophia.gonzalez@example.com', '+1-384-564-6977', 'Philadelphia', 'USA', '2023-06-12');
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, City, Country, SignupDate) VALUES (12, 'James Perez', 'james.perez@example.com', '+1-373-818-2169', 'Washington', 'USA', '2023-11-06');
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, City, Country, SignupDate) VALUES (13, 'Harper White', 'harper.white@example.com', '+1-350-267-8573', 'Fort Worth', 'USA', '2023-05-21');
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, City, Country, SignupDate) VALUES (14, 'Logan Moore', 'logan.moore@example.com', '+1-324-801-6313', 'Memphis', 'USA', '2023-01-08');
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, City, Country, SignupDate) VALUES (15, 'Emma Hernandez', 'emma.hernandez@example.com', '+1-510-374-2084', 'San Antonio', 'USA', '2023-10-23');
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, City, Country, SignupDate) VALUES (16, 'Benjamin Miller', 'benjamin.miller@example.com', '+1-771-611-7482', 'Boston', 'USA', '2023-08-05');
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, City, Country, SignupDate) VALUES (17, 'Alexander Jones', 'alexander.jones@example.com', '+1-352-862-9830', 'Dallas', 'USA', '2023-12-19');
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, City, Country, SignupDate) VALUES (18, 'Charlotte Jackson', 'charlotte.jackson@example.com', '+1-508-470-4593', 'Phoenix', 'USA', '2023-09-16');
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, City, Country, SignupDate) VALUES (19, 'Michael Harris', 'michael.harris@example.com', '+1-148-981-2796', 'Phoenix', 'USA', '2023-11-06');
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, City, Country, SignupDate) VALUES (20, 'Abigail Wilson', 'abigail.wilson@example.com', '+1-710-165-7304', 'Fort Worth', 'USA', '2023-10-15');
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, City, Country, SignupDate) VALUES (21, 'Mason Rodriguez', 'mason.rodriguez@example.com', '+1-666-981-1188', 'El Paso', 'USA', '2023-12-04');
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, City, Country, SignupDate) VALUES (22, 'Abigail Moore', 'abigail.moore@example.com', '+1-868-373-6573', 'Houston', 'USA', '2023-05-14');
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, City, Country, SignupDate) VALUES (23, 'Olivia Anderson', 'olivia.anderson@example.com', '+1-103-839-5315', 'Indianapolis', 'USA', '2023-03-17');
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, City, Country, SignupDate) VALUES (24, 'Sophia Lee', 'sophia.lee@example.com', '+1-405-961-9317', 'Washington', 'USA', '2023-04-05');
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, City, Country, SignupDate) VALUES (25, 'Mia Harris', 'mia.harris@example.com', '+1-265-652-9689', 'New York', 'USA', '2023-10-11');

-- Drivers
INSERT INTO Drivers (DriverID, FullName, Phone, LicenseNumber, HireDate, Rating, IsActive) VALUES (1, 'Amelia Smith', '+1-214-471-6038', 'LIC41385', '2022-01-08', 4.82, TRUE);
INSERT INTO Drivers (DriverID, FullName, Phone, LicenseNumber, HireDate, Rating, IsActive) VALUES (2, 'Michael White', '+1-597-935-2133', 'LIC79822', '2022-03-05', 4.49, TRUE);
INSERT INTO Drivers (DriverID, FullName, Phone, LicenseNumber, HireDate, Rating, IsActive) VALUES (3, 'Alexander Taylor', '+1-993-721-7932', 'LIC37760', '2022-09-25', 4.59, TRUE);
INSERT INTO Drivers (DriverID, FullName, Phone, LicenseNumber, HireDate, Rating, IsActive) VALUES (4, 'Logan Martinez', '+1-508-787-7118', 'LIC67422', '2022-09-15', 3.68, TRUE);
INSERT INTO Drivers (DriverID, FullName, Phone, LicenseNumber, HireDate, Rating, IsActive) VALUES (5, 'Michael Hernandez', '+1-121-702-4770', 'LIC87128', '2022-04-01', 3.61, TRUE);
INSERT INTO Drivers (DriverID, FullName, Phone, LicenseNumber, HireDate, Rating, IsActive) VALUES (6, 'Ava Williams', '+1-132-980-6413', 'LIC19287', '2022-09-08', 3.92, FALSE);
INSERT INTO Drivers (DriverID, FullName, Phone, LicenseNumber, HireDate, Rating, IsActive) VALUES (7, 'James Moore', '+1-235-840-8744', 'LIC41850', '2022-08-26', 4.11, TRUE);
INSERT INTO Drivers (DriverID, FullName, Phone, LicenseNumber, HireDate, Rating, IsActive) VALUES (8, 'Sophia Perez', '+1-541-462-7939', 'LIC63883', '2022-08-28', 4.59, TRUE);
INSERT INTO Drivers (DriverID, FullName, Phone, LicenseNumber, HireDate, Rating, IsActive) VALUES (9, 'Emma Gonzalez', '+1-845-447-2790', 'LIC42591', '2022-04-07', 4.3, TRUE);
INSERT INTO Drivers (DriverID, FullName, Phone, LicenseNumber, HireDate, Rating, IsActive) VALUES (10, 'Charlotte Garcia', '+1-385-573-5092', 'LIC19880', '2022-08-26', 4.79, TRUE);
INSERT INTO Drivers (DriverID, FullName, Phone, LicenseNumber, HireDate, Rating, IsActive) VALUES (11, 'Emma Lee', '+1-653-956-1241', 'LIC22224', '2022-04-06', 4.11, FALSE);
INSERT INTO Drivers (DriverID, FullName, Phone, LicenseNumber, HireDate, Rating, IsActive) VALUES (12, 'James Gonzalez', '+1-160-268-7209', 'LIC10282', '2022-07-09', 4.89, FALSE);
INSERT INTO Drivers (DriverID, FullName, Phone, LicenseNumber, HireDate, Rating, IsActive) VALUES (13, 'Isabella Wilson', '+1-813-848-8973', 'LIC30289', '2022-04-10', 3.83, TRUE);
INSERT INTO Drivers (DriverID, FullName, Phone, LicenseNumber, HireDate, Rating, IsActive) VALUES (14, 'Ethan White', '+1-655-162-6138', 'LIC17492', '2022-01-19', 4.22, TRUE);
INSERT INTO Drivers (DriverID, FullName, Phone, LicenseNumber, HireDate, Rating, IsActive) VALUES (15, 'Emma Taylor', '+1-182-971-4044', 'LIC18981', '2022-10-03', 4.51, TRUE);
INSERT INTO Drivers (DriverID, FullName, Phone, LicenseNumber, HireDate, Rating, IsActive) VALUES (16, 'Elijah Brown', '+1-683-352-1651', 'LIC91183', '2022-02-14', 4.49, FALSE);
INSERT INTO Drivers (DriverID, FullName, Phone, LicenseNumber, HireDate, Rating, IsActive) VALUES (17, 'Alexander Miller', '+1-785-833-6147', 'LIC41285', '2022-05-13', 3.7, FALSE);
INSERT INTO Drivers (DriverID, FullName, Phone, LicenseNumber, HireDate, Rating, IsActive) VALUES (18, 'Lucas Hernandez', '+1-869-174-1152', 'LIC70068', '2022-10-19', 4.99, TRUE);
INSERT INTO Drivers (DriverID, FullName, Phone, LicenseNumber, HireDate, Rating, IsActive) VALUES (19, 'Harper Miller', '+1-618-371-3170', 'LIC55745', '2022-02-08', 4.05, TRUE);
INSERT INTO Drivers (DriverID, FullName, Phone, LicenseNumber, HireDate, Rating, IsActive) VALUES (20, 'Lucas Moore', '+1-820-409-9666', 'LIC11025', '2022-11-27', 4.33, TRUE);
INSERT INTO Drivers (DriverID, FullName, Phone, LicenseNumber, HireDate, Rating, IsActive) VALUES (21, 'William Rodriguez', '+1-218-209-3546', 'LIC45697', '2022-05-20', 3.82, FALSE);
INSERT INTO Drivers (DriverID, FullName, Phone, LicenseNumber, HireDate, Rating, IsActive) VALUES (22, 'James Perez', '+1-749-973-5325', 'LIC76244', '2022-08-09', 4.86, TRUE);
INSERT INTO Drivers (DriverID, FullName, Phone, LicenseNumber, HireDate, Rating, IsActive) VALUES (23, 'Michael Lee', '+1-533-949-5533', 'LIC15778', '2022-01-11', 4.66, FALSE);
INSERT INTO Drivers (DriverID, FullName, Phone, LicenseNumber, HireDate, Rating, IsActive) VALUES (24, 'Olivia White', '+1-552-664-8007', 'LIC83519', '2022-01-04', 3.61, TRUE);
INSERT INTO Drivers (DriverID, FullName, Phone, LicenseNumber, HireDate, Rating, IsActive) VALUES (25, 'Harper Johnson', '+1-954-478-3426', 'LIC66333', '2022-03-02', 3.96, TRUE);

-- Vehicles
INSERT INTO Vehicles (VehicleID, PlateNumber, VehicleType, MaxCapacityKG, YearManufactured, LastMaintenance) VALUES (1, 'SHIP01Y', 'Refrigerated Truck', 9242, 2017, '2024-12-04');
INSERT INTO Vehicles (VehicleID, PlateNumber, VehicleType, MaxCapacityKG, YearManufactured, LastMaintenance) VALUES (2, 'SHIP02Y', 'Truck', 15923, 2018, '2024-04-27');
INSERT INTO Vehicles (VehicleID, PlateNumber, VehicleType, MaxCapacityKG, YearManufactured, LastMaintenance) VALUES (3, 'SHIP03Y', 'Box Truck', 10500, 2018, '2024-04-01');
INSERT INTO Vehicles (VehicleID, PlateNumber, VehicleType, MaxCapacityKG, YearManufactured, LastMaintenance) VALUES (4, 'SHIP04Z', 'Refrigerated Truck', 13556, 2020, '2024-05-28');
INSERT INTO Vehicles (VehicleID, PlateNumber, VehicleType, MaxCapacityKG, YearManufactured, LastMaintenance) VALUES (5, 'SHIP05X', 'Flatbed', 12006, 2023, '2024-07-22');
INSERT INTO Vehicles (VehicleID, PlateNumber, VehicleType, MaxCapacityKG, YearManufactured, LastMaintenance) VALUES (6, 'SHIP06Z', 'Box Truck', 1404, 2016, '2024-05-06');
INSERT INTO Vehicles (VehicleID, PlateNumber, VehicleType, MaxCapacityKG, YearManufactured, LastMaintenance) VALUES (7, 'SHIP07Z', 'Flatbed', 1753, 2016, '2024-10-14');
INSERT INTO Vehicles (VehicleID, PlateNumber, VehicleType, MaxCapacityKG, YearManufactured, LastMaintenance) VALUES (8, 'SHIP08Y', 'Box Truck', 14799, 2024, '2024-09-04');
INSERT INTO Vehicles (VehicleID, PlateNumber, VehicleType, MaxCapacityKG, YearManufactured, LastMaintenance) VALUES (9, 'SHIP09Y', 'Refrigerated Truck', 8846, 2015, '2024-12-14');
INSERT INTO Vehicles (VehicleID, PlateNumber, VehicleType, MaxCapacityKG, YearManufactured, LastMaintenance) VALUES (10, 'SHIP10X', 'Pickup', 18143, 2018, '2024-06-14');
INSERT INTO Vehicles (VehicleID, PlateNumber, VehicleType, MaxCapacityKG, YearManufactured, LastMaintenance) VALUES (11, 'SHIP11X', 'Box Truck', 10786, 2016, '2024-12-10');
INSERT INTO Vehicles (VehicleID, PlateNumber, VehicleType, MaxCapacityKG, YearManufactured, LastMaintenance) VALUES (12, 'SHIP12Z', 'Flatbed', 13882, 2020, '2024-07-23');
INSERT INTO Vehicles (VehicleID, PlateNumber, VehicleType, MaxCapacityKG, YearManufactured, LastMaintenance) VALUES (13, 'SHIP13Y', 'Pickup', 4670, 2018, '2024-07-22');
INSERT INTO Vehicles (VehicleID, PlateNumber, VehicleType, MaxCapacityKG, YearManufactured, LastMaintenance) VALUES (14, 'SHIP14Y', 'Semi-Trailer', 19148, 2019, '2024-07-18');
INSERT INTO Vehicles (VehicleID, PlateNumber, VehicleType, MaxCapacityKG, YearManufactured, LastMaintenance) VALUES (15, 'SHIP15X', 'Flatbed', 9901, 2018, '2024-07-26');
INSERT INTO Vehicles (VehicleID, PlateNumber, VehicleType, MaxCapacityKG, YearManufactured, LastMaintenance) VALUES (16, 'SHIP16Z', 'Box Truck', 15736, 2022, '2024-08-22');
INSERT INTO Vehicles (VehicleID, PlateNumber, VehicleType, MaxCapacityKG, YearManufactured, LastMaintenance) VALUES (17, 'SHIP17X', 'Pickup', 16005, 2017, '2024-11-03');
INSERT INTO Vehicles (VehicleID, PlateNumber, VehicleType, MaxCapacityKG, YearManufactured, LastMaintenance) VALUES (18, 'SHIP18Y', 'Pickup', 11483, 2016, '2024-04-22');
INSERT INTO Vehicles (VehicleID, PlateNumber, VehicleType, MaxCapacityKG, YearManufactured, LastMaintenance) VALUES (19, 'SHIP19Y', 'Refrigerated Truck', 7025, 2017, '2024-01-02');
INSERT INTO Vehicles (VehicleID, PlateNumber, VehicleType, MaxCapacityKG, YearManufactured, LastMaintenance) VALUES (20, 'SHIP20X', 'Tanker', 2886, 2022, '2024-07-21');
INSERT INTO Vehicles (VehicleID, PlateNumber, VehicleType, MaxCapacityKG, YearManufactured, LastMaintenance) VALUES (21, 'SHIP21Z', 'Refrigerated Truck', 13082, 2022, '2024-07-08');
INSERT INTO Vehicles (VehicleID, PlateNumber, VehicleType, MaxCapacityKG, YearManufactured, LastMaintenance) VALUES (22, 'SHIP22X', 'Truck', 3992, 2021, '2024-04-06');
INSERT INTO Vehicles (VehicleID, PlateNumber, VehicleType, MaxCapacityKG, YearManufactured, LastMaintenance) VALUES (23, 'SHIP23Z', 'Pickup', 15722, 2015, '2024-09-08');
INSERT INTO Vehicles (VehicleID, PlateNumber, VehicleType, MaxCapacityKG, YearManufactured, LastMaintenance) VALUES (24, 'SHIP24X', 'Tanker', 4869, 2022, '2024-11-17');
INSERT INTO Vehicles (VehicleID, PlateNumber, VehicleType, MaxCapacityKG, YearManufactured, LastMaintenance) VALUES (25, 'SHIP25Z', 'Box Truck', 15002, 2024, '2024-12-17');

-- Shipments (25 rows with real FK relationships)
INSERT INTO Shipments (ShipmentID, CustomerID, DriverID, VehicleID, OriginCity, DestinationCity, DistanceKM, ShipmentDate, ExpectedDelivery, ActualDelivery, Status, WeightKG, FreightCost) VALUES (1, 14, 18, 15, 'Philadelphia', 'Memphis', 3938, '2024-08-09', '2024-08-14', '2024-08-14', 'Delivered', 11510.62, 21150.32);
INSERT INTO Shipments (ShipmentID, CustomerID, DriverID, VehicleID, OriginCity, DestinationCity, DistanceKM, ShipmentDate, ExpectedDelivery, ActualDelivery, Status, WeightKG, FreightCost) VALUES (2, 21, 8, 9, 'Charlotte', 'Chicago', 2390, '2024-04-09', '2024-04-16', '2024-04-16', 'Cancelled', 1300.61, 1379.73);
INSERT INTO Shipments (ShipmentID, CustomerID, DriverID, VehicleID, OriginCity, DestinationCity, DistanceKM, ShipmentDate, ExpectedDelivery, ActualDelivery, Status, WeightKG, FreightCost) VALUES (3, 13, 23, 5, 'Detroit', 'San Antonio', 576, '2024-07-14', '2024-07-21', '2024-07-21', 'Delayed', 1027.76, 2711.51);
INSERT INTO Shipments (ShipmentID, CustomerID, DriverID, VehicleID, OriginCity, DestinationCity, DistanceKM, ShipmentDate, ExpectedDelivery, ActualDelivery, Status, WeightKG, FreightCost) VALUES (4, 13, 25, 19, 'Detroit', 'New York', 4766, '2024-07-16', '2024-07-18', '2024-07-18', 'Delivered', 11326.78, 30307.03);
INSERT INTO Shipments (ShipmentID, CustomerID, DriverID, VehicleID, OriginCity, DestinationCity, DistanceKM, ShipmentDate, ExpectedDelivery, ActualDelivery, Status, WeightKG, FreightCost) VALUES (5, 14, 18, 24, 'Nashville', 'Seattle', 4991, '2024-04-16', '2024-04-21', '2024-04-26', 'Pending', 5893.97, 13301.89);
INSERT INTO Shipments (ShipmentID, CustomerID, DriverID, VehicleID, OriginCity, DestinationCity, DistanceKM, ShipmentDate, ExpectedDelivery, ActualDelivery, Status, WeightKG, FreightCost) VALUES (6, 13, 24, 6, 'Charlotte', 'Phoenix', 4425, '2024-01-13', '2024-01-15', '2024-01-19', 'In Transit', 13016.09, 12864.05);
INSERT INTO Shipments (ShipmentID, CustomerID, DriverID, VehicleID, OriginCity, DestinationCity, DistanceKM, ShipmentDate, ExpectedDelivery, ActualDelivery, Status, WeightKG, FreightCost) VALUES (7, 9, 13, 11, 'San Antonio', 'San Francisco', 2727, '2024-06-25', '2024-07-03', '2024-07-07', 'Delivered', 12540.17, 21287.1);
INSERT INTO Shipments (ShipmentID, CustomerID, DriverID, VehicleID, OriginCity, DestinationCity, DistanceKM, ShipmentDate, ExpectedDelivery, ActualDelivery, Status, WeightKG, FreightCost) VALUES (8, 24, 18, 2, 'Jacksonville', 'San Diego', 612, '2024-11-02', '2024-11-04', '2024-11-04', 'In Transit', 12604.51, 25942.53);
INSERT INTO Shipments (ShipmentID, CustomerID, DriverID, VehicleID, OriginCity, DestinationCity, DistanceKM, ShipmentDate, ExpectedDelivery, ActualDelivery, Status, WeightKG, FreightCost) VALUES (9, 8, 5, 16, 'El Paso', 'Houston', 4670, '2024-04-15', '2024-04-21', '2024-04-21', 'In Transit', 9127.8, 27022.84);
INSERT INTO Shipments (ShipmentID, CustomerID, DriverID, VehicleID, OriginCity, DestinationCity, DistanceKM, ShipmentDate, ExpectedDelivery, ActualDelivery, Status, WeightKG, FreightCost) VALUES (10, 23, 4, 25, 'Philadelphia', 'Austin', 935, '2024-10-01', '2024-10-07', '2024-10-07', 'Delayed', 6010.15, 13841.94);
INSERT INTO Shipments (ShipmentID, CustomerID, DriverID, VehicleID, OriginCity, DestinationCity, DistanceKM, ShipmentDate, ExpectedDelivery, ActualDelivery, Status, WeightKG, FreightCost) VALUES (11, 3, 19, 23, 'Boston', 'San Diego', 884, '2024-12-25', '2024-12-31', '2024-12-31', 'Cancelled', 12102.37, 30230.18);
INSERT INTO Shipments (ShipmentID, CustomerID, DriverID, VehicleID, OriginCity, DestinationCity, DistanceKM, ShipmentDate, ExpectedDelivery, ActualDelivery, Status, WeightKG, FreightCost) VALUES (12, 19, 2, 12, 'Seattle', 'Columbus', 3085, '2024-02-17', '2024-02-24', '2024-02-28', 'Delayed', 1672.53, 5162.13);
INSERT INTO Shipments (ShipmentID, CustomerID, DriverID, VehicleID, OriginCity, DestinationCity, DistanceKM, ShipmentDate, ExpectedDelivery, ActualDelivery, Status, WeightKG, FreightCost) VALUES (13, 21, 15, 23, 'Phoenix', 'Charlotte', 1492, '2024-12-17', '2024-12-23', '2024-12-23', 'Cancelled', 11642.16, 19500.62);
INSERT INTO Shipments (ShipmentID, CustomerID, DriverID, VehicleID, OriginCity, DestinationCity, DistanceKM, ShipmentDate, ExpectedDelivery, ActualDelivery, Status, WeightKG, FreightCost) VALUES (14, 24, 19, 9, 'Austin', 'San Diego', 759, '2024-05-15', '2024-05-20', '2024-05-20', 'Cancelled', 9193.94, 13383.88);
INSERT INTO Shipments (ShipmentID, CustomerID, DriverID, VehicleID, OriginCity, DestinationCity, DistanceKM, ShipmentDate, ExpectedDelivery, ActualDelivery, Status, WeightKG, FreightCost) VALUES (15, 1, 16, 11, 'Philadelphia', 'Indianapolis', 1787, '2024-06-26', '2024-07-02', '2024-07-02', 'Cancelled', 10547.64, 12737.47);
INSERT INTO Shipments (ShipmentID, CustomerID, DriverID, VehicleID, OriginCity, DestinationCity, DistanceKM, ShipmentDate, ExpectedDelivery, ActualDelivery, Status, WeightKG, FreightCost) VALUES (16, 1, 17, 7, 'Chicago', 'Dallas', 3379, '2024-08-18', '2024-08-23', '2024-08-23', 'Delayed', 6777.8, 4018.98);
INSERT INTO Shipments (ShipmentID, CustomerID, DriverID, VehicleID, OriginCity, DestinationCity, DistanceKM, ShipmentDate, ExpectedDelivery, ActualDelivery, Status, WeightKG, FreightCost) VALUES (17, 10, 8, 13, 'Detroit', 'San Diego', 2558, '2024-11-19', '2024-11-26', '2024-11-26', 'Cancelled', 5221.99, 15877.79);
INSERT INTO Shipments (ShipmentID, CustomerID, DriverID, VehicleID, OriginCity, DestinationCity, DistanceKM, ShipmentDate, ExpectedDelivery, ActualDelivery, Status, WeightKG, FreightCost) VALUES (18, 18, 11, 12, 'Detroit', 'Charlotte', 2269, '2024-05-09', '2024-05-14', '2024-05-15', 'Delivered', 1881.37, 3687.98);
INSERT INTO Shipments (ShipmentID, CustomerID, DriverID, VehicleID, OriginCity, DestinationCity, DistanceKM, ShipmentDate, ExpectedDelivery, ActualDelivery, Status, WeightKG, FreightCost) VALUES (19, 25, 23, 6, 'San Antonio', 'San Diego', 4016, '2024-05-24', '2024-06-03', '2024-06-03', 'Pending', 12506.16, 15916.94);
INSERT INTO Shipments (ShipmentID, CustomerID, DriverID, VehicleID, OriginCity, DestinationCity, DistanceKM, ShipmentDate, ExpectedDelivery, ActualDelivery, Status, WeightKG, FreightCost) VALUES (20, 12, 6, 10, 'New York', 'Nashville', 4425, '2024-03-09', '2024-03-11', '2024-03-11', 'Cancelled', 4452.84, 13178.62);
INSERT INTO Shipments (ShipmentID, CustomerID, DriverID, VehicleID, OriginCity, DestinationCity, DistanceKM, ShipmentDate, ExpectedDelivery, ActualDelivery, Status, WeightKG, FreightCost) VALUES (21, 21, 25, 16, 'Houston', 'New York', 4752, '2024-05-16', '2024-05-25', '2024-05-25', 'In Transit', 14485.91, 16861.6);
INSERT INTO Shipments (ShipmentID, CustomerID, DriverID, VehicleID, OriginCity, DestinationCity, DistanceKM, ShipmentDate, ExpectedDelivery, ActualDelivery, Status, WeightKG, FreightCost) VALUES (22, 16, 4, 3, 'Fort Worth', 'Indianapolis', 656, '2024-10-21', '2024-10-23', '2024-10-25', 'Pending', 14909.38, 11935.39);
INSERT INTO Shipments (ShipmentID, CustomerID, DriverID, VehicleID, OriginCity, DestinationCity, DistanceKM, ShipmentDate, ExpectedDelivery, ActualDelivery, Status, WeightKG, FreightCost) VALUES (23, 25, 14, 20, 'Washington', 'Boston', 1898, '2024-09-13', '2024-09-22', '2024-09-22', 'Delivered', 12916.48, 38617.34);
INSERT INTO Shipments (ShipmentID, CustomerID, DriverID, VehicleID, OriginCity, DestinationCity, DistanceKM, ShipmentDate, ExpectedDelivery, ActualDelivery, Status, WeightKG, FreightCost) VALUES (24, 10, 19, 20, 'Los Angeles', 'Boston', 862, '2024-04-21', '2024-04-26', '2024-04-25', 'In Transit', 3673.99, 6993.23);
INSERT INTO Shipments (ShipmentID, CustomerID, DriverID, VehicleID, OriginCity, DestinationCity, DistanceKM, ShipmentDate, ExpectedDelivery, ActualDelivery, Status, WeightKG, FreightCost) VALUES (25, 6, 1, 14, 'Charlotte', 'Nashville', 4914, '2024-08-10', '2024-08-12', '2024-08-14', 'Delayed', 1160.58, 1748.96);



drop database test;