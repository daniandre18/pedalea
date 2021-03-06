USE [dbSistema]
GO
/****** Object:  Table [dbo].[articulo]    Script Date: 21/06/2022 4:21:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[articulo](
	[idArticulo] [int] IDENTITY(1,1) NOT NULL,
	[idDepartamento] [int] NOT NULL,
	[codigo] [varchar](50) NULL,
	[nombre] [varchar](100) NOT NULL,
	[precio_venta] [decimal](11, 2) NOT NULL,
	[stock] [int] NOT NULL,
	[descripcion] [varchar](255) NULL,
	[imagen] [varchar](50) NULL,
	[estado] [bit] NULL,
	[talla] [varchar](10) NOT NULL,
	[color] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[articulo_pedido]    Script Date: 21/06/2022 4:21:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[articulo_pedido](
	[idArticulo_pedido] [int] IDENTITY(1,1) NOT NULL,
	[idPedido] [int] NOT NULL,
	[idArticulo] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio_venta] [decimal](11, 2) NOT NULL,
	[descuento] [decimal](11, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idArticulo_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 21/06/2022 4:21:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellidos] [varchar](100) NOT NULL,
	[tipo_documento] [varchar](20) NULL,
	[num_documento] [varchar](20) NULL,
	[email] [varchar](50) NOT NULL,
	[direccion] [varchar](70) NULL,
	[telefono] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departamento_venta]    Script Date: 21/06/2022 4:21:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departamento_venta](
	[idDepartamento] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[descripcion] [varchar](255) NULL,
	[estado] [bit] NULL,
	[codigo] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pedido]    Script Date: 21/06/2022 4:21:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pedido](
	[idPedido] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[direccion_envio] [varchar](100) NOT NULL,
	[descripcion] [varchar](255) NULL,
	[total] [decimal](11, 2) NOT NULL,
	[descuento] [decimal](11, 2) NULL,
	[fecha] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[plan_separe]    Script Date: 21/06/2022 4:21:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plan_separe](
	[idPlan] [int] IDENTITY(1,1) NOT NULL,
	[idPedido] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [varchar](255) NULL,
	[valor_minimo] [int] NOT NULL,
	[num_cuotas] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPlan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promocion]    Script Date: 21/06/2022 4:21:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promocion](
	[idPromocion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[valor] [decimal](11, 2) NOT NULL,
	[descripcion] [varchar](255) NULL,
	[porcentaje] [decimal](9, 2) NULL,
	[estado] [bit] NULL,
	[fecha] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPromocion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[articulo] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[departamento_venta] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[promocion] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[departamento_venta] ([idDepartamento])
GO
ALTER TABLE [dbo].[articulo_pedido]  WITH CHECK ADD FOREIGN KEY([idArticulo])
REFERENCES [dbo].[articulo] ([idArticulo])
GO
ALTER TABLE [dbo].[articulo_pedido]  WITH CHECK ADD FOREIGN KEY([idPedido])
REFERENCES [dbo].[pedido] ([idPedido])
GO
ALTER TABLE [dbo].[pedido]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[cliente] ([idCliente])
GO
ALTER TABLE [dbo].[plan_separe]  WITH CHECK ADD FOREIGN KEY([idPedido])
REFERENCES [dbo].[pedido] ([idPedido])
GO
/****** Object:  StoredProcedure [dbo].[articulo_activar]    Script Date: 21/06/2022 4:21:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento Activar
create proc [dbo].[articulo_activar]
@idDepartamento integer
as
update articulo set estado=1
where idDepartamento=@idDepartamento
GO
/****** Object:  StoredProcedure [dbo].[articulo_buscar]    Script Date: 21/06/2022 4:21:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[articulo_buscar]
@valor varchar(50)
as
select a.idarticulo as ID,a.idDepartamento,c.nombre as Categoria,
a.codigo as Codigo,a.nombre as Nombre,a.precio_venta as Precio_Venta,
a.stock as Stock,a.descripcion as Descripcion,a.imagen as Imagen, a.color as Color, a.talla as Talla,
a.estado as Estado
from articulo a inner join departamento_venta c on a.idDepartamento=c.idDepartamento
where a.nombre like '%' +@valor + '%' Or a.descripcion like '%' +@valor + '%'
order by a.nombre asc
GO
/****** Object:  StoredProcedure [dbo].[articulo_desactivar]    Script Date: 21/06/2022 4:21:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento Desactivar
create proc [dbo].[articulo_desactivar]
@idDepartamento integer
as
update articulo set estado=0
where idDepartamento=@idDepartamento
GO
/****** Object:  StoredProcedure [dbo].[articulo_eliminar]    Script Date: 21/06/2022 4:21:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento Eliminar
create proc [dbo].[articulo_eliminar]
@idDepartamento integer
as
delete from articulo
where idDepartamento=@idDepartamento
GO
/****** Object:  StoredProcedure [dbo].[articulo_existe]    Script Date: 21/06/2022 4:21:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Procedimiento existe
create proc [dbo].[articulo_existe]
@valor varchar(100),
@existe bit output
as
if exists (select nombre from articulo where nombre = ltrim(rtrim(@valor)))
	begin
		set @existe=1
	end
else
	begin
		set @existe=0
	end
GO
/****** Object:  StoredProcedure [dbo].[articulo_insertar]    Script Date: 21/06/2022 4:21:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento Insertar
create proc [dbo].[articulo_insertar]
@idDepartamento integer,
@codigo varchar(50),
@nombre varchar(100),
@precio_venta decimal(11,2),
@stock integer,
@descripcion varchar(255),
@imagen varchar(20),
@talla varchar(20),
@color varchar(20)
as
insert into articulo (idDepartamento,codigo,nombre,precio_venta,stock,descripcion,imagen)
values (@idDepartamento,@codigo,@nombre,@precio_venta,@stock,@descripcion,@imagen)
GO
/****** Object:  StoredProcedure [dbo].[articulo_listar]    Script Date: 21/06/2022 4:21:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[articulo_listar]
as
select a.idArticulo as ID,a.idDepartamento,c.nombre as Departamento,
a.codigo as Codigo,a.nombre as Nombre,a.precio_venta as Precio_Venta,
a.stock as Stock,a.descripcion as Descripcion,a.imagen as Imagen, a.color as Color, a.talla as Talla,
a.estado as Estado
from articulo a inner join departamento_venta c on a.idDepartamento = c.idDepartamento
order by a.idArticulo desc
GO
/****** Object:  StoredProcedure [dbo].[Cliente_actualizar]    Script Date: 21/06/2022 4:21:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento Actualizar
create proc [dbo].[Cliente_actualizar]
@idCliente integer,
@nombre varchar(100),
@tipo_documento varchar(20),
@num_documento varchar(20),
@direccion varchar(70),
@telefono varchar(20),
@email varchar(50),
@clave varchar(50)
as
if @clave<>''
update cliente set nombre=@nombre,tipo_documento=@tipo_documento,
num_documento=@num_documento,direccion=@direccion,telefono=@telefono,
email=@email
where idCliente=@idCliente;
else
update cliente set nombre=@nombre,tipo_documento=@tipo_documento,
num_documento=@num_documento,direccion=@direccion,telefono=@telefono,
email=@email
where idCliente=@idCliente;
GO
/****** Object:  StoredProcedure [dbo].[Cliente_buscar]    Script Date: 21/06/2022 4:21:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento Buscar
create proc [dbo].[Cliente_buscar]
@valor varchar(50)
as
select u.idCliente as ID,u.nombre as Nombre,
u.tipo_documento as Tipo_Documento,u.num_documento as Num_Documento,
u.direccion as Direccion,u.telefono as Telefono,u.email as Email
 from cliente u 
 where u.nombre like '%' +@valor + '%' Or u.email like '%' +@valor + '%'
 order by u.nombre asc
GO
/****** Object:  StoredProcedure [dbo].[Cliente_eliminar]    Script Date: 21/06/2022 4:21:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento Eliminar
create proc [dbo].[Cliente_eliminar]
@idCliente integer
as
delete from cliente
where idCliente=@idCliente
GO
/****** Object:  StoredProcedure [dbo].[Cliente_existe]    Script Date: 21/06/2022 4:21:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Procedimiento existe
create proc [dbo].[Cliente_existe]
@valor varchar(100),
@existe bit output
as
	if exists (select email from cliente where email = ltrim(rtrim(@valor)))
		begin
		 set @existe=1
		end
	else
		begin
		 set @existe=0
		end
GO
/****** Object:  StoredProcedure [dbo].[Cliente_insertar]    Script Date: 21/06/2022 4:21:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento Insertar
create proc [dbo].[Cliente_insertar]
@nombre varchar(100),
@tipo_documento varchar(20),
@num_documento varchar(20),
@direccion varchar(70),
@telefono varchar(20),
@email varchar(50)
as
insert into cliente (nombre,tipo_documento,num_documento,direccion,telefono,email)
values (@nombre,@tipo_documento,@num_documento,@direccion,@telefono,@email)
GO
/****** Object:  StoredProcedure [dbo].[Cliente_listar]    Script Date: 21/06/2022 4:21:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento Listar
create proc [dbo].[Cliente_listar]
as
select u.idCliente as ID,u.nombre as Nombre,
u.tipo_documento as Tipo_Documento,u.num_documento as Num_Documento,
u.direccion as Direccion,u.telefono as Telefono,u.email as Email
 from cliente as u 
 order by u.idCliente desc
GO
/****** Object:  StoredProcedure [dbo].[departamento_actualizar]    Script Date: 21/06/2022 4:21:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   create proc  [dbo].[departamento_actualizar]
   @idDepartamento int,
   @nombre varchar(50),
   @descripcion varchar(255),
   @codigo varchar(50)
   as
   update  departamento_venta set nombre =  @nombre ,descripcion =  @descripcion ,codigo = @codigo
   where idDepartamento = @idDepartamento
GO
/****** Object:  StoredProcedure [dbo].[departamento_Buscar]    Script Date: 21/06/2022 4:21:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[departamento_Buscar]
   @valor varchar(50)
   as
   select idDepartamento as ID, nombre AS Nombre,descripcion as Descripcion, codigo as Codigo,estado as Estado
   from departamento_venta
   where nombre like '%' + @valor + '%' or descripcion like '%' + @valor + '%'
   order by nombre asc
GO
/****** Object:  StoredProcedure [dbo].[departamento_eliminar]    Script Date: 21/06/2022 4:21:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   create proc  [dbo].[departamento_eliminar]
   @idDepartamento int
   as
   delete from departamento_venta 
   where idDepartamento = @idDepartamento
GO
/****** Object:  StoredProcedure [dbo].[departamento_insertar]    Script Date: 21/06/2022 4:21:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc  [dbo].[departamento_insertar]
   @nombre varchar(50),
   @descripcion varchar(255),
   @codigo varchar(50)
   as
   insert into departamento_venta (nombre,descripcion,codigo) values (@nombre,@descripcion,@codigo)
GO
/****** Object:  StoredProcedure [dbo].[departamento_listar]    Script Date: 21/06/2022 4:21:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[departamento_listar]
   as
   select idDepartamento as ID, nombre AS Nombre,descripcion as Descripcion, codigo as Codigo,estado as Estado
   from departamento_venta
   order by idDepartamento desc
GO
/****** Object:  StoredProcedure [dbo].[departamento_venta_listar]    Script Date: 21/06/2022 4:21:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   create proc [dbo].[departamento_venta_listar]
   as
   select idDepartamento as ID, nombre AS Nombre,descripcion as Descripcion, codigo as Codigo,estado as Estado
   from departamento_venta
   order by idDepartamento desc
GO
