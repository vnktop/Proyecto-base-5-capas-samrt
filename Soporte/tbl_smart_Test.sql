USE SMART
GO
if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('dbTest') and o.name = 'PK_dbTest')
alter table dbTest
   drop constraint PK_dbTest
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbTest')
            and   type = 'U')
   drop table dbTest
go


CREATE TABLE dbTest(
	id int IDENTITY(1,1) NOT NULL,
	Descripcion nvarchar(50) NOT NULL,
 constraint PK_dbTest primary key (id)
)

GO

insert into dbTest (Descripcion) values ('Descripcion 1')
insert into dbTest (Descripcion) values ('Descripcion 2')
insert into dbTest (Descripcion) values ('Descripcion 3')

select * from [dbTest]

