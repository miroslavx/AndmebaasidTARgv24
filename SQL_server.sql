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

