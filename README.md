# Fichier MCD
-- L'image du MCD est dans le projet  (db.jpeg)

# createDb
-- Copier et coller le code SQL dans n'importe quel SGBD


# autre requetes

-- Mettre à jour la date d'une séance
UPDATE Seances
SET Date = '2023-01-10'
WHERE SeanceID = 1;

-- Supprimer une réservation
DELETE FROM Reservations
WHERE ReservationID = 1;
