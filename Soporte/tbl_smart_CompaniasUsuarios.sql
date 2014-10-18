USE SMART
GO
if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('smart_CompaniasUsuarios') and o.name = 'FK_SMART_CO_REFERENCE_SMART_CO')
alter table smart_CompaniasUsuarios
   drop constraint FK_SMART_CO_REFERENCE_SMART_CO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('smart_CompaniasUsuarios')
            and   type = 'U')
   drop table smart_CompaniasUsuarios
go

/*==============================================================*/
/* Table: smart_CompaniasUsuarios                               */
/*==============================================================*/
create table smart_CompaniasUsuarios (
   CompaniaId           int                  null,
   UsuarioCompaniaID    uniqueidentifier     not null
)
go

alter table smart_CompaniasUsuarios
   add constraint FK_SMART_CO_REFERENCE_SMART_CO foreign key (CompaniaId)
      references smart_Companias (CompaniaId)
go
