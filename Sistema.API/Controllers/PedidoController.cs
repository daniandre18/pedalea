using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Sistema.Negocio;
using Sistema.Datos;
using System.Data;
using Newtonsoft.Json;

namespace Sistema.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PedidoController : ControllerBase
    {
   
        [HttpGet]
        public string Pedidos()
        {

            string pedidos = JsonConvert.SerializeObject(NArticulo.Listar(), Formatting.Indented);
            return pedidos;
        }

        [Route("controller/buscar/{pedidoId}/")]
        [HttpGet]
        public string GetPedidosByID ( string Id)
        {
 
            string pedidos = JsonConvert.SerializeObject(NArticulo.BuscarVenta(Id), Formatting.Indented);
            return pedidos;
        }

        [Route("controller/eliminar/{pedidoId}/")]
        [HttpGet]
        public string DeletePedidosByID(int Id)
        {

            string status = NArticulo.Eliminar(Id);
            return status;
        }



        [Route("controller/editar/{pedidoId}/")]
        [HttpGet]
        public string EditPedidosByID(int Id, int IdDepartamento, string Codigo, string NombreAnt, string Nombre, decimal PrecioVenta, int Stock, string Descripcion, string Imagen)
        {

            string status = NArticulo.Actualizar(Id, IdDepartamento,Codigo,NombreAnt, Nombre, PrecioVenta, Stock, Descripcion, Imagen);
           
            return status;
        }



    }
}
