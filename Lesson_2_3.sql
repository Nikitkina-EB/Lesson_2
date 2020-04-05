create schema if not exists media;
use media;


drop table if exists users;
create table users (
  id SERIAL PRIMARY KEY,
  name varchar(255),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'users';

drop table if exists files; # 1 файл только для одного пользователя - никто не должен видеть локальные чужие файлы ))))
create table files (
  id SERIAL PRIMARY KEY,
  user_id INT UNSIGNED,
  file_name VARCHAR(255),
  file_path VARCHAR(500),
  file_discription VARCHAR(500),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id)
) COMMENT = 'Файлы';

drop table if exists keywords_to_files;
 create table keywords_to_files (
  id SERIAL PRIMARY KEY,
  file_id INT UNSIGNED,
  keyword_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_file_id(file_id),
  KEY index_of_keyword_id(keyword_id)
) COMMENT = 'ключевые слова к файлам'; # для того чтобы дедублицивать ключевые слова (одно ключевое слово может относиться к несокльким файлам, при этом данное ключевое слово будет указано 1 раз

drop table if exists keywords; # на 1 файл может быть несоклько ключевых слов
create table keywords (
  id SERIAL PRIMARY KEY,
  keyword varchar(255),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'ключевые слова';