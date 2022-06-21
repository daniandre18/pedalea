using System;
namespace Sistema.Entidades
{
    public  class Pedido
    {
        public int IdPedido { get; set; }
        public int IdCliente { get; set; }
        public string Cantidad { get; set; }
        public string DireccionEnvio { get; set; }
        public string Descripcion { get; set; }
        public string Total { get; set; }
        public string Descuento { get; set; }
        public DateTime Fecha { get; set; }
    }
}
