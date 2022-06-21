namespace Sistema.Entidades
{
    public class Articulo
    {
        public int IdArticulo { get; set; }
        public int IdDepartamento { get; set; }
        public string Codigo { get; set; }
        public string Nombre { get; set; }
        public decimal PrecioVenta { get; set; }
        public int Stock { get; set; }
        public string Descripcion { get; set; }
        public string Imagen { get; set; }
        public string Talla { get; set; }
        public string Color { get; set; }
        public bool Estado { get; set; }
    }
}
