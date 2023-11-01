CREATE DATABASE Traveloka;

USE Traveloka;

CREATE TABLE Users (
    UserID INT UNIQUE NOT NULL PRIMARY KEY,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Gender CHAR(1),
    TanggalLahir DATE,
    NomorHP VARCHAR(15) UNIQUE,
    Alamat VARCHAR(255)
);

INSERT INTO Users (UserID, Email, Password, FirstName, LastName, Gender, TanggalLahir, NomorHP, Alamat)
VALUES
    ('1', 'john.doe@example.com', 'mypassword', 'John', 'Doe', 'M', '1990-03-15', '123456789', '123 Main St, New York, USA, 10001'),
    ('2', 'parjo@gmail.com', 'passwordneaku', 'Parjo', 'Aja', 'M', '1980-02-20', '987654321', 'Buah batu, Bandung, jawa barat, indonesia, 721312'),
    ('3', 'ahmad@example.com', 'bismillah', 'Ahmad', 'Christ', 'M', '2003-12-10', '082131231', 'Sukapura, Bandung, jawa barat, indonesia, 7213123'),
    ('4', 'killua@example.com', 'yowaimo', 'Killua', 'Zoldyk', 'M', '2001-03-30', '082193123', 'Sukabirus, Bandung, jawa barat, indonesia, 7213123'),
    ('5', 'naobara@example.com', 'innalillahi', 'Naobara', 'Nasution', 'F', '1999-08-25', '082138213', 'Palupuh raya, bogor, jawa barat, indonesia, 2131321');

CREATE TABLE Agents (
    AgentID INT UNIQUE NOT NULL PRIMARY KEY,
    NamaAgent VARCHAR(50) NOT NULL,
    Deskripsi TEXT,
    Email VARCHAR(50),
    AgentPhoneNumber VARCHAR(15),
    Website VARCHAR(50)
);

INSERT INTO Agents (AgentID, NamaAgent, Deskripsi, Email, AgentPhoneNumber, Website)
VALUES
    (1, 'AGENT 1', 'lorem ipsum dolor', 'info@agent1.com', '021123123', 'www.agent1.com'),
    (2, 'AGENT 2', 'lorem ipsum dolor', 'info@agent2.com', '021221342', 'www.agent2.com'),
    (3, 'AGENT 3', 'lorem ipsum dolor', 'info@agent3.com', '0213213134', 'www.agent3.com'),
    (4, 'AGENT 4', 'lorem ipsum dolor', 'info@agent4.com', '0213213213', 'www.agent4.com'),
    (5, 'AGENT 5', 'lorem ipsum dolor', 'info@agent5.com', '0212998271', 'www.agent5.com');

CREATE TABLE Transport (
    TransportID INT UNIQUE NOT NULL PRIMARY KEY,
    Tipe VARCHAR(20) NOT NULL,
    DepartureDate DATE NOT NULL,
    ArrivalDate DATE NOT NULL,
    KotaAsal VARCHAR(30) NOT NULL,
    KotaTujuan VARCHAR(30) NOT NULL,
	Harga INT NOT NULL,
    Brand VARCHAR(50)
);

INSERT INTO Transport (TransportID, Tipe, DepartureDate, ArrivalDate, KotaAsal, KotaTujuan, Harga, Brand)
VALUES
    (1, 'Travel Car', '2023-11-01', '2023-11-02', 'Bogor', 'Bandung', 130000, 'Mitrans'),
    (2, 'Train', '2023-11-05', '2023-11-05', 'Jakarta', 'Bandung', 65000, 'KRL'),
    (3, 'Bus', '2023-11-11', '2023-11-13', 'Bogor', 'Bali', 450000, 'Kodam'),
    (4, 'Flight', '2023-12-10', '2023-11-11', 'Jakarta', 'Ambon', 1450000, 'Spirit'),
    (5, 'Bus', '2023-11-10', '2023-11-11', 'Ambon', 'Jakarta', 600000, 'Batik');
    
CREATE TABLE Hotels (
    HotelID INT UNIQUE NOT NULL PRIMARY KEY,
    NamaHotel VARCHAR(100) NOT NULL,
    Lokasi VARCHAR(100) NOT NULL,
    TipeRuangan VARCHAR(50) NOT NULL,
    HargaPerMalam INT NOT NULL,
    Deskripsi TEXT,
    Rating INT
);

