select * from application
order by idApplication desc
    limit 5;

# 5
select * from client
where LastName like '%OV' or
    LastName like '%OVA';

# 6
select * from client
                  join department d on d.idDepartment = client.Department_idDepartment
where d.DepartmentCity = 'Kyiv';

# 7
select distinct FirstName from client;

# 8
select * from client
                  join application a on a.idApplication = client.idClient
where a.Sum > 5000 and a.Currency = 'Gryvnia';

# 9
select count(*) as all_count from client
                                      join department d on client.Department_idDepartment = d.idDepartment;

select count(*) as count_Lviv  from client
                                        join department d on d.idDepartment = client.Department_idDepartment
where d.DepartmentCity = 'Lviv';

# 10
select max(Sum) as maxCredit, client.* from client
                                                join application a on  client.idClient = a.Client_idClient
group by idClient;

# 11
select count(*) as count, client.* from client
    join application a on client.idClient = a.Client_idClient
group by idClient;

# 12
select max(Sum) as maxCredit, min(Sum) as minCredit from application;

# 13
select count(*) as count, client.FirstName, client.LastName, client.Education from client
    join application a on client.idClient = a.Client_idClient
where Education = 'high'
group by idClient;

# 14
select avg(Sum) as avg, client.FirstName, client.LastName from client
    join application a on client.idClient = a.Client_idClient
group by idClient
order by avg desc
    limit 1;

# 15
select sum(Sum) as sum, idDepartment, DepartmentCity
from department
    join client c on department.idDepartment = c.Department_idDepartment
    join application a on c.idClient = a.Client_idClient
group by idDepartment
order by Sum desc
    limit 1;

# 16
select max(Sum) as maxSum, department.*
from department
         join client c on department.idDepartment = c.Department_idDepartment
         join application a on c.idClient = a.Client_idClient
group by idDepartment
order by maxSum desc
    limit 1;

# 17
update application
    join client c on c.idClient = application.Client_idClient
    set Sum = 6000
where Education = 'high';

# 18
update client
    join department d on d.idDepartment = client.Department_idDepartment
    set City = 'Kyiv'
where DepartmentCity = 'Kyiv';

# 19
delete application from application
where CreditState = 'Returned';

# 20
delete application from application
        join client c on c.idClient = application.Client_idClient
where LastName like '_a%' or
      LastName like '_e%' or
      LastName like '_o%' or
      LastName like '_y%' or
      LastName like '_u%';

# 21
select sum(Sum) as sum, idDepartment, DepartmentCity from department
    join client c on department.idDepartment = c.Department_idDepartment
    join application a on c.idClient = a.Client_idClient
where DepartmentCity = 'Lviv'
group by idDepartment
having sum(Sum) > 5000;

# 22
select FirstName, LastName, CreditState, Sum from client
                                                      join application a on client.idClient = a.Client_idClient
where CreditState = 'Returned' and
    Sum > 5000;

# 23
select  * from application
where CreditState = 'Not returned'
order by Sum desc
    limit 1;

# 24
select client.*, Sum from client
                              join application a on client.idClient = a.Client_idClient
order by Sum
    limit 1;

# 25
select * from application
where Sum > (select avg(Sum) from application);

# 26
select * from client
where City = (
    select client.City from client
                                join application a on client.idClient = a.Client_idClient
    group by idClient
    order by count(*) desc
    limit 1
    );

# 27
select City, FirstName from client
                                join application a on client.idClient = a.Client_idClient
group by idClient
order by count(*) desc
    limit 1;
