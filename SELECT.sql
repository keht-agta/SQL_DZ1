--DZ2.1
--Название и продолжительность самого длительного трека.
select name, duration
from song s
--where duration ='00:03:30'
where duration = (select MAX(s.duration) from song s)
order by duration desc


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
--И обращаю внимание, что ваша реализация 9 запроса отвечает на вопрос “кто выпустил хоть что-то, кроме того,
-- что выпустил в 2020”, а не на вопрос: “кто не выпустил альбомы в 2020 году”. 
--Чтобы решить поставленную задачу нужно сначала найти тех исполнителей, кто выпустил альбом в 2020 (вложенным запросом), 
--а потом их исключить из общего списка исполнителей.
select m.name
from musician m 
join musician_albums ma on ma.musician_id = m.id 
join album a on a.id = ma.album_id 
where a.date_release BETWEEN '2020-01-01' and '2020-12-31'


select m.name
from musician m
where m.name not in (select m.name
from musician m 
join musician_albums ma on ma.musician_id = m.id 
join album a on a.id = ma.album_id 
where a.date_release BETWEEN '2020-01-01' and '2020-12-31')

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

--DZ4.1
--Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
--select m."id"
--from musician m  
--join musician_genres mg on mg.musician_id  = m.id  
--group by m.id 
--having count(mg.genre_id) >1

select distinct a.name
from album a 
join musician_albums ma on ma.album_id = a.id
join musician m on m.id = ma.musician_id
join musician_genres mg on mg.musician_id  = m.id
where m.id = (select m."id" from musician m  join musician_genres mg on mg.musician_id  = m.id  group by m.id having count(mg.genre_id) >1)
order by a."name"  desc 


--DZ4.2
--Наименования треков, которые не входят в сборники.

--DZ4.3
--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.

--DZ4.4
--Названия альбомов, содержащих наименьшее количество треков.


