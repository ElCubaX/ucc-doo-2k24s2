/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     6/09/2024 9:46:57 p. m.                      */
/*==============================================================*/


drop table AVION;

drop table CIUDAD;

drop table ITINERARIO;

/*==============================================================*/
/* Table: AVION                                                 */
/*==============================================================*/
create table AVION (
   ID                   DECIMAL(10)          not null,
   CAPACIDAD            NUMERIC(15,2)        null,
   COLOR                VARCHAR(20)          null,
   MARCA                VARCHAR(20)          null,
   MODELO               VARCHAR(20)          null,
   constraint PK_AVION primary key (ID)
);

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD (
   ID                   CHAR(5)              not null,
   NOMBRE               VARCHAR(20)          null,
   constraint PK_CIUDAD primary key (ID)
);

/*==============================================================*/
/* Table: ITINERARIO                                            */
/*==============================================================*/
create table ITINERARIO (
   ID                   DECIMAL(10)          not null,
   NOMBRE               VARCHAR(20)          not null,
   FECHA_SALIDA         DATE                 not null,
   HORA_SALIDA          TIME WITH TIME ZONE  null,
   AVION_ID             DECIMAL(10)          not null,
   CIUDAD_SALIDA_ID     CHAR(5)              null,
   CIUDAD_LLEGADA_ID    CHAR(5)              null,
   constraint PK_ITINERARIO primary key (ID)
);

alter table ITINERARIO
   add constraint FK_ITINERAR_REFERENCE_AVION foreign key (AVION_ID)
      references AVION (ID)
      on delete restrict on update restrict;

alter table ITINERARIO
   add constraint FK_ITINERAR_REF_CIUDAD_SALIDA foreign key (CIUDAD_SALIDA_ID)
      references CIUDAD (ID)
      on delete restrict on update restrict;

alter table ITINERARIO
   add constraint FK_ITINERAR_REF_CIUDAD_LLEGADA foreign key (CIUDAD_LLEGADA_ID)
      references CIUDAD (ID)
      on delete restrict on update restrict;

