using Action;
using ConnectDb;
using Microsoft.AspNetCore.Mvc;

namespace QLGP.Controllers
{
    public class ThanhVienController : CommandBaseController
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IDbConnect conn;
        public ThanhVienController(ILogger<HomeController> logger, IDbConnect connect)
        {
            _logger = logger;
            conn = connect;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult getThanhVienDetailById(ThanhVienInputAction commandAction)
        {
            var res = commandAction.ExecuteQuery(conn);
            return JsonExpando(res);
        }
        //public IActionResult init(LyDoTonTaiListAction commandAction)
        //{
        //    var res = commandAction.ExecuteQuery(conn);
        //    return JsonExpando(res);
        //}
    }
}
