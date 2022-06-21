--Procedimiento Listar
create proc Cliente_listar
as
select u.idCliente as ID,u.nombre as Nombre,
u.tipo_documento as Tipo_Documento,u.num_documento as Num_Documento,
u.direccion as Direccion,u.telefono as Telefono,u.email as Email
 from cliente as u 
 order by u.idCliente desc
 go

--Procedimiento Buscar
create proc Cliente_buscar
@valor varchar(50)
as
select u.idCliente as ID,u.nombre as Nombre,
u.tipo_documento as Tipo_Documento,u.num_documento as Num_Documento,
u.direccion as Direccion,u.telefono as Telefono,u.email as Email
 from cliente u 
 where u.nombre like '%' +@valor + '%' Or u.email like '%' +@valor + '%'
 order by u.nombre asc
 go

--Procedimiento Insertar
create proc Cliente_insertar
@nombre varchar(100),
@tipo_documento varchar(20),
@num_documento varchar(20),
@direccion varchar(70),
@telefono varchar(20),
@email varchar(50)
as
insert into cliente (nombre,tipo_documento,num_documento,direccion,telefono,email)
values (@nombre,@tipo_documento,@num_documento,@direccion,@telefono,@email)
go

--Procedimiento Actualizar
create proc Cliente_actualizar
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
go
--Procedimiento Eliminar
create proc Cliente_eliminar
@idCliente integer
as
delete from cliente
where idCliente=@idCliente
go


-- Procedimiento existe
create proc Cliente_existe
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

