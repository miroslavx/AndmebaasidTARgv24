-- SQL SALVESTATUD PROTSEDUURIT-- Funktsioonid - mitu SQL käsku käivetakse järjest
-- SQL SERVER
CREATE DATABASE procTARgv24;

USE procTARgv24;
CREATE TABLE uudised(
uudisID int PRIMARY KEY identity (1,1),
uudisTeema varchar(50),
kuupaev date,
autor varchar(25),
kirjeldus text
)

SELECT * FROM uudised
INSERT INTO uudised(uudisTeema, kuupaev, autor,kirjeldus)
VALUES(
'udune ilm','2025-02-06','postimees','Lõunani')
--protseduuri loomine
--sisestab uudised tabelisse ja kohe näitab
CREATE PROCEDURE lisaUudis
 @uusTeema varchar(50),
 @päev date,
 @autor varchar(20),
 @kirjeldus text
AS

BEGIN
INSERT INTO uudised(uudisTeema, kuupaev, autor,kirjeldus)
VALUES(
@uusTeema, @päev, @autor, @kirjeldus)
SELECT * FROM uudised

END;
--kutse
EXEC lisaUudis 'windows 11', '2025-02-06', 'õpetaja Pant','win 11 ei tööta on see kabinett'
--teine kutse võimalis
EXEC lisaUudis
@uusTeema='1 märts on jube kevad',
@päev='2025-02-06',
@autor='test',
@kirjeldus='puudub';

--protsedur, mis kustutab tabelist id järgi
CREATE PROCEDURE kustutaUudis
@id int
AS
BEGIN
SELECT * FROM uudised
DELETE FROM uudised WHERE uudisID=@id;
SELECT * FROM uudised
end

--kutse
EXEC kustutaUudis 3;
EXEC kustutaUudis @id=3;

UPDATE uudised SET kirjeldus='uus kirjeldus'
WHERE kirjeldus Like 'puudub';
SELECT * FROM uudised

--protseduur mis uuendab andmed tabelis/UPDATE

CREATE Procedure uuendaKirjeldus
@uuskirjeldus text
AS
BEGIN
SELECT * FROM uudised;
UPDATE uudised SET kirjeldus=@uuskirjeldus
WHERE kirjeldus Like 'puudub';
SELECT * FROM uudised;
END
--kutse
EXEC uuendaKirjeldus'uus tekst kirjelduses';

--protseduur mis otsib ja näitab esimene tähte järgi

CREATE PROCEDURE otsingUudiseTeema
@taht char(1)
AS
BEGIN
SELECT * FROM uudised
WHERE uudisTeema LIKE @taht + '%';
END
--kutse
EXEC otsingUudiseTeema 'w';
--XAPP/localhost

USE burdygatargv;
CREATE TABLE uudised(
uudisID int PRIMARY KEY AUTO_INCREMENT,
uudisTeema varchar(50),
kuupaev date,
autor varchar(25),
kirjeldus text
)

INSERT INTO uudised(
uudiseTeema, kuupaev, autor, kirjeldus)
VALUES(
'udune ilm', '2025-02-06', 'postimees', 'Lõunani on udune ilm')
