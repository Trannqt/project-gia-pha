using Action;
using ConnectDb;
using Dapper;
using Domain;
using Microsoft.AspNetCore.Mvc;

namespace QLGP.Controllers
{
    public class ReasonExistsController : CommandBaseController
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IDbConnect conn;
        public ReasonExistsController(ILogger<HomeController> logger, IDbConnect connect)
        {
            _logger = logger;
            conn = connect; 
        }
        public IActionResult Index()
        {
            HttpContext.Session.SetString("TocHo", "");
            return View();
        }

        public IActionResult init(ReasonExistsListAction commandAction) {
            var res = commandAction.ExecuteQuery(conn);
            return JsonExpando(res);
        }
    }
}
