CREATE TABLE Platnosci (
    ID_platnosci VARCHAR(12) PRIMARY KEY CHECK ((ID_platnosci NOT LIKE '%[^A-Z0-9]%') AND LEN(ID_platnosci) = 12) NOT NULL,
    -- dane
    Data_platnosci DATE NOT NULL,
    Oplacone BIT NOT NULL,
    Kwota FLOAT CHECK (Kwota > 0) NOT NULL
    --klucze obce
); 

CREATE TABLE Pacjenci (
    Pesel_pacjenta CHAR(11) PRIMARY KEY CHECK (
		Pesel_pacjenta LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
	) NOT NULL,
    -- dane
    Imie NVARCHAR(50) CHECK (Imie LIKE N'[A-Z•∆ £—”åèØ]%' AND (Imie NOT LIKE N'%[^a-zπÊÍ≥ÒÛúüø]%' )) NOT NULL,
    Nazwisko NVARCHAR(50) CHECK (Nazwisko LIKE N'[A-Z•∆ £—”åèØ]%' AND (Nazwisko NOT LIKE N'%[^a-zπÊÍ≥ÒÛúüø]%' )) NOT NULL,
    Telefon NVARCHAR(15) CHECK (Telefon LIKE N'[0-9+]%' AND (Telefon NOT LIKE N'%[^0-9+]%') AND LEN(Telefon) BETWEEN 9 AND 15 ) NOT NULL
    --klucze obce
);

CREATE TABLE Procedury_medyczne (
    ID_procedury VARCHAR(12) PRIMARY KEY CHECK ((ID_procedury NOT LIKE '%[^A-Z0-9]%') AND LEN(ID_procedury) = 12) NOT NULL,
    -- dane
    Nazwa NVARCHAR(50) NOT NULL UNIQUE,
    Cena FLOAT CHECK (Cena > 0) NOT NULL,
    Czas_trwania INT CHECK (Czas_trwania > 0) NOT NULL
    --klucze obce
);

CREATE TABLE Gabinety (
    ID_gabinetu VARCHAR(12) PRIMARY KEY CHECK ((ID_gabinetu NOT LIKE '%[^A-Z0-9]%') AND LEN(ID_gabinetu) = 12) NOT NULL,
    -- dane
    Numer_pokoju INT CHECK (Numer_pokoju > 0) NOT NULL,
    Pietro INT CHECK (Pietro > 0) NOT NULL,
    --klucze obce
);


CREATE TABLE Wizyty (
    ID_wizyty VARCHAR(12) PRIMARY KEY CHECK ((ID_wizyty NOT LIKE '%[^A-Z0-9]%') AND LEN(ID_wizyty) = 12) NOT NULL,
    -- dane
    Godzina TIME NOT NULL DEFAULT '10:00:00',
	Termin DATE NOT NULL,
    --klucze obce
    ID_platnosci VARCHAR(12) CHECK ((ID_platnosci NOT LIKE '%[^A-Z0-9]%') AND LEN(ID_platnosci) = 12) NOT NULL,
    ID_gabinetu VARCHAR(12) CHECK ((ID_gabinetu NOT LIKE '%[^A-Z0-9]%') AND LEN(ID_gabinetu) = 12) NOT NULL,
    ID_procedury VARCHAR(12) CHECK ((ID_procedury NOT LIKE '%[^A-Z0-9]%') AND LEN(ID_procedury) = 12) NOT NULL,
	Pesel_pacjenta CHAR(11) CHECK (
		Pesel_pacjenta LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
	) NOT NULL,

    FOREIGN KEY (Pesel_pacjenta) REFERENCES Pacjenci(Pesel_pacjenta) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ID_gabinetu) REFERENCES Gabinety(ID_gabinetu),
    FOREIGN KEY (ID_procedury) REFERENCES Procedury_medyczne(ID_procedury),
    FOREIGN KEY (ID_platnosci) REFERENCES Platnosci(ID_platnosci)
);

