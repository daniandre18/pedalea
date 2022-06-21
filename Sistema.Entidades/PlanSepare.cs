namespace Sistema.Entidades
{
    public  class PlanSepare
    {
        public int IdPlan { get; set; }
        public int IdPedido { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public decimal ValorMinimo { get; set; }
        public int NumCuotas { get; set; }
    }
}
