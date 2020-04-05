select * from example.cat;

update example.cat 
set name = 'sdfsdf'
where id = 2;
delete from example.cat where id = 3;

insert  into  example.cat (id, name)
select id, name from shop.catalogs 
on duplicate key update name = shop.catalogs.name;


