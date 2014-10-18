USE SMART
GO
if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('smart_PermisosPerfil') and o.name = 'FK_SMART_PE_REFERENCE_SMART_PE')
alter table smart_PermisosPerfil
   drop constraint FK_SMART_PE_REFERENCE_SMART_PE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('smart_Perfiles')
            and   type = 'U')
   drop table smart_Perfiles
go

/*==============================================================*/
/* Table: smart_Perfiles                                        */
/*==============================================================*/
create table smart_Perfiles (
   PerfilID             int                  identity(1,1),
   Funcion              varchar(15)          null,
   Descripcion          varchar(50)          null,
   FechaSis             datetime             null,
   EsActivo             bit                  null default 1,
   constraint PK_SMART_PERFILES primary key (PerfilID)
)
go
