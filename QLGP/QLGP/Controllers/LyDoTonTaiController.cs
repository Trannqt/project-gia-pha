using Action;
using ConnectDb;
using Dapper;
using Domain;
using Microsoft.AspNetCore.Mvc;

namespace QLGP.Controllers
{
    public class LyDoTonTaiController : CommandBaseController
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IDbConnect conn;
        public LyDoTonTaiController(ILogger<HomeController> logger, IDbConnect connect)
        {
            _logger = logger;
            conn = connect; 
        }
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult init(LyDoTonTaiListAction commandAction) {
            var res = commandAction.ExecuteQuery(conn);
            return JsonExpando(res);
        }
    }
}