CREATE TABLE Artykuly (
    ID_artykulu VARCHAR(12) PRIMARY KEY CHECK ((ID_artykulu NOT LIKE '%[^A-Z0-9]%') AND LEN(ID_artykulu) = 12) NOT NULL,
    -- dane
    Nazwa NVARCHAR(50) CHECK ((Nazwa NOT LIKE N'%[^A-Z•∆ £—”åèØa-zπÊÍ≥ÒÛúüø ]%')) NOT NULL,
    Cena FLOAT CHECK (Cena > 0) NOT NULL,
    Dostawca NVARCHAR(50) CHECK ((Dostawca NOT LIKE N'%[^A-Z•∆ £—”åèØa-zπÊÍ≥ÒÛúüø ]%')) NOT NULL,
    --klucze obce
);

CREATE TABLE Lista_artykulow (
    ID_listy_artykulow VARCHAR(12) PRIMARY KEY CHECK ((ID_listy_artykulow NOT LIKE '%[^A-Z0-9]%') AND LEN(ID_listy_artykulow) = 12) NOT NULL,
    -- dane
    Ilosc INT CHECK (Ilosc > 0) NOT NULL,
    --klucze obce
    ID_wizyty VARCHAR(12) CHECK ((ID_wizyty NOT LIKE '%[^A-Z0-9]%') AND LEN(ID_wizyty) = 12) NOT NULL,
    ID_artykulu VARCHAR(12) CHECK ((ID_artykulu NOT LIKE '%[^A-Z0-9]%') AND LEN(ID_artykulu) = 12) NOT NULL,
    FOREIGN KEY (ID_wizyty) REFERENCES Wizyty(ID_wizyty) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ID_artykulu) REFERENCES Artykuly(ID_artykulu),
);



CREATE TABLE Personel (
    Pesel_pracownika CHAR(11) PRIMARY KEY CHECK (
		Pesel_pracownika LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
	) NOT NULL,
    -- dane
    Imie NVARCHAR(50) CHECK (Imie LIKE N'[A-Z•∆ £—”åèØ]%' AND (Imie NOT LIKE N'%[^a-zπÊÍ≥ÒÛúüø]%' )) NOT NULL,
    Nazwisko NVARCHAR(50) CHECK (Nazwisko LIKE N'[A-Z•∆ £—”åèØ]%' AND (Nazwisko NOT LIKE N'%[^a-zπÊÍ≥ÒÛúüø]%' )) NOT NULL,
    Telefon NVARCHAR(15) CHECK (Telefon LIKE N'[0-9+]%' AND (Telefon NOT LIKE N'%[^0-9+]%') AND LEN(Telefon) BETWEEN 9 AND 15 ) NOT NULL,
    Stanowisko NVARCHAR(50) CHECK ((Stanowisko NOT LIKE N'%[^A-Z•∆ £—”åèØa-zπÊÍ≥ÒÛúüø ]%')) NOT NULL,
    Stawka FLOAT CHECK (Stawka > 0) NOT NULL,
    --klucze obce
);

CREATE TABLE Lista_personelu (
    ID_listy_personelu VARCHAR(12) PRIMARY KEY CHECK ((ID_listy_personelu NOT LIKE '%[^A-Z0-9]%') AND LEN(ID_listy_personelu) = 12) NOT NULL,
    --klucze obce
    ID_wizyty VARCHAR(12) CHECK ((ID_wizyty NOT LIKE '%[^A-Z0-9]%') AND LEN(ID_wizyty) = 12) NOT NULL,
    Pesel_pracownika CHAR(11) CHECK (
		Pesel_pracownika LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
	) NOT NULL,
    FOREIGN KEY (ID_wizyty) REFERENCES Wizyty(ID_wizyty) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Pesel_pracownika) REFERENCES Personel(Pesel_pracownika),
);

CREATE TABLE Urlopy (
    ID_urlopu VARCHAR(12) PRIMARY KEY CHECK ((ID_urlopu NOT LIKE '%[^A-Z0-9]%') AND LEN(ID_urlopu) = 12) NOT NULL,
    -- dane
    Data_rozpoczecia DATE NOT NULL,
    Data_zakonczenia DATE NOT NULL,
    Rodzaj NVARCHAR(50) CHECK ((Rodzaj NOT LIKE N'%[^A-Z•∆ £—”åèØa-zπÊÍ≥ÒÛúüø ]%')) NOT NULL,
    --klucze obce
    Pesel_pracownika CHAR(11) CHECK (
		Pesel_pracownika LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
	) NOT NULL,
    FOREIGN KEY (Pesel_pracownika) REFERENCES Personel(Pesel_pracownika),
);
