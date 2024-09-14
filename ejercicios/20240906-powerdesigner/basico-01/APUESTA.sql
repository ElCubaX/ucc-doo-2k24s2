/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     12/09/2024 10:34:56 p. m.                    */
/*==============================================================*/


drop table APUESTA;

drop table DETALLE_APUESTA_LOTERIA;

drop table DETALLE_APUESTA_NUMERO;

drop table LOTERIA;

drop table NUMERO_DE_APUESTA;

drop table USUARIO;

/*==============================================================*/
/* Table: APUESTA                                               */
/*==============================================================*/
create table APUESTA (
   ID_APUESTA           DECIMAL(10)          not null,
   FECHA                DATE                 null,
   VALOR_APOSTADO       DECIMAL(10,2)        null,
   ID_USUARIO           DECIMAL(10)          null,
   ID_LOTERIA           DECIMAL(10)          null,
   constraint PK_APUESTA primary key (ID_APUESTA)
);

/*==============================================================*/
/* Table: DETALLE_APUESTA_LOTERIA                               */
/*==============================================================*/
create table DETALLE_APUESTA_LOTERIA (
   ID_DETALLE_APUESTA_LOTERIA DECIMAL(10)          not null,
   ID_APUESTA           DECIMAL(10)          null,
   ID_LOTERIA           DECIMAL(10)          null,
   LOT_ID_LOTERIA       DECIMAL(10)          null,
   constraint PK_DETALLE_APUESTA_LOTERIA primary key (ID_DETALLE_APUESTA_LOTERIA)
);

/*==============================================================*/
/* Table: DETALLE_APUESTA_NUMERO                                */
/*==============================================================*/
create table DETALLE_APUESTA_NUMERO (
   ID_DETALLE_APUESTA_NUMERO DECIMAL(10)          not null,
   ID_APUESTA           DECIMAL(10)          null,
   ID_NUMERO_APUESTA    DECIMAL(10)          null,
   constraint PK_DETALLE_APUESTA_NUMERO primary key (ID_DETALLE_APUESTA_NUMERO)
);

/*==============================================================*/
/* Table: LOTERIA                                               */
/*==============================================================*/
create table LOTERIA (
   ID_LOTERIA           DECIMAL(10)          not null,
   NOMBRE_LOTERIA       VARCHAR(50)          null,
   HORARIO_LOTERIA      TIME WITH TIME ZONE  null,
   constraint PK_LOTERIA primary key (ID_LOTERIA)
);

/*==============================================================*/
/* Table: NUMERO_DE_APUESTA                                     */
/*==============================================================*/
create table NUMERO_DE_APUESTA (
   ID_NUMERO_APUESTA    DECIMAL(10)          not null,
   NUMERO               INT2                 null,
   constraint PK_NUMERO_DE_APUESTA primary key (ID_NUMERO_APUESTA)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   ID_USUARIO           DECIMAL(10)          not null,
   NOMBRE               VARCHAR(50)          null,
   EMAIL                VARCHAR(50)          null,
   CONTRASENA           VARCHAR(50)          null,
   constraint PK_USUARIO primary key (ID_USUARIO)
);

alter table APUESTA
   add constraint FK_APUESTA_APUESTA_U_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO)
      on delete restrict on update restrict;

alter table DETALLE_APUESTA_LOTERIA
   add constraint FK_DETALLE__DETALLE_A_APUESTA foreign key (ID_APUESTA)
      references APUESTA (ID_APUESTA)
      on delete restrict on update restrict;

alter table DETALLE_APUESTA_LOTERIA
   add constraint FK_DETALLE__DETALLE_D_LOTERIA foreign key (ID_LOTERIA)
      references LOTERIA (ID_LOTERIA)
      on delete restrict on update restrict;

alter table DETALLE_APUESTA_LOTERIA
   add constraint FK_DETALLE__DETALLE_Y_LOTERIA foreign key (LOT_ID_LOTERIA)
      references LOTERIA (ID_LOTERIA)
      on delete restrict on update restrict;

alter table DETALLE_APUESTA_NUMERO
   add constraint FK_DETALLE__DETALLE_Y_APUESTA foreign key (ID_APUESTA)
      references APUESTA (ID_APUESTA)
      on delete restrict on update restrict;

alter table DETALLE_APUESTA_NUMERO
   add constraint FK_DETALLE__REFERENCI_NUMERO_D foreign key (ID_NUMERO_APUESTA)
      references NUMERO_DE_APUESTA (ID_NUMERO_APUESTA)
      on delete restrict on update restrict;

