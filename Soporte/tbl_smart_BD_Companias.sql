USE SMART
GO
if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('smart_BD_Companias') and o.name = 'FK_SMART_BD_REFERENCE_SMART_CO')
alter table smart_BD_Companias
   drop constraint FK_SMART_BD_REFERENCE_SMART_CO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('smart_BD_Companias')
            and   type = 'U')
   drop table smart_BD_Companias
go

/*==============================================================*/
/* Table: smart_BD_Companias                                    */
/*==============================================================*/
create table smart_BD_Companias (
   BDCompaniasID        int                  identity(1,1),
   CompaniaId           int                  not null,
   BDProviderCompania   varchar(100)         not null,
   constraint PK_SMART_BD_COMPANIAS primary key (BDCompaniasID)
)
go

alter table smart_BD_Companias
   add constraint FK_SMART_BD_REFERENCE_SMART_CO foreign key (CompaniaId)
      references smart_Companias (CompaniaId)
go
