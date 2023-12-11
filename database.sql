CREATE database `myDB`;
USE `myDB`;

CREATE TABLE utilisateurs (
    utilisateurID INT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE cinemas (
    cinemaID INT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    adresse VARCHAR(255) NOT NULL,
    utilisateurID INT,
    FOREIGN KEY (utilisateurID) REFERENCES utilisateurs(utilisateurID)
);

CREATE TABLE films (
    filmID INT PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    genre VARCHAR(50),
    duree INT
);

CREATE TABLE salles (
    salleID INT PRIMARY KEY,
    numero INT NOT NULL,
    capacite INT NOT NULL
);

CREATE TABLE tarifs (
    tarifID INT PRIMARY KEY,
    types VARCHAR(50) NOT NULL,
    montant DECIMAL(5,2) NOT NULL
);

CREATE TABLE seances (
    seanceID INT PRIMARY KEY,
    dates DATE NOT NULL,
    heure TIME NOT NULL,
    filmID INT,
    salleID INT,
    cinemaID INT,
    tarifID INT,
    FOREIGN KEY (filmID) REFERENCES films(filmID),
    FOREIGN KEY (salleID) REFERENCES salles(salleID),
    FOREIGN KEY (cinemaID) REFERENCES cinemas(cinemaID) ON DELETE CASCADE,
    FOREIGN KEY (tarifID) REFERENCES tarifs(tarifID)
);

CREATE TABLE reservations (
    reservationID INT PRIMARY KEY,
    nombrePlaces INT NOT NULL,
    utilisateurID INT,
    seanceID INT,
    FOREIGN KEY (utilisateurID) REFERENCES utilisateurs(utilisateurID),
    FOREIGN KEY (seanceID) REFERENCES seances(SeanceID)
);

CREATE TABLE utilisateursCinemas (
    utilisateurID INT PRIMARY KEY,
    cinemaID INT,
    FOREIGN KEY (cinemaID) REFERENCES cinemas(cinemaID)
);

