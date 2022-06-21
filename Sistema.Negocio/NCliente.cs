using System.Data;
using Sistema.Datos;
using Sistema.Entidades;

namespace Sistema.Negocio
{
    public class NCliente
    {
        public static DataTable Listar()
        {
            DCliente Datos = new DCliente();
            return Datos.Listar();
        }

        public static DataTable ListarClientes()
        {
            DCliente Datos = new DCliente();
            return Datos.ListarClientes();
        }

        public static DataTable Buscar(string Valor)
        {
            DCliente Datos = new DCliente();
            return Datos.Buscar(Valor);
        }
 
        public static DataTable BuscarClientes(string Valor)
        {
            DCliente Datos = new DCliente();
            return Datos.BuscarClientes(Valor);
        }
        public static string Insertar(string TipoPersona, string Nombre, string TipoDocumento, string NumDocumento, string Direccion, string Telefono, string Email)
        {
            DCliente Datos = new DCliente();

            string Existe = Datos.Existe(Nombre);
            if (Existe.Equals("1"))
            {
                return "La persona ya existe.";
            }
            else
            {
                Cliente Obj = new Cliente();
                Obj.Nombre = Nombre;
                Obj.TipoDocumento = TipoDocumento;
                Obj.NumDocumento = NumDocumento;
                Obj.Direccion = Direccion;
                Obj.Telefono = Telefono;
                Obj.Email = Email;
                return Datos.Insertar(Obj);
            }
        }

        public static string Actualizar(int Id, string TipoPersona, string NombreAnt, string Nombre, string TipoDocumento, string NumDocumento, string Direccion, string Telefono, string Email)
        {
            DCliente Datos = new DCliente();
            Cliente Obj = new Cliente();

            if (NombreAnt.Equals(Nombre))
            {
                Obj.IdCliente = Id;
                Obj.Nombre = Nombre;
                Obj.TipoDocumento = TipoDocumento;
                Obj.NumDocumento = NumDocumento;
                Obj.Direccion = Direccion;
                Obj.Telefono = Telefono;
                Obj.Email = Email;
                return Datos.Actualizar(Obj);
            }
            else
            {
                string Existe = Datos.Existe(Nombre);
                if (Existe.Equals("1"))
                {
                    return "Un Cliente con ese nombre ya existe.";
                }
                else
                {
                    Obj.IdCliente = Id;
                    Obj.Nombre = Nombre;
                    Obj.TipoDocumento = TipoDocumento;
                    Obj.NumDocumento = NumDocumento;
                    Obj.Direccion = Direccion;
                    Obj.Telefono = Telefono;
                    Obj.Email = Email;
                    return Datos.Actualizar(Obj);
                }
            }

        }

        public static string Eliminar(int Id)
        {
            DCliente Datos = new DCliente();
            return Datos.Eliminar(Id);
        }
    }
}
