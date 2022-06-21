using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Sistema.Datos;
using Sistema.Entidades;

namespace Sistema.Negocio
{
    public class NDepartamento
    {
        public static DataTable Listar()
        {
            DDepartamento Datos = new DDepartamento();
            return Datos.Listar();
        }

        public static DataTable Buscar(string Valor)
        {
            DDepartamento Datos = new DDepartamento();
            return Datos.Buscar(Valor);
        }

        public static DataTable Seleccionar()
        {
            DDepartamento Datos = new DDepartamento();
            return Datos.Seleccionar();
        }

        public static string Insertar(string Nombre, string Descripcion)
        {
            DDepartamento Datos = new DDepartamento();

            string Existe = Datos.Existe(Nombre);
            if (Existe.Equals("1"))
            {
                return "El departamento ya existe";
            }
            else
            {
                DepartamentoVenta Obj = new DepartamentoVenta();
                Obj.Nombre = Nombre;
                Obj.Descripcion = Descripcion;
                return Datos.Insertar(Obj);
            }
        }

        public static string Actualizar(int Id, string NombreAnt, string Nombre, string Descripcion)
        {
            DDepartamento Datos = new DDepartamento();
            DepartamentoVenta Obj = new DepartamentoVenta();

            if (NombreAnt.Equals(Nombre))
            {
                Obj.IdDepartamento = Id;
                Obj.Nombre = Nombre;
                Obj.Descripcion = Descripcion;
                return Datos.Actualizar(Obj);
            }
            else
            {
                string Existe = Datos.Existe(Nombre);
                if (Existe.Equals("1"))
                {
                    return "El departamento ya existe";
                }
                else
                {
                    Obj.IdDepartamento = Id;
                    Obj.Nombre = Nombre;
                    Obj.Descripcion = Descripcion;
                    return Datos.Actualizar(Obj);
                }
            }

        }

        public static string Eliminar(int Id)
        {
            DDepartamento Datos = new DDepartamento();
            return Datos.Eliminar(Id);
        }

        public static string Activar(int Id)
        {
            DDepartamento Datos = new DDepartamento();
            return Datos.Activar(Id);
        }

        public static string Desactivar(int Id)
        {
            DDepartamento Datos = new DDepartamento();
            return Datos.Desactivar(Id);
        }
    }
}

