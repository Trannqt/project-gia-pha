using Action;
using ConnectDb;
using Microsoft.AspNetCore.Mvc;

namespace QLGP.Controllers
{
    public class PostController : CommandBaseController
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IDbConnect conn;
        public PostController(ILogger<HomeController> logger, IDbConnect connect)
        {
            _logger = logger;
            conn = connect;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult getPostList(PostListAction commandAction)
        {
            var res = commandAction.ExecuteQuery(conn);
            return JsonExpando(res);
        }

        public IActionResult Detail()
        {
            return View();
        }

        [HttpPost]
        public IActionResult getPostDetailById(PostInputAction commandAction)
        {
            //BranchInputAction commandAction = new BranchInputAction();
            //if (id != null)
            //    commandAction.Id = id;
            var res = commandAction.ExecuteQuery(conn);
            return JsonExpando(res);
        }

        //[HttpGet]
        //public IActionResult Detail(int? id)
        //{
        //    BranchInputAction commandAction = new BranchInputAction();
        //    if (id != null)
        //        commandAction.Id = id;
        //    var res = commandAction.ExecuteQuery(conn);
        //    HttpContext.Session.Remove("TocHo");
        //    string tmp = res[0][0].Name.ToString();
        //    HttpContext.Session.SetString("TocHo", tmp);
        //    return View();
        //}

        //[HttpPost]
        //public IActionResult getPostDetailById(PostInputAction commandAction)
        //{
        //    var res = commandAction.ExecuteQuery(conn);

        //    return JsonExpando(res);
        //}
    }
}
