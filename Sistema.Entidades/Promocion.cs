using System;
using System.Data;

namespace Sistema.Entidades
{
    public class Promocion
    {
        public int IdPromocion { get; set; }
        public string Nombre { get; set; }
        public decimal Valor { get; set; }
        public string Descripcion { get; set; }
        public decimal Porcentaje { get; set; }
        public bool Estado { get; set; }
        public DateTime Fecha { get; set; }

    }
}
