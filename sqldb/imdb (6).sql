-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Apr 2024 pada 07.40
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `imdb`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `link_trailer` varchar(255) DEFAULT NULL,
  `sutradara` varchar(255) DEFAULT NULL,
  `producer` varchar(255) DEFAULT NULL,
  `penulis` varchar(255) DEFAULT NULL,
  `produksi` varchar(255) DEFAULT NULL,
  `casts` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `movies`
--

INSERT INTO `movies` (`id`, `title`, `year`, `genre`, `duration`, `description`, `rating`, `gambar`, `link_trailer`, `sutradara`, `producer`, `penulis`, `produksi`, `casts`) VALUES
(22, 'Kung Fu Panda 4\r\n', 2024, 'Animation, Adventure', 94, 'Setelah Po (Jack Black) ditunjuk untuk menjadi Pemimpin Spiritual Lembah Damai dia memiliki misi baru. Bersama Zhen (Awkwafina), seekor rubah cerdik, Po mengumpulkan pasukan baru untuk melawan Chameleon (Viola Davis), penyihir jahat yang mampu menyerap semua kekuatan dari penjahat yang ia panggil dan memungkinkannya untuk berubah wujud menjadi makhluk yang ia serap.', 0, 'https://media.21cineplex.com/webcontent/gallery/pictures/170833695317395_287x421.jpg', 'https://www.youtube.com/watch?v=_inKs4eeHiI', 'Mike Mitchell', 'Rebecca Huntley', 'Jonathan Aibel, Glenn Berger', 'Universal Pictures', 'Jack Black, Awkwafina, Viola Davis, Dustin Hoffman, James Hong, Bryan Cranston, Ian McShane, Ke Huy Quan'),
(24, 'Godzilla x Kong: The New Empire', 2024, 'Action, Sci-Fi', 115, 'Godzilla dan Kong akan melawan kekuatan baru yang sangat berbahaya. Kedua raksasa kuno itu akan menghadapi ancaman besar dari dasar bumi. Ancaman yang bisa membuat Godzilla maupun Kong punah.', 0, 'https://media.21cineplex.com/webcontent/gallery/pictures/170980638065259_287x421.jpg', 'https://www.youtube.com/watch?v=qqrpMRDuPfc', 'Adam Wingard', 'Alex Garcia, Jon Jashni, Eric McLeod', 'Terry Rossio, Simon Barrett, Jeremy Slater', 'Warner Bros. Pictures', 'Rebecca Hall, Dan Stevens, Kaylee Hottle, Fala Chen, Rachel House, Brian Tyree Henry, Alex Ferns, Mercy Cornwall, Nicola Crisa, Jordy Campbell'),
(35, 'Para Betina Pengikut Iblis Part 2\r\n', 2024, 'Horor, Thriller', 90, 'Kekacauan di desa Potrosaran oleh ulah Tiga Iblis Betina sampai ke telinga KIAI TAQIM (Iang Darmawan) hingga mengutus AHMAD (Gusti Raihan) muridnya untuk menumpas kekejian Tiga Iblis Betina. Tetapi dalam perjalanannya ternyata tidak mudah untuk mengalahkan Tiga Iblis Betina. Apalagi ternyata Ahmad memiliki masa lalu, yang punya keterikatan dengan desa Potrosaran.', 0, 'https://asset.tix.id/wp-content/uploads/2024/03/1001da75-becc-4650-9082-34746ec4dd72.jpeg', 'https://www.youtube.com/watch?v=hb248fWrRnY', 'Rako Prijanto', 'Agung Haryanto, Mala Shinta', 'Anggoro Saronto, Rako Prijanto', 'MAX Pictures', 'Adipati Dolken, Mawar De Jongh, Hanggini, Sara Fajira, Iang Darmawan, Gusti Raihan'),
(37, 'Inception', 2010, 'Action, Adventure, Sci-Fi', 148, 'A thief who enters the dreams of others to steal secrets from their subconscious.', 0, 'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_.jpg', 'https://www.youtube.com/watch?v=YoHD9XEInc0', 'Christopher Nolan', 'Christopher Nolan, Emma Thomas', 'Christopher Nolan', 'Legendary Entertainment, Syncopy', 'Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page'),
(38, 'The Shawshank Redemption', 1994, 'Drama', 142, 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 0, 'https://m.media-amazon.com/images/M/MV5BNDE3ODcxYzMtY2YzZC00NmNlLWJiNDMtZDViZWM2MzIxZDYwXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_.jpg', 'https://www.youtube.com/watch?v=6hB3S9bIaco', 'Frank Darabont', 'Niki Marvin', 'Stephen King', 'Castle Rock Entertainment', 'Tim Robbins, Morgan Freeman, Bob Gunton'),
(39, 'The Dark Knight', 2008, 'Action, Crime, Drama', 152, 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', 0, 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/watch?v=EXeTwQWrcwY', 'Christopher Nolan', 'Christopher Nolan, Charles Roven, Emma Thomas', 'Christopher Nolan, Jonathan Nolan', 'DC Comics, Syncopy, Legendary Entertainment', 'Christian Bale, Heath Ledger, Aaron Eckhart'),
(40, 'Pulp Fiction', 1994, 'Crime, Drama', 154, 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 0, 'https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg', 'https://www.youtube.com/watch?v=s7EdQ4FqbhY', 'Quentin Tarantino', 'Lawrence Bender', 'Quentin Tarantino', 'Miramax', 'John Travolta, Uma Thurman, Samuel L. Jackson'),
(41, 'The Godfather', 1972, 'Crime, Drama', 175, 'An organized crime dynasty\'s aging patriarch transfers control of his clandestine empire to his reluctant son.', 0, 'https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/watch?v=sY1S34973zA', 'Francis Ford Coppola', 'Albert S. Ruddy', 'Mario Puzo, Francis Ford Coppola', 'Paramount Pictures', 'Marlon Brando, Al Pacino, James Caan'),
(42, 'Fight Club', 1999, 'Drama', 139, 'An insomniac office worker and a devil-may-care soapmaker form an underground fight club that evolves into something much, much more.', 0, 'https://m.media-amazon.com/images/M/MV5BMmEzNTkxYjQtZTc0MC00YTVjLTg5ZTEtZWMwOWVlYzY0NWIwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg', 'https://www.youtube.com/watch?v=SUXWAEX2jlg', 'David Fincher', 'Art Linson, Cean Chaffin, Ross Grayson Bell', 'Chuck Palahniuk, Jim Uhls', 'Fox 2000 Pictures', 'Brad Pitt, Edward Norton, Helena Bonham Carter'),
(43, 'Forrest Gump', 1994, 'Drama, Romance', 142, 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart.', 0, 'https://m.media-amazon.com/images/M/MV5BNWIwODRlZTUtY2U3ZS00Yzg1LWJhNzYtMmZiYmEyNmU1NjMzXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/watch?v=bLvqoHBptjg', 'Robert Zemeckis', 'Wendy Finerman, Steve Tisch, Steve Starkey', 'Winston Groom, Eric Roth', 'Paramount Pictures', 'Tom Hanks, Robin Wright, Gary Sinise'),
(44, 'The Matrix', 1999, 'Action, Sci-Fi', 136, 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.', 0, 'https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/watch?v=J1Z7d20-L7s', 'Lana Wachowski, Lilly Wachowski', 'Joel Silver', 'Lana Wachowski, Lilly Wachowski', 'Warner Bros.', 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss'),
(45, 'The Lord of the Rings: The Fellowship of the Ring', 2001, 'Adventure, Drama, Fantasy', 178, 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.', 0, 'https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg', 'https://www.youtube.com/watch?v=V75dMMIW2B4', 'Peter Jackson', 'Peter Jackson, Barrie M. Osborne, Fran Walsh, Tim Sanders', 'J.R.R. Tolkien, Fran Walsh, Philippa Boyens, Peter Jackson', 'New Line Cinema', 'Elijah Wood, Ian McKellen, Orlando Bloom'),
(46, 'The Lord of the Rings: The Return of the King', 2003, 'Adventure, Drama, Fantasy', 201, 'Gandalf and Aragorn lead the World of Men against Sauron\'s army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.', 0, 'https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg', 'https://www.youtube.com/watch?v=r5X-hFf6Bwo', 'Peter Jackson', 'Barrie M. Osborne, Peter Jackson, Fran Walsh', 'J.R.R. Tolkien, Fran Walsh, Philippa Boyens, Peter Jackson', 'New Line Cinema', 'Elijah Wood, Viggo Mortensen, Ian McKellen'),
(47, 'The Lord of the Rings: The Two Towers', 2002, 'Adventure, Drama, Fantasy', 179, 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum, the divided fellowship makes a stand against Sauron\'s new ally, Saruman, and his hordes of Isengard.', 0, 'https://m.media-amazon.com/images/M/MV5BZTUxNzg3MDUtYjdmZi00ZDY1LTkyYTgtODlmOGY5N2RjYWUyXkEyXkFqcGdeQXVyMTA0MTM5NjI2._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/watch?v=LbfMDwc4azU', 'Peter Jackson', 'Barrie M. Osborne, Fran Walsh, Peter Jackson', 'J.R.R. Tolkien, Fran Walsh, Philippa Boyens, Stephen Sinclair, Peter Jackson', 'New Line Cinema', 'Elijah Wood, Ian McKellen, Viggo Mortensen'),
(48, 'The Dark Knight Rises', 2012, 'Action, Adventure', 164, 'Eight years after the Joker\'s reign of anarchy, Batman, with the help of the enigmatic Catwoman, is forced from his exile to save Gotham City from the brutal guerrilla terrorist Bane.', 0, 'https://m.media-amazon.com/images/M/MV5BMTk4ODQzNDY3Ml5BMl5BanBnXkFtZTcwODA0NTM4Nw@@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/watch?v=GokKUqLcvD8', 'Christopher Nolan', 'Christopher Nolan, Charles Roven, Emma Thomas', 'Christopher Nolan, Jonathan Nolan', 'DC Comics, Legendary Entertainment, Syncopy', 'Christian Bale, Tom Hardy, Anne Hathaway'),
(49, 'The Godfather: Part II', 1974, 'Crime, Drama', 202, 'The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.', 0, 'https://m.media-amazon.com/images/M/MV5BMWMwMGQzZTItY2JlNC00OWZiLWIyMDctNDk2ZDQ2YjRjMWQ0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg', 'https://www.youtube.com/watch?v=9O1Iy9od7-A', 'Francis Ford Coppola', 'Francis Ford Coppola, Gray Frederickson, Fred Roos', 'Francis Ford Coppola, Mario Puzo', 'Paramount Pictures', 'Al Pacino, Robert De Niro, Robert Duvall'),
(50, 'Inglourious Basterds', 2009, 'Adventure, Drama, War', 153, 'In Nazi-occupied France during World War II, a plan to assassinate Nazi leaders by a group of Jewish U.S. soldiers coincides with a theatre owner\'s vengeful plans for the same.', 0, 'https://m.media-amazon.com/images/M/MV5BOTJiNDEzOWYtMTVjOC00ZjlmLWE0NGMtZmE1OWVmZDQ2OWJhXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/watch?v=KnrRy6kSFF0', 'Quentin Tarantino', 'Lawrence Bender', 'Quentin Tarantino', 'The Weinstein Company', 'Brad Pitt, Diane Kruger, Eli Roth'),
(51, 'Goodfellas', 1990, 'Biography, Crime, Drama', 146, 'The story of Henry Hill and his life in the mob, covering his relationship with his wife Karen Hill and his mob partners Jimmy Conway and Tommy DeVito in the Italian-American crime syndicate.', 0, 'https://m.media-amazon.com/images/M/MV5BY2NkZjEzMDgtN2RjYy00YzM1LWI4ZmQtMjIwYjFjNmI3ZGEwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg', 'https://www.youtube.com/watch?v=qo5jJpHtI1Y', 'Martin Scorsese', 'Irwin Winkler', 'Nicholas Pileggi, Martin Scorsese', 'Warner Bros.', 'Robert De Niro, Ray Liotta, Joe Pesci'),
(53, 'The Silence of the Lambs', 1991, 'Crime, Drama, Thriller', 118, 'A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.', 0, 'https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg', 'https://www.youtube.com/watch?v=W6Mm8Sbe__o', 'Jonathan Demme', 'Ron Bozman, Edward Saxon, Kenneth Utt', 'Thomas Harris, Ted Tally', 'Orion Pictures', 'Jodie Foster, Anthony Hopkins, Lawrence A. Bonney'),
(54, 'Star Wars: Episode IV - A New Hope', 1977, 'Action, Adventure, Fantasy', 121, 'Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a Wookiee and two droids to save the galaxy from the Empire\'s world-destroying battle station, while also attempting to rescue Princess Leia from the mysterious Darth Vader.', 0, 'https://m.media-amazon.com/images/M/MV5BOTA5NjhiOTAtZWM0ZC00MWNhLThiMzEtZDFkOTk2OTU1ZDJkXkEyXkFqcGdeQXVyMTA4NDI1NTQx._V1_.jpg', 'https://www.youtube.com/watch?v=XHk5kCIiGoM', 'George Lucas', 'Gary Kurtz, Rick McCallum', 'George Lucas', 'Lucasfilm', 'Mark Hamill, Harrison Ford, Carrie Fisher'),
(55, 'Se7en', 1995, 'Crime, Drama, Mystery', 127, 'Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his motives.', 0, 'https://m.media-amazon.com/images/M/MV5BOTUwODM5MTctZjczMi00OTk4LTg3NWUtNmVhMTAzNTNjYjcyXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg', 'https://www.youtube.com/watch?v=J4YV2_TcCoE', 'David Fincher', 'Arnold Kopelson, Phyllis Carlyle, Arnold Kopelson', 'Andrew Kevin Walker', 'New Line Cinema', 'Morgan Freeman, Brad Pitt, Kevin Spacey'),
(56, 'City of God', 2002, 'Crime, Drama', 130, 'In the slums of Rio, two kids\' paths diverge as one struggles to become a photographer and the other a kingpin.', 0, 'https://upload.wikimedia.org/wikipedia/id/1/10/CidadedeDeus.jpg', 'https://www.youtube.com/watch?v=dcUOO4Itgmw', 'Fernando Meirelles, Kátia Lund', 'Andrea Barata Ribeiro, Mauricio Andrade Ramos, Walter Salles, Elisa Tolomelli', 'Paulo Lins, Bráulio Mantovani', 'O2 Filmes', 'Alexandre Rodrigues, Leandro Firmino, Matheus Nachtergaele'),
(57, 'Life Is Beautiful', 1997, 'Comedy, Drama, Romance', 116, 'When an open-minded Jewish librarian and his son become victims of the Holocaust, he uses a perfect mixture of will, humor, and imagination to protect his son from the dangers around their camp.', 0, 'https://upload.wikimedia.org/wikipedia/id/thumb/7/7c/Vitaebella.jpg/220px-Vitaebella.jpg', 'https://www.youtube.com/watch?v=pAYEQP8gx3w', 'Roberto Benigni', 'Eldorado Films, Melampo Cinematografica', 'Vincenzo Cerami, Roberto Benigni', 'Melampo Cinematografica', 'Roberto Benigni, Nicoletta Braschi, Giorgio Cantarini'),
(58, 'Saving Private Ryan', 1998, 'Drama, War', 169, 'Following the Normandy Landings, a group of U.S. soldiers go behind enemy lines to retrieve a paratrooper whose brothers have been killed in action.', 0, 'https://m.media-amazon.com/images/M/MV5BZjhkMDM4MWItZTVjOC00ZDRhLThmYTAtM2I5NzBmNmNlMzI1XkEyXkFqcGdeQXVyNDYyMDk5MTU@._V1_.jpg', 'https://www.youtube.com/watch?v=RYID71hYHzg', 'Steven Spielberg', 'Ian Bryce, Mark Gordon, Gary Levinsohn, Steven Spielberg', 'Robert Rodat', 'DreamWorks Pictures', 'Tom Hanks, Matt Damon, Tom Sizemore'),
(59, 'Interstellar', 2014, 'Adventure, Drama, Sci-Fi', 169, 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.', 0, 'https://upload.wikimedia.org/wikipedia/id/b/bc/Interstellar_film_poster.jpg', 'https://www.youtube.com/watch?v=3WzHXI5HizQ', 'Christopher Nolan', 'Lynda Obst, Christopher Nolan, Emma Thomas', 'Jonathan Nolan, Christopher Nolan', 'Paramount Pictures', 'Matthew McConaughey, Anne Hathaway, Jessica Chastain'),
(60, 'The Green Mile', 1999, 'Crime, Drama, Fantasy', 189, 'The lives of guards on Death Row are affected by one of their charges: a black man accused of child murder and rape, yet who has a mysterious gift.', 0, 'https://m.media-amazon.com/images/M/MV5BMTUxMzQyNjA5MF5BMl5BanBnXkFtZTYwOTU2NTY3._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/watch?v=ctRK-4Vt7dA', 'Frank Darabont', 'Frank Darabont, David Valdes', 'Stephen King, Frank Darabont', 'Castle Rock Entertainment', 'Tom Hanks, Michael Clarke Duncan, David Morse'),
(61, 'The Departed', 2006, 'Crime, Drama, Thriller', 151, 'An undercover cop and a mole in the police attempt to identify each other while infiltrating an Irish gang in South Boston.', 0, 'https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p162564_p_v8_ag.jpg', 'https://www.youtube.com/watch?v=auYbpnEwBBg', 'Martin Scorsese', 'Brad Pitt, Brad Grey, Graham King', 'William Monahan', 'Warner Bros.', 'Leonardo DiCaprio, Matt Damon, Jack Nicholson'),
(62, 'Gladiator', 2000, 'Action, Adventure, Drama', 155, 'A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.', 0, 'img\\MV5BMDliMmNhNDEtODUyOS00MjNlLTgxODEtN2U3NzIxMGVkZTA1L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.png', 'https://www.youtube.com/watch?v=Q-b7B8tOAQU', 'Ridley Scott', 'David Franzoni, Branko Lustig, Douglas Wick', 'David Franzoni, John Logan, William Nicholson', 'DreamWorks Pictures', 'Russell Crowe, Joaquin Phoenix, Connie Nielsen'),
(63, 'The Prestige', 2006, 'Drama, Mystery, Sci-Fi', 130, 'After a tragic accident, two stage magicians engage in a battle to create the ultimate illusion while sacrificing everything they have to outwit each other.', 0, 'https://upload.wikimedia.org/wikipedia/id/d/d2/Prestige_poster.jpg', 'https://www.youtube.com/watch?v=o4gHCmTQDVI', 'Christopher Nolan', 'Aaron Ryder, Christopher Nolan, Emma Thomas', 'Jonathan Nolan, Christopher Nolan', 'Touchstone Pictures', 'Christian Bale, Hugh Jackman, Scarlett Johansson'),
(64, 'The Intouchables', 2011, 'Biography, Comedy, Drama', 112, 'After he becomes a quadriplegic from a paragliding accident, an aristocrat hires a young man from the projects to be his caregiver.', 0, 'https://m.media-amazon.com/images/M/MV5BMTYxNDA3MDQwNl5BMl5BanBnXkFtZTcwNTU4Mzc1Nw@@._V1_.jpg', 'https://www.youtube.com/watch?v=34WIbmXkewU', 'Olivier Nakache, Éric Toledano', 'Nicolas Duval-Adassovsky, Laurent Zeitoun, Yann Zenou', 'Olivier Nakache, Éric Toledano', 'Gaumont, Quad Productions, Ten Films', 'François Cluzet, Omar Sy, Anne Le Ny'),
(65, 'The Lion King', 1994, 'Animation, Adventure, Drama', 88, 'Lion prince Simba and his father are targeted by his bitter uncle, who wants to ascend the throne himself.', 0, 'https://m.media-amazon.com/images/M/MV5BMjIwMjE1Nzc4NV5BMl5BanBnXkFtZTgwNDg4OTA1NzM@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/watch?v=4sj1MT05lAA', 'Roger Allers, Rob Minkoff', 'Don Hahn', 'Irene Mecchi, Jonathan Roberts, Linda Woolverton', 'Walt Disney Pictures', 'Matthew Broderick, Jeremy Irons, James Earl Jones'),
(66, 'American History X', 1998, 'Drama', 119, 'A former neo-nazi skinhead tries to prevent his younger brother from going down the same wrong path that he did.', 0, 'https://upload.wikimedia.org/wikipedia/id/0/0a/American_history_x_poster.jpg', 'https://www.youtube.com/watch?v=JsPW6Fj3BUI', 'Tony Kaye', 'John Morrissey, John Morrissey', 'David McKenna', 'New Line Cinema', 'Edward Norton, Edward Furlong, Beverly D\'Angelo'),
(67, 'Back to the Future', 1985, 'Adventure, Comedy, Sci-Fi', 116, 'Marty McFly, a 17-year-old high school student, is accidentally sent thirty years into the past in a time-traveling DeLorean invented by his close friend, the eccentric scientist Doc Brown.', 0, 'https://upload.wikimedia.org/wikipedia/id/thumb/5/52/Back_to_the_future.jpg/220px-Back_to_the_future.jpg', 'https://www.youtube.com/watch?v=qvsgGtivCgs', 'Robert Zemeckis', 'Bob Gale, Neil Canton', 'Robert Zemeckis, Bob Gale', 'Universal Pictures', 'Michael J. Fox, Christopher Lloyd, Lea Thompson'),
(68, 'The Usual Suspects', 1995, 'Crime, Mystery, Thriller', 106, 'A sole survivor tells of the twisty events leading up to a horrific gun battle on a boat, which began when five criminals met at a seemingly random police lineup.', 0, 'https://m.media-amazon.com/images/M/MV5BYTViNjMyNmUtNDFkNC00ZDRlLThmMDUtZDU2YWE4NGI2ZjVmXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg', 'https://www.youtube.com/watch?v=oiXdPolca5w', 'Bryan Singer', 'Bryan Singer, Michael McDonnell, Kenneth Kokin', 'Christopher McQuarrie', 'PolyGram Filmed Entertainment, Spelling Films', 'Kevin Spacey, Gabriel Byrne, Chazz Palminteri'),
(69, 'Terminator 2: Judgment Day', 1991, 'Action, Sci-Fi', 137, 'A cyborg, identical to the one who failed to kill Sarah Connor, must now protect her teenage son, John Connor, from a more advanced and powerful cyborg.', 0, 'https://m.media-amazon.com/images/M/MV5BMGU2NzRmZjUtOGUxYS00ZjdjLWEwZWItY2NlM2JhNjkxNTFmXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg', 'https://www.youtube.com/watch?v=eajuMYNYtuY', 'James Cameron', 'James Cameron, Gale Anne Hurd', 'James Cameron, William Wisher Jr.', 'Carolco Pictures', 'Arnold Schwarzenegger, Linda Hamilton, Edward Furlong'),
(70, 'The Pianist', 2002, 'Biography, Drama, Music', 150, 'A Polish Jewish musician struggles to survive the destruction of the Warsaw ghetto of World War II.', 0, 'https://m.media-amazon.com/images/M/MV5BOWRiZDIxZjktMTA1NC00MDQ2LWEzMjUtMTliZmY3NjQ3ODJiXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/watch?v=u_jE7-6Uv7E', 'Roman Polanski', 'Roman Polanski, Robert Benmussa, Alain Sarde', 'Ronald Harwood, Wladyslaw Szpilman', 'Canal+, Heritage Films, Studio Babelsberg', 'Adrien Brody, Thomas Kretschmann, Frank Finlay'),
(71, 'Whiplash', 2014, 'Drama, Music', 106, 'A promising young drummer enrolls at a cut-throat music conservatory where his dreams of greatness are mentored by an instructor who will stop at nothing to realize a student\'s potential.', 0, 'https://m.media-amazon.com/images/M/MV5BOTA5NDZlZGUtMjAxOS00YTRkLTkwYmMtYWQ0NWEwZDZiNjEzXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg', 'https://www.youtube.com/watch?v=7d_jQycdQGo', 'Damien Chazelle', 'Jason Blum, Helen Estabrook, David Lancaster, Michel Litvak', 'Damien Chazelle', 'Bold Films, Blumhouse Productions, Right of Way Films', 'Miles Teller, J.K. Simmons, Melissa Benoist'),
(72, 'Once Upon a Time in America', 1984, 'Crime, Drama', 229, 'A former Prohibition-era Jewish gangster returns to the Lower East Side of Manhattan over thirty years later, where he once again must confront the ghosts and regrets of his old life.', 0, 'https://m.media-amazon.com/images/M/MV5BMmQzZjdmZDAtOGE2Yy00MmUwLTljYzgtZTMwMjk3ZDdiOWUyXkEyXkFqcGdeQXVyNjc5NjEzNA@@._V1_.jpg', 'https://www.youtube.com/watch?v=mzhX2PD6Srw', 'Sergio Leone', 'Arnon Milchan', 'Harry Grey, Leonardo Benvenuti, Piero De Bernardi, Enrico Medioli, Franco Arcalli, Franco Ferrini, Sergio Leone', 'The Ladd Company', 'Robert De Niro, James Woods, Elizabeth McGovern'),
(73, 'Casablanca', 1942, 'Drama, Romance, War', 102, 'A cynical expatriate American cafe owner struggles to decide whether or not to help his former lover and her fugitive husband escape the Nazis in French Morocco.', 0, 'https://m.media-amazon.com/images/M/MV5BY2IzZGY2YmEtYzljNS00NTM5LTgwMzUtMzM1NjQ4NGI0OTk0XkEyXkFqcGdeQXVyNDYyMDk5MTU@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/watch?v=TLU41jUnWM4', 'Michael Curtiz', 'Hal B. Wallis', 'Julius J. Epstein, Philip G. Epstein, Howard Koch', 'Warner Bros.', 'Humphrey Bogart, Ingrid Bergman, Paul Henreid'),
(74, 'American Beauty', 1999, 'Drama', 122, 'A sexually frustrated suburban father has a mid-life crisis after becoming infatuated with his daughter\'s best friend.', 0, 'https://m.media-amazon.com/images/M/MV5BNTBmZWJkNjctNDhiNC00MGE2LWEwOTctZTk5OGVhMWMyNmVhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/watch?v=3ycmmJ6rxA8', 'Sam Mendes', 'Bruce Cohen, Dan Jinks', 'Alan Ball', 'DreamWorks Pictures', 'Kevin Spacey, Annette Bening, Thora Birch'),
(75, 'Django Unchained', 2012, 'Drama, Western', 165, 'With the help of a German bounty hunter, a freed slave sets out to rescue his wife from a brutal Mississippi plantation owner.', 0, 'https://m.media-amazon.com/images/M/MV5BMjIyNTQ5NjQ1OV5BMl5BanBnXkFtZTcwODg1MDU4OA@@._V1_.jpg', 'https://www.youtube.com/watch?v=eUdM9vrCbow', 'Quentin Tarantino', 'Stacey Sher, Reginald Hudlin, Pilar Savone', 'Quentin Tarantino', 'The Weinstein Company', 'Jamie Foxx, Christoph Waltz, Leonardo DiCaprio'),
(76, 'The Shining', 1980, 'Drama, Horror', 146, 'A family heads to an isolated hotel for the winter where a sinister presence influences the father into violence, while his psychic son sees horrific forebodings from both past and future.', 0, 'https://m.media-amazon.com/images/M/MV5BZWFlYmY2MGEtZjVkYS00YzU4LTg0YjQtYzY1ZGE3NTA5NGQxXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/watch?v=5Cb3ik6zP2I', 'Stanley Kubrick', 'Stanley Kubrick', 'Stephen King, Stanley Kubrick', 'Hawk Films', 'Jack Nicholson, Shelley Duvall, Danny Lloyd'),
(77, 'WALL·E', 2008, 'Animation, Adventure, Family', 98, 'In the distant future, a small waste-collecting robot inadvertently embarks on a space journey that will ultimately decide the fate of mankind.', 0, 'https://upload.wikimedia.org/wikipedia/id/c/c2/WALL-Eposter.jpg', 'https://www.youtube.com/watch?v=ZisWjdjs-gM', 'Andrew Stanton', 'Jim Morris, Lindsey Collins', 'Andrew Stanton, Pete Docter, Jim Reardon', 'Walt Disney Pictures', 'Ben Burtt, Elissa Knight, Jeff Garlin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_akun`
--

CREATE TABLE `tabel_akun` (
  `id` int(6) NOT NULL,
  `email` varchar(30) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tabel_akun`
--

INSERT INTO `tabel_akun` (`id`, `email`, `username`, `password`) VALUES
(26, 'irfan@gmail.com', 'a', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_review`
--

CREATE TABLE `user_review` (
  `id_review` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_movie` int(11) DEFAULT NULL,
  `isi_review` text DEFAULT NULL,
  `rating` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Trigger `user_review`
--
DELIMITER $$
CREATE TRIGGER `update_movie_rating` AFTER INSERT ON `user_review` FOR EACH ROW BEGIN
    -- Hitung ulang rata-rata rating untuk film yang terkait
    UPDATE movies m
    SET m.rating = (
        SELECT AVG(rating)
        FROM user_review
        WHERE id_movie = NEW.id_movie
    )
    WHERE m.id = NEW.id_movie;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `watchlist`
--

CREATE TABLE `watchlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tabel_akun`
--
ALTER TABLE `tabel_akun`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`),
  ADD UNIQUE KEY `unique_username` (`username`);

--
-- Indeks untuk tabel `user_review`
--
ALTER TABLE `user_review`
  ADD PRIMARY KEY (`id_review`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_movie` (`id_movie`);

--
-- Indeks untuk tabel `watchlist`
--
ALTER TABLE `watchlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT untuk tabel `tabel_akun`
--
ALTER TABLE `tabel_akun`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `user_review`
--
ALTER TABLE `user_review`
  MODIFY `id_review` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `watchlist`
--
ALTER TABLE `watchlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `user_review`
--
ALTER TABLE `user_review`
  ADD CONSTRAINT `user_review_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tabel_akun` (`id`),
  ADD CONSTRAINT `user_review_ibfk_2` FOREIGN KEY (`id_movie`) REFERENCES `movies` (`id`);

--
-- Ketidakleluasaan untuk tabel `watchlist`
--
ALTER TABLE `watchlist`
  ADD CONSTRAINT `watchlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tabel_akun` (`id`),
  ADD CONSTRAINT `watchlist_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
