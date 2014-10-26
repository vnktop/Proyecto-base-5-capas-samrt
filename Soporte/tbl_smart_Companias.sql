USE SMART
GO
if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('smart_BD_Companias') and o.name = 'FK_SMART_BD_REFERENCE_SMART_CO')
alter table smart_BD_Companias
   drop constraint FK_SMART_BD_REFERENCE_SMART_CO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('smart_CompaniasUsuarios') and o.name = 'FK_SMART_CO_REFERENCE_SMART_CO')
alter table smart_CompaniasUsuarios
   drop constraint FK_SMART_CO_REFERENCE_SMART_CO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('smart_Companias')
            and   type = 'U')
   drop table smart_Companias
go

/*==============================================================*/
/* Table: smart_Companias                                       */
/*==============================================================*/
create table smart_Companias (
   CompaniaId           int                  identity(1,1),
   RazonSocial          varchar(100)         not null,
   Descripcion          varchar(150)         null,
   RFC                  varchar(15)          not null,
   NombreBD             varchar(15)          not null,
   CorreoContacto       varchar(30)          not null,
   NombreContacto       varchar(50)          not null,
   FechaSis             datetime             null,
   EsActiva             bit                  null default 1,
   constraint PK_SMART_COMPANIAS primary key (CompaniaId)
)
go
