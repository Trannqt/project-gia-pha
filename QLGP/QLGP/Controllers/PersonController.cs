using Action;
using ConnectDb;
using Microsoft.AspNetCore.Mvc;

namespace QLGP.Controllers
{
    public class PersonController : CommandBaseController
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IDbConnect conn;
        public PersonController(ILogger<HomeController> logger, IDbConnect connect)
        {
            _logger = logger;
            conn = connect;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult getPersonDetailById(PersonInputAction commandAction)
        {
            var res = commandAction.ExecuteQuery(conn);
            return JsonExpando(res);
        }

        public IActionResult BranchSource()
        {
            return View();
        }

        [HttpPost]
        public IActionResult BranchSource(BranchSourceInputAction commandAction)
        {
            var res = commandAction.ExecuteQuery(conn);
            return JsonExpando(res);
        }
    }
}
