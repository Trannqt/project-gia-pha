using Action;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VietNamGiaPha.Controllers
{
    public class RootPersonController : CommandBaseController
    {
        [HttpPost]
        public ActionResult RootPersonTreeExecuteSearch(RootPersonTreeExecuteSearchAction commandAction)
        {
            var res = commandAction.Execute();
            return JsonExpando(res);
        }

        [HttpPost]
        public ActionResult RootPersonTreeList(RootPersonTreeListAction commandAction)
        {
            var res = commandAction.Execute();
            return JsonExpando(res);
        }
    }
}