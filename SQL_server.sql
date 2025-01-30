CREATE DATABASE TARgvBurdyga;
USE TARgvBurdyga;
CREATE TABLE film(
filmID int PRIMARY KEY identity(1,1),
filmNimetus varchar(30) not null,
aasta int,
eelarvehind decimal(7,1));
SELECT * From film;
--tabel kustutamine
DROP TABLE film;


--andmete sisestamine tabelisse
INSERT INTO film(filmNimetus, aasta, eelarveHind)
VALUES('Titanic' , 2000, 20000.5),
('Terminator' , 1984, 60000.4),
('Matrix' , 1999, 63000.5)

DELETE FROM film WHERE filmID=2;

CREATE TABLE zanr(
zanrID int PRIMARY KEY identity(1,1),
zanrNimetus varchar (20) UNIQUE )

INSERT INTO zanr(zanrNimetus)
Values('dramma'),('action'), ('fantaastika');
Select * from zanr;

--tabeli film struktuuri muutmine
ALTER TABLE film ADD zanrID int;
SELECT * FROM film;

ALTER TABLE film ADD CONSTRAINT fk_zanr
FOREIGN key(zanrID) REFERENCES zanr(zanrID);

select * from film;
select * from zanr;
UPDATE film SET zanrID=2 WHERE filmID=3

CREATE TABLE Rezisoor(
Rez_id int PRIMARY KEY identity(1,1),
nimi varchar(30) not null,
sünniaeg date,
riik varchar(30)
);

INSERT INTO Rezisoor(nimi, sünniaeg, riik)
VALUES ('Steven Spielberg', '1946-12-18', 'USA'),
('James Cameron', '1954-08-16', 'Kanada'),
('Lana Wachowski', '1965-06-21', 'USA');

ALTER TABLE film ADD rez_ID int;

SELECT * FROM Rezisoor;

ALTER TABLE film 
ADD CONSTRAINT fk_rezisoor
FOREIGN KEY (rez_ID) REFERENCES Rezisoor(Rez_id);



CREATE TABLE kinokava(
    seanssID int PRIMARY KEY identity(1,1),
    film_ID int NOT NULL,
    kuupäev_aeg datetime NOT NULL,
    saal varchar(20) NOT NULL,
    hind decimal(5,2) NOT NULL,
    
    CONSTRAINT fk_film
    FOREIGN KEY (film_ID)
    REFERENCES film(filmID)
);

INSERT INTO kinokava(film_ID, kuupäev_aeg, saal, hind)
VALUES
(1, '2024-03-20 18:00:00', 'Saal A', 9.99),
(3, '2024-03-20 20:30:00', 'Saal B', 12.50),
(1, '2024-03-21 15:45:00', 'Saal C', 7.99);


Select * from  kinokava;
