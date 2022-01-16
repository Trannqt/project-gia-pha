﻿using Action;
using ConnectDb;
using Microsoft.AspNetCore.Mvc;

namespace QLGP.Controllers
{
    public class TocHoController : CommandBaseController
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IDbConnect conn;
        public TocHoController(ILogger<HomeController> logger, IDbConnect connect)
        {
            _logger = logger;
            conn = connect;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult getListTocHo(TocHoListAction commandAction)
        {
            var res = commandAction.ExecuteQuery(conn);
            return JsonExpando(res);
        }

        [HttpGet]
        public IActionResult Detail(int? id)
        {
            return View();
        }

        [HttpPost]
        public IActionResult getTocHoDetailById(TocHoInputAction commandAction)
        {
            var res = commandAction.ExecuteQuery(conn);
            return JsonExpando(res);
        }

        public IActionResult ThanhVien(int? id)
        {
            return View();
        }
    }
}
