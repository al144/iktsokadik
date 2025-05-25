CREATE TABLE Szemely (
  id INTEGER PRIMARY KEY,
  nev TEXT NOT NULL,
  magassag INTEGER,
  hajszin TEXT,
  szemszin TEXT,
  szuletesi_ev INTEGER
);

CREATE TABLE Detektiv (
  id INTEGER PRIMARY KEY,
  nev TEXT NOT NULL,
  tapasztalat_ev INTEGER,
  szuletesi_ev INTEGER
);

CREATE TABLE Allitas (
  id INTEGER PRIMARY KEY,
  detektiv_id INTEGER NOT NULL,
  szemely_id INTEGER NOT NULL,
  szoveg TEXT NOT NULL,
  FOREIGN KEY (detektiv_id) REFERENCES Detektiv(id),
  FOREIGN KEY (szemely_id) REFERENCES Szemely(id)
);

INSERT INTO Szemely VALUES
(1, 'Kovács Anna', 165, 'szőke', 'kék', 1990),
(2, 'Nagy Béla', 180, 'barna', 'zöld', 1987),
(3, 'Tóth Júlia', 170, 'fekete', 'barna', 1995),
(4, 'Szabó Máté', 175, 'barna', 'kék', 1992),
(5, 'Varga Réka', 160, 'vörös', 'zöld', 1996),
(6, 'Molnár Dániel', 182, 'fekete', 'barna', 1985),
(7, 'Farkas Eszter', 168, 'szőke', 'barna', 1993),
(8, 'Kiss Gábor', 177, 'barna', 'szürke', 1988),
(9, 'Balogh Petra', 169, 'vörös', 'kék', 1991),
(10, 'Lakatos Zoltán', 185, 'ősz', 'barna', 1980);

INSERT INTO Detektiv VALUES
(1, 'Horváth Jenő', 12, 1978),
(2, 'Bognár Laura', 7, 1985),
(3, 'Fekete Zoltán', 15, 1975),
(4, 'Szalai Ákos', 9, 1982);

INSERT INTO Allitas VALUES
(1, 1, 1, 'Anna nem tudta megmondani, hol volt az eset idején.'),
(2, 2, 2, 'Béla zavartan viselkedett a kihallgatáson.'),
(3, 3, 3, 'Júlia azt állította, hogy egyedül volt otthon, de nincs rá tanú.'),
(4, 1, 4, 'Máté ellentmondásba keveredett saját magával.'),
(5, 2, 5, 'Réka elmondta, hogy az áldozattal aznap találkozott.'),
(6, 3, 2, 'Béla alibije nem ellenőrizhető.'),
(7, 1, 3, 'Júlia idegesen reagált a kérdésekre.'),
(8, 2, 1, 'Anna telefonja nem volt bekapcsolva a kérdéses időben.'),
(9, 3, 4, 'Máté ruháján vérnyomokat találtak.'),
(10, 1, 5, 'Réka állítása szerint csak véletlenül volt ott.'),
(11, 4, 6, 'Dániel sietve távozott a helyszínről.'),
(12, 4, 7, 'Eszter próbálta elterelni a témát.'),
(13, 2, 8, 'Gábor nem reagált a pénzügyi kérdésekre.'),
(14, 1, 9, 'Petra zavartnak tűnt, kerülte a szemkontaktust.'),
(15, 3, 10, 'Zoltán nevét említették többen is a háttérben.'),
(16, 2, 6, 'Dániel késve érkezett a találkozóra.'),
(17, 4, 9, 'Petra szerint valaki manipulálta a dokumentumokat.'),
(18, 1, 8, 'Gábor tagadta, hogy aznap ott lett volna.'),
(19, 3, 7, 'Eszter ideges volt, és sokat beszélt feleslegesen.'),
(20, 2, 10, 'Zoltán azt állítja, hogy semmit sem hallott.');

SELECT szemely_id, COUNT(*) AS allitasok_szama
FROM Allitas
GROUP BY szemely_id
ORDER BY allitasok_szama DESC;

SELECT szemely_id, szoveg
FROM Allitas
WHERE szoveg LIKE '%alibi%' OR szoveg LIKE '%ellentmond%' OR szoveg LIKE '%vér%';

SELECT detektiv_id, COUNT(*) AS allitasok_szama
FROM Allitas
GROUP BY detektiv_id
ORDER BY allitasok_szama DESC;

SELECT s.nev, a.szoveg
FROM Allitas a
JOIN Szemely s ON a.szemely_id = s.id
WHERE a.szoveg LIKE '%ideges%' OR a.szoveg LIKE '%zavar%' OR a.szoveg LIKE '%nem tudta%';
