--Procedimiento Listar

create proc articulo_listar
as
select a.idArticulo as ID,a.idDepartamento,c.nombre as Departamento,
a.codigo as Codigo,a.nombre as Nombre,a.precio_venta as Precio_Venta,
a.stock as Stock,a.descripcion as Descripcion,a.imagen as Imagen, a.color as Color, a.talla as Talla,
a.estado as Estado
from articulo a inner join departamento_venta c on a.idDepartamento = c.idDepartamento
order by a.idArticulo desc
go

--Procedimiento Buscar
create proc articulo_buscar
@valor varchar(50)
as
select a.idarticulo as ID,a.idDepartamento,c.nombre as Categoria,
a.codigo as Codigo,a.nombre as Nombre,a.precio_venta as Precio_Venta,
a.stock as Stock,a.descripcion as Descripcion,a.imagen as Imagen, a.color as Color, a.talla as Talla,
a.estado as Estado
from articulo a inner join departamento_venta c on a.idDepartamento=c.idDepartamento
where a.nombre like '%' +@valor + '%' Or a.descripcion like '%' +@valor + '%'
order by a.nombre asc
go


--Procedimiento Insertar
create proc articulo_insertar
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
go


--Procedimiento Actualizar
create proc articulo_actualizar
@idDepartamento integer,
@idcategoria integer,
@codigo varchar(50),
@nombre varchar(50),
@precio_venta decimal(11,2),
@stock integer,
@descripcion varchar(255),
@imagen varchar(20),
@talla varchar(20),
@color varchar(20)
as
update articulo set idDepartamento=@idDepartamento,codigo=@codigo,
nombre=@nombre,precio_venta=@precio_venta,stock=@stock,
descripcion=@descripcion,imagen=@imagen,color=@color,talla=@talla
where idarticulo=@idDepartamento
go

--Procedimiento Eliminar
create proc articulo_eliminar
@idDepartamento integer
as
delete from articulo
where idDepartamento=@idDepartamento
go

--Procedimiento Desactivar
create proc articulo_desactivar
@idDepartamento integer
as
update articulo set estado=0
where idDepartamento=@idDepartamento
go

--Procedimiento Activar
create proc articulo_activar
@idDepartamento integer
as
update articulo set estado=1
where idDepartamento=@idDepartamento
go
-- Procedimiento existe
create proc articulo_existe
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
go





