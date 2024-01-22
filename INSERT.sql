INSERT INTO public.album ("name",date_release) VALUES
	 ('Неприлично о личном','2019-11-22'),
	 ('Боже, храни кьют-рок','2020-12-18'),
	 ('Время Х ','2012-06-25'),
	 ('Pussy Boy','2021-07-16');
INSERT INTO public.colection ("name","date") VALUES
	 ('Кьют-РОК Лучшее 2023','2023-12-31'),
	 ('Yandex CHART 2023','2023-12-31'),
	 ('Попса The BEST','2022-12-31'),
	 ('Сборник РОКа','2021-12-31');
INSERT INTO public.genre ("name") VALUES
	 ('Поп'),
	 ('Кьют-рок'),
	 ('Альтернативный рок');
INSERT INTO public.musician ("name") VALUES
	 ('Клава Кока'),
	 ('Егор Крид'),
	 ('Дора'),
	 ('Loona');
INSERT INTO public.musician_albums (musician_id,album_id) VALUES
	 (1,1),
	 (2,4),
	 (3,2),
	 (4,3);
INSERT INTO public.musician_genres (musician_id,genre_id) VALUES
	 (1,1),
	 (2,1),
	 (3,2),
	 (4,3);
INSERT INTO public.song ("name",duration,album) VALUES
	 ('Время Х','00:03:30',3),
	 ('Мама','00:04:00',3),
	 ('Втюрилась','00:02:04',2),
	 ('Осень пьяная','00:02:52',2),
	 ('Мне пох','00:02:38',1),
	 ('мой Зая','00:02:41',1),
	 ('Pussy Boy','00:02:14',4),
	 ('Грустно','00:02:33',4);
INSERT INTO public.tracks_colection (colection_id,song_id) VALUES
	 (1,3),
	 (1,4),
	 (2,5),
	 (2,6),
	 (2,8),
	 (3,7),
	 (3,5),
	 (4,1),
	 (4,2);
