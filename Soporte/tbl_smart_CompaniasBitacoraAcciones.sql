USE SMART
GO
if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Smart_CompaniasBitacoraAcciones') and o.name = 'FK_SMART_CO_REFERENCE_SMART_CO')
alter table Smart_CompaniasBitacoraAcciones
   drop constraint FK_SMART_CO_REFERENCE_SMART_CO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Smart_CompaniasBitacoraAcciones')
            and   type = 'U')
   drop table Smart_CompaniasBitacoraAcciones
go

/*==============================================================*/
/* Table: Smart_CompaniasBitacoraAcciones                       */
/*==============================================================*/
create table Smart_CompaniasBitacoraAcciones (
   CompaniaId           int                  null,
   AgregarCompania      bit                  null,
   AgregarMembership    bit                  null,
   AgregarPerfil        bit                  null,
   EnvioCorreo          bit                  null
)
go

alter table Smart_CompaniasBitacoraAcciones
   add constraint FK_SMART_CO_REFERENCE_SMART_CO foreign key (CompaniaId)
      references smart_Companias (CompaniaId)
go
