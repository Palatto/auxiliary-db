use heroku_8266adc43670d0f;

# Basic queries

select * from users;
select count(*) from users;

select * from promotions;
select count(*) from promotions;

select * from requests;
select count(*) from requests;

select * from requests where request_code = '0';
select count(*) from requests where request_code = '0';

select * from requests where request_code = '1';
select count(*) from requests where request_code = '1';

select now();

# Others

delete from promotions where title like 'test';



