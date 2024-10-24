/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     24/10/2024 6:13:50 p. m.                     */
/*==============================================================*/


drop table AUTOBUS;

drop table CHECKIN;

drop table PASAJE;

drop table PASAJERO;

drop table RESERVA;

drop table RUTA;

/*==============================================================*/
/* Table: AUTOBUS                                               */
/*==============================================================*/
create table AUTOBUS (
   ID_VEHICULO          NUMERIC(10)          not null,
   ID_RUTA              NUMERIC(10)          not null,
   MATRICULO            VARCHAR(50)          not null,
   CAPACIDAD            DECIMAL(10)          not null,
   TIPO_DE_VEHICULO     VARCHAR(20)          null,
   constraint PK_AUTOBUS primary key (ID_VEHICULO)
);

/*==============================================================*/
/* Table: CHECKIN                                               */
/*==============================================================*/
create table CHECKIN (
   ID_CHECKIN           NUMERIC(10)          not null,
   ID_RESERVA           NUMERIC(10)          null,
   ID_PASAJE            NUMERIC(10)          null,
   FECHA_CHECKIN        DATE                 null,
   HORA_CHECKIN         TIME                 null,
   ESTADO               BOOL                 null,
   constraint PK_CHECKIN primary key (ID_CHECKIN)
);

/*==============================================================*/
/* Table: PASAJE                                                */
/*==============================================================*/
create table PASAJE (
   ID_PASAJE            NUMERIC(10)          not null,
   ID_RESERVA           NUMERIC(10)          not null,
   ID_VEHICULO          NUMERIC(10)          not null,
   FECHA_VIAJE          DATE                 not null,
   HORA_VIAJE           TIME                 not null,
   NUMERO_ASIENTO       NUMERIC(10)          not null,
   constraint PK_PASAJE primary key (ID_PASAJE)
);

/*==============================================================*/
/* Table: PASAJERO                                              */
/*==============================================================*/
create table PASAJERO (
   ID_PASAJERO          DECIMAL(10)          not null,
   NOMBRE               VARCHAR(20)          not null,
   APELLIDO             VARCHAR(20)          not null,
   DOCUMENTO            VARCHAR(50)          not null,
   TELEFONO             NUMERIC(10)          null,
   CORREO               VARCHAR(50)          null,
   constraint PK_PASAJERO primary key (ID_PASAJERO)
);

/*==============================================================*/
/* Table: RESERVA                                               */
/*==============================================================*/
create table RESERVA (
   ID_RESERVA           NUMERIC(10)          not null,
   ID_PASAJERO          DECIMAL(10)          not null,
   ID_VEHICULO          NUMERIC(10)          not null,
   FECHA_RESERVA        DATE                 not null,
   ESTADO               BOOL                 not null,
   METODO_DE_PAGO       VARCHAR(10)          null,
   constraint PK_RESERVA primary key (ID_RESERVA)
);

/*==============================================================*/
/* Table: RUTA                                                  */
/*==============================================================*/
create table RUTA (
   ID_RUTA              NUMERIC(10)          not null,
   ORIGEN               VARCHAR(20)          not null,
   DESTINO              VARCHAR(20)          not null,
   DURACION_ESTIMADA    TIMESTAMP            null,
   constraint PK_RUTA primary key (ID_RUTA)
);

alter table AUTOBUS
   add constraint FK_AUTOBUS_REFERENCE_RUTA foreign key (ID_RUTA)
      references RUTA (ID_RUTA)
      on delete restrict on update restrict;

alter table CHECKIN
   add constraint FK_CHECKIN_REFERENCE_RESERVA foreign key (ID_RESERVA)
      references RESERVA (ID_RESERVA)
      on delete restrict on update restrict;

alter table CHECKIN
   add constraint FK_CHECKIN_REFERENCE_PASAJE foreign key (ID_PASAJE)
      references PASAJE (ID_PASAJE)
      on delete restrict on update restrict;

alter table PASAJE
   add constraint FK_PASAJE_REFERENCE_RESERVA foreign key (ID_RESERVA)
      references RESERVA (ID_RESERVA)
      on delete restrict on update restrict;

alter table PASAJE
   add constraint FK_PASAJE_REFERENCE_AUTOBUS foreign key (ID_VEHICULO)
      references AUTOBUS (ID_VEHICULO)
      on delete restrict on update restrict;

alter table RESERVA
   add constraint FK_RESERVA_REFERENCE_PASAJERO foreign key (ID_PASAJERO)
      references PASAJERO (ID_PASAJERO)
      on delete restrict on update restrict;

alter table RESERVA
   add constraint FK_RESERVA_REFERENCE_AUTOBUS foreign key (ID_VEHICULO)
      references AUTOBUS (ID_VEHICULO)
      on delete restrict on update restrict;

