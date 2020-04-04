
#DROP INDEX unique_name ON example.catalogs;
UPDATE example.catalogs set name = 'empty' where name IS NULL;
select * from example.catalogs;
  
