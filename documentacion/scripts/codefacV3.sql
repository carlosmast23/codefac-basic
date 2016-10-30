/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/01/20 11:42:26                          */
/*==============================================================*/


drop table if exists ABONO_VENTA_CREDITO;

drop table if exists CATALAGO_PRODUCTO;

drop table if exists CATEGORIA_PRODUCTO;

drop table if exists CLIENTE;

drop table if exists COMPRA;

drop table if exists CREDITO_FACTURA;

drop table if exists DETALLES_SERVICIO;

drop table if exists DETALLE_PRODUCTO_GENERAL;

drop table if exists DETALLE_PRODUCTO_INDIVIDUAL;

drop table if exists DISTRIBUIDOR;

drop table if exists NOTA_CREDITO_DEBITO;

drop table if exists PERIODO_CONTABLE;

drop table if exists PRODUCTO_GENERAL_COMPRA;

drop table if exists PRODUCTO_GENERAL_VENTA;

drop table if exists PRODUCTO_INDIVIDUAL_COMPRA;

drop table if exists RESERVA_PRODUCTO_GENERAL;

drop table if exists SERVICIOS;

drop table if exists USUARIO;

drop table if exists VENTA;

/*==============================================================*/
/* Table: ABONO_VENTA_CREDITO                                   */
/*==============================================================*/
create table ABONO_VENTA_CREDITO
(
   CODIGO_ABONO         int not null,
   CODIGO_FACTURA_CREDITO int,
   CANTIDAD             numeric(8,2),
   FECHA                datetime,
   DESCRIPCION          varchar(512),
   primary key (CODIGO_ABONO)
);

/*==============================================================*/
/* Table: CATALAGO_PRODUCTO                                     */
/*==============================================================*/
create table CATALAGO_PRODUCTO
(
   CODIGO_PRODUCTO      varchar(64) not null,
   CAT_NOMBRE           varchar(64),
   NOMBRE               varchar(256),
   DESCRIPCION          varchar(512),
   MARCA                varchar(32),
   PRECIO               decimal(8,2),
   DESCUENTO            int,
   UBICACION            varchar(64),
   UNIDADES             varchar(8),
   primary key (CODIGO_PRODUCTO)
);

