SELECT * FROM Lista_artykulow;
SELECT * FROM Lista_personelu;

SELECT * FROM Pacjenci WHERE Pesel_pacjenta = '88060123456';
SELECT * FROM Wizyty WHERE Pesel_pacjenta = '88060123456';


DELETE FROM Pacjenci WHERE Pesel_pacjenta='88060123456';

SELECT * FROM Pacjenci WHERE Pesel_pacjenta = '88060123456';
SELECT * FROM Wizyty WHERE Pesel_pacjenta = '88060123456';

SELECT * FROM Pacjenci WHERE Pesel_pacjenta = '91050834567';
SELECT * FROM Wizyty WHERE Pesel_pacjenta = '91050834567';

UPDATE Pacjenci SET Pesel_pacjenta = '00000000000'
WHERE Pesel_pacjenta = '91050834567';

SELECT * FROM Pacjenci WHERE Pesel_pacjenta = '91050834567';
SELECT * FROM Wizyty WHERE Pesel_pacjenta = '91050834567';
SELECT * FROM Pacjenci WHERE Pesel_pacjenta = '00000000000';
SELECT * FROM Wizyty WHERE Pesel_pacjenta = '00000000000';

SELECT * FROM Lista_artykulow;
SELECT * FROM Lista_personelu;