INSERT INTO Hotels (HotelID, NamaHotel, Lokasi, TipeRuangan, HargaPerMalam, Deskripsi, Rating)
VALUES
    (1, 'Redwindows', 'Buah batu, bandung, jawa barat, indonesia 100123', 'Suite', 100000, 'Hotel indah', 5),
    (2, 'Oyy', 'sukapura, bandung, jawa barat, indonesia 100123', 'Standard', 80000, 'Fasilitas lengkap', 3),
    (3, 'Hotel new', 'Rawakalong, bandung, jawa barat, indonesia 100123', 'Deluxe', 130000, 'Hotel terbaik', 4),
    (4, 'V', 'Buah batu, bandung, jawa barat, indonesia 100123', 'Standard', 300000, 'Ada kolam renang', 4),
    (5, 'Ultima', 'Sukabirus, bandung, jawa barat, indonesia 100123', 'Cabin', 1200000, 'Ultimate hotel the best', 3);    
    
CREATE TABLE TouristDestination (
    DestinationID INT UNIQUE NOT NULL PRIMARY KEY,
    NamaDestinasi VARCHAR(50) NOT NULL,
    Lokasi VARCHAR(100) NOT NULL,
    Deskripsi TEXT,
    HTM INT NOT NULL
);

INSERT INTO TouristDestination (DestinationID, NamaDestinasi, Lokasi, Deskripsi, HTM)
VALUES
    (1, 'Taman Sempur', 'Palupuh, Bogor, Jawa Barat, Indonesia 102231', 'Taman tempat bermain', 10000),
    (2, 'Museum Perjuangan', 'Sudirman, Jakarta, DKI Jakarta, Indonesia, 12192192', 'Museum berjuang', 15000),
    (3, 'Pasar gedebage', 'Gedebage, Bandung, Jawa Barat, Indonesia 102231', 'Belanja', 20000),
    (4, 'Pantai Kuta', 'Kuta, Bali, Bali, Indonesia 11231323', 'Berenang', 50000),
    (5, 'Alun alun kota bandung', 'Sukabirus, Bandung, Jawa Barat, Indonesia 102231', 'Selfi', 5000);
    
    
CREATE TABLE SistemBooking (
    BookingID INT UNIQUE NOT NULL PRIMARY KEY,
    UserID INT,
    TransportID INT,
    HotelID INT,
	DestinationID INT NOT NULL,
    BookingDate DATE NOT NULL,
    CheckInDate DATE NOT NULL,
    CheckOutDate DATE NOT NULL,
	TotalHarga INT NOT NULL,
    Status CHAR(1) NOT NULL,
    CONSTRAINT FK_Users_Bookings FOREIGN KEY (UserID) REFERENCES Users(UserID),
    CONSTRAINT FK_Transport_Bookings FOREIGN KEY (TransportID) REFERENCES Transport(TransportID),
	CONSTRAINT FK_Hotels_Bookings FOREIGN KEY (HotelID) REFERENCES Hotels(HotelID),
    CONSTRAINT FK_Destination_Bookings FOREIGN KEY (DestinationID) REFERENCES TouristDestination(DestinationID)
);

INSERT INTO SistemBooking (BookingID, UserID, TransportID, HotelID, DestinationID, BookingDate, CheckInDate, CheckOutDate,TotalHarga, Status)
VALUES
    (1, 1, 1, 1, 1, '2023-11-02', '2023-11-05', '2023-11-18',100000,1),
    (2, 2, 2, 2, 2, '2023-11-26', '2023-11-29', '2023-11-30',2350000,2),
    (3, 3, 3, 3, 3, '2023-11-28', '2023-11-30', '2023-11-30',234000,3),
    (4, 4, 4, 4, 4, '2023-11-12', '2023-11-16', '2023-11-18',5000000,1),
    (5, 5, 5, 5, 5, '2023-11-09', '2023-11-13', '2023-11-19',1250000,1);
    
CREATE TABLE TouristPackageBookings (
    PackageID INT PRIMARY KEY,
    AgentID INT,
    BookingID INT,
    Fee int,
    CONSTRAINT FK_SistemBookings_Bookings FOREIGN KEY (BookingID) REFERENCES SistemBooking(BookingID),
    CONSTRAINT FK_AgentBookings_Agents FOREIGN KEY (AgentID) REFERENCES Agents(AgentID)
);

INSERT INTO TouristPackageBookings (PackageID, AgentID, BookingID, fee)
VALUES
    (1, 1, 1, 10),
    (2, 2, 2, 75),
    (3, 3, 3, 20),
    (4, 4, 4, 95),
    (5, 5, 5, 80);

CREATE TABLE Payment (
	PaymentID INT PRIMARY KEY,
    BookingID INT,
    Status CHAR(1),
    CONSTRAINT FK_Payment_Booking FOREIGN KEY (BookingID) REFERENCES SistemBooking(BookingID)
);    

INSERT INTO Payment (PaymentID, BookingID, Status)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 1),
    (5, 5, 1);