/*==============================================================*/
/* Table: CATEGORIA_PRODUCTO                                    */
/*==============================================================*/
create table CATEGORIA_PRODUCTO
(
   NOMBRE               varchar(64) not null,
   DESCRIPCION          varchar(128),
   primary key (NOMBRE)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE
(
   CEDULA_RUC           varchar(20) not null,
   APELLIDOS            varchar(50),
   TELEFONO             varchar(10),
   CORREO               varchar(50),
   DIRECCION            varchar(100),
   CELULAR              varchar(11),
   FECHA_INGRESO        datetime,
   ESTADO               char,
   TIPO                 varchar(25),
   CIUDAD               varchar(25),
   NOMBRE               varchar(100),
   ULTIMO_MOV           datetime,
   NOTAS                varchar(250),
   primary key (CEDULA_RUC)
);

/*==============================================================*/
/* Table: COMPRA                                                */
/*==============================================================*/
create table COMPRA
(
   CODIGO_COMPRA        int not null,
   NICK                 varchar(64),
   RUC                  varchar(13),
   CODIGO_PERIDO        int,
   CODIGO_DOCUMENTO     varchar(64),
   TIPO_DOCUMENTO       varchar(64),
   TOTAL                decimal(8,2),
   FECHA                time,
   DESCUENTO            decimal(8,2),
   primary key (CODIGO_COMPRA)
);

/*==============================================================*/
/* Table: CREDITO_FACTURA                                       */
/*==============================================================*/
create table CREDITO_FACTURA
(
   CODIGO_FACTURA_CREDITO int not null,
   CODIGO_FACTURA       int,
   FECHA_INICIO         date,
   FECHA_FIN            date,
   ESTADO               varchar(16),
   CALIFICACION         int,
   DIA_PAGO             int,
   primary key (CODIGO_FACTURA_CREDITO)
);

/*==============================================================*/
/* Table: DETALLES_SERVICIO                                     */
/*==============================================================*/
create table DETALLES_SERVICIO
(
   COD_DETALLE_SERVICIO int not null,
   CODIGO_SERVICIO      int,
   CODIGO_FACTURA       int,
   COSTO                decimal(8,2),
   DESCRIPCION_         varchar(128),
   primary key (COD_DETALLE_SERVICIO)
);

/*==============================================================*/
/* Table: DETALLE_PRODUCTO_GENERAL                              */
/*==============================================================*/
create table DETALLE_PRODUCTO_GENERAL
(
   CODIGO_DETALL_GENERAL int not null,
   CODIGO_FACTURA       int,
   CODIGO_PRODUCTO      varchar(64),
   CANTIDAD             int,
   SUBTOTAL             numeric(8,2),
   primary key (CODIGO_DETALL_GENERAL)
);

/*==============================================================*/
/* Table: DETALLE_PRODUCTO_INDIVIDUAL                           */
/*==============================================================*/
create table DETALLE_PRODUCTO_INDIVIDUAL
(
   CODIGO_DETALLE_INDIVIDUAL int not null,
   CODIGO_UNICO         varchar(64),
   CODIGO_FACTURA       int,
   SUBTOTAL             decimal(8,2),
   primary key (CODIGO_DETALLE_INDIVIDUAL)
);

/*==============================================================*/
/* Table: DISTRIBUIDOR                                          */
/*==============================================================*/
create table DISTRIBUIDOR
(
   RUC                  varchar(13) not null,
   NOMBRE               varchar(100),
   CIUDAD               varchar(50),
   DIRECCION            varchar(100),
   CONTACTO             varchar(100),
   ESTADO               char,
   TIPO_PAGO            varchar(25),
   DIAS_PAGO            int,
   ULTIMO_MOV           datetime,
   NOTAS                varchar(250),
   TELEFONO             varchar(100),
   CORREO               varchar(1000),
   primary key (RUC)
);

/*==============================================================*/
/* Table: NOTA_CREDITO_DEBITO                                   */
/*==============================================================*/
create table NOTA_CREDITO_DEBITO
(
   CODIGO_DEBITO_CREDITO int not null,
   CODIGO_FACTURA       int,
   CODIGO_DOCUMENTO     varchar(20),
   TIPO_NOTA            varchar(16),
   FECHA                date,
   CANTIDAD             numeric(8,2),
   DESCRIPCION          varchar(512),
   primary key (CODIGO_DEBITO_CREDITO)
);

/*==============================================================*/
/* Table: PERIODO_CONTABLE                                      */
/*==============================================================*/
create table PERIODO_CONTABLE
(
   CODIGO_PERIDO        int not null,
   FECHA_INICIO         datetime,
   FECHA_FIN            datetime,
   ESTADO               varchar(12),
   DESCRIPCION          varchar(256),
   TOTAL_VENTAS         decimal(10,2),
   TOTAL_COMPRAS        decimal(10,2),
   primary key (CODIGO_PERIDO)
);

/*==============================================================*/
/* Table: PRODUCTO_GENERAL_COMPRA                               */
/*==============================================================*/
create table PRODUCTO_GENERAL_COMPRA
(
   CODIGO_GENERADO      int not null,
   CODIGO_COMPRA        int,
   CODIGO_PRODUCTO      varchar(64),
   CANTIDAD             int,
   COSTO_INDIVIDUAL     numeric(8,2),
   CANTIDAD_MAL_ESTADO  int,
   CANTIDAD__CADUCADA   int,
   primary key (CODIGO_GENERADO)
);

/*==============================================================*/
/* Table: PRODUCTO_GENERAL_VENTA                                */
/*==============================================================*/
create table PRODUCTO_GENERAL_VENTA
(
   CODIGO_PRODUCTO      varchar(64) not null,
   CODIGO_RESERVA_PROD_GENERAL int,
   CANTIDAD_DISPONIBLE  int,
   CANTIDAD_BAJA        int,
   CANTIDAD_ROBADO      int,
   CANTIDAD_VENDIDA     int,
   CANTIDAD_CADUCADA    int,
   LIMITE_MINIMO        int,
   primary key (CODIGO_PRODUCTO)
);

/*==============================================================*/
/* Table: PRODUCTO_INDIVIDUAL_COMPRA                            */
/*==============================================================*/
create table PRODUCTO_INDIVIDUAL_COMPRA
(
   CODIGO_UNICO         varchar(64) not null,
   CODIGO_COMPRA        int,
   CODIGO_PRODUCTO      varchar(64),
   COSTO                decimal(8,2),
   ESTADO_FISICO        varchar(16),
   ESTADO_PROCESO       varchar(16),
   UBICACION            varchar(16),
   RESERVADO_TEMPORAL_COMPRA bool,
   FECHA_RESERVA_TEMPORAL datetime,
   primary key (CODIGO_UNICO)
);

/*==============================================================*/
/* Table: RESERVA_PRODUCTO_GENERAL                              */
/*==============================================================*/
create table RESERVA_PRODUCTO_GENERAL
(
   CODIGO_RESERVA_PROD_GENERAL int not null,
   CANTIDAD             int,
   FECHA_RESERVA        datetime,
   primary key (CODIGO_RESERVA_PROD_GENERAL)
);

/*==============================================================*/
/* Table: SERVICIOS                                             */
/*==============================================================*/
create table SERVICIOS
(
   CODIGO_SERVICIO      int not null,
   NOMBRE               varchar(64),
   DESCRIPCION          varchar(512),
   COSTO                decimal(8,2),
   primary key (CODIGO_SERVICIO)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO
(
   NICK                 varchar(64) not null,
   CLAVE                varchar(128),
   TIPO                 varchar(16),
   primary key (NICK)
);

/*==============================================================*/
/* Table: VENTA                                                 */
/*==============================================================*/
create table VENTA
(
   CODIGO_FACTURA       int not null,
   NICK                 varchar(64),
   CODIGO_PERIDO        int,
   CEDULA_RUC           varchar(20),
   FECHA                datetime,
   TOTAL                decimal(8,2),
   ESTADO               varchar(16),
   TIPO_DOCUMENTO       varchar(16),
   TIPO_PAGO            varchar(16),
   TIPO_VENTA           varchar(16),
   DESCUENTO            int,
   INCREMENTO           int,
   primary key (CODIGO_FACTURA)
);

alter table ABONO_VENTA_CREDITO add constraint FK_REFERENCE_23 foreign key (CODIGO_FACTURA_CREDITO)
      references CREDITO_FACTURA (CODIGO_FACTURA_CREDITO) on delete restrict on update restrict;

alter table CATALAGO_PRODUCTO add constraint FK_REFERENCE_6 foreign key (CAT_NOMBRE)
      references CATEGORIA_PRODUCTO (NOMBRE) on delete restrict on update restrict;

alter table COMPRA add constraint FK_REFERENCE_18 foreign key (RUC)
      references DISTRIBUIDOR (RUC) on delete restrict on update restrict;

alter table COMPRA add constraint FK_REFERENCE_21 foreign key (CODIGO_PERIDO)
      references PERIODO_CONTABLE (CODIGO_PERIDO) on delete restrict on update restrict;

alter table COMPRA add constraint FK_REFERENCE_5 foreign key (NICK)
      references USUARIO (NICK) on delete restrict on update restrict;

alter table CREDITO_FACTURA add constraint FK_REFERENCE_20 foreign key (CODIGO_FACTURA)
      references VENTA (CODIGO_FACTURA) on delete restrict on update restrict;

alter table DETALLES_SERVICIO add constraint FK_REFERENCE_24 foreign key (CODIGO_FACTURA)
      references VENTA (CODIGO_FACTURA) on delete restrict on update restrict;

alter table DETALLES_SERVICIO add constraint FK_REFERENCE_25 foreign key (CODIGO_SERVICIO)
      references SERVICIOS (CODIGO_SERVICIO) on delete restrict on update restrict;

alter table DETALLE_PRODUCTO_GENERAL add constraint FK_REFERENCE_13 foreign key (CODIGO_FACTURA)
      references VENTA (CODIGO_FACTURA) on delete restrict on update restrict;

alter table DETALLE_PRODUCTO_GENERAL add constraint FK_REFERENCE_14 foreign key (CODIGO_PRODUCTO)
      references CATALAGO_PRODUCTO (CODIGO_PRODUCTO) on delete restrict on update restrict;

alter table DETALLE_PRODUCTO_INDIVIDUAL add constraint FK_REFERENCE_12 foreign key (CODIGO_UNICO)
      references PRODUCTO_INDIVIDUAL_COMPRA (CODIGO_UNICO) on delete restrict on update restrict;

alter table DETALLE_PRODUCTO_INDIVIDUAL add constraint FK_REFERENCE_16 foreign key (CODIGO_FACTURA)
      references VENTA (CODIGO_FACTURA) on delete restrict on update restrict;

alter table NOTA_CREDITO_DEBITO add constraint FK_REFERENCE_19 foreign key (CODIGO_FACTURA)
      references VENTA (CODIGO_FACTURA) on delete restrict on update restrict;

alter table PRODUCTO_GENERAL_COMPRA add constraint FK_REFERENCE_1 foreign key (CODIGO_COMPRA)
      references COMPRA (CODIGO_COMPRA) on delete restrict on update restrict;

alter table PRODUCTO_GENERAL_COMPRA add constraint FK_REFERENCE_2 foreign key (CODIGO_PRODUCTO)
      references CATALAGO_PRODUCTO (CODIGO_PRODUCTO) on delete restrict on update restrict;

alter table PRODUCTO_GENERAL_VENTA add constraint FK_REFERENCE_10 foreign key (CODIGO_PRODUCTO)
      references CATALAGO_PRODUCTO (CODIGO_PRODUCTO) on delete restrict on update restrict;

alter table PRODUCTO_GENERAL_VENTA add constraint FK_REFERENCE_11 foreign key (CODIGO_RESERVA_PROD_GENERAL)
      references RESERVA_PRODUCTO_GENERAL (CODIGO_RESERVA_PROD_GENERAL) on delete restrict on update restrict;

alter table PRODUCTO_INDIVIDUAL_COMPRA add constraint FK_REFERENCE_3 foreign key (CODIGO_COMPRA)
      references COMPRA (CODIGO_COMPRA) on delete restrict on update restrict;

alter table PRODUCTO_INDIVIDUAL_COMPRA add constraint FK_REFERENCE_4 foreign key (CODIGO_PRODUCTO)
      references CATALAGO_PRODUCTO (CODIGO_PRODUCTO) on delete restrict on update restrict;

alter table VENTA add constraint FK_REFERENCE_17 foreign key (NICK)
      references USUARIO (NICK) on delete restrict on update restrict;

alter table VENTA add constraint FK_REFERENCE_22 foreign key (CODIGO_PERIDO)
      references PERIODO_CONTABLE (CODIGO_PERIDO) on delete restrict on update restrict;

alter table VENTA add constraint FK_REFERENCE_26 foreign key (CEDULA_RUC)
      references CLIENTE (CEDULA_RUC) on delete restrict on update restrict;

