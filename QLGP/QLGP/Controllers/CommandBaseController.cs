using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace QLGP.Controllers
{
    public class CommandBaseController : Controller
    {
        protected static Object Success(List<dynamic> data, string message = null)
        {
            return new
            {
                Data = data,
                IsSuccess = true,
                Message = message ?? "success"
            };
        }
        protected ActionResult JsonExpando(object obj)
        {
            return Content(JsonConvert.SerializeObject(obj), "application/json");
        }

        protected dynamic Success(bool b, string Mes = "Thành công!")
        {
            return new
            {
                IsSuccess = b,
                Message = Mes
            };
        }
    }
}
