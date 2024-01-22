--DZ2.1
--Название и продолжительность самого длительного трека.
select name, duration
from song s
order by duration desc limit 1

--DZ2.2
--Название треков, продолжительность которых не менее 3,5 минут.
select name
from song s
where duration >= '00:03:30';

--DZ2.3
--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
select name
from colection c 
where date between '2018-01-01' and '2020-12-31'

--DZ2.4
--Исполнители, чьё имя состоит из одного слова.
select name 
from musician m 
where name not like '% %'

--DZ2.5
--Название треков, которые содержат слово «мой» или «my».
select name 
from song 
where name like '%мой%' or name like '%my%'

--DZ3.1
-- Количество исполнителей в каждом жанре.
select name , count(m.genre_id)
from genre g 
join musician_genres m on g.id = m.genre_id
group by g.name

--DZ3.2
--Количество треков, вошедших в альбомы 2019–2020 годов.
select count(s.name)
from song s 
join album a on s.album = a.id
where a.date_release between '2019-01-01' and '2020-12-31'

--DZ3.3
--Средняя продолжительность треков по каждому альбому.
select a."name", AVG(s.duration)
from album a 
join song s on a.id = s.album 
group by a.name;

--DZ3.4
--Все исполнители, которые не выпустили альбомы в 2020 году.
select m.name
from musician m
join musician_albums ma on ma.musician_id  = m.id 
join album a on a.id = ma.album_id 
where a.date_release not BETWEEN '2020-01-01' and '2020-12-31'

--DZ3/5
--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
select distinct c."name" 
from colection c 
join tracks_colection tc on tc.colection_id = c.id 
join song s on s.id = tc.song_id 
join album a on a.id = s.album
join musician_albums ma on ma.album_id = a.id 
join musician m on m.id = ma.musician_id 
where m.name = 'Клава Кока'


