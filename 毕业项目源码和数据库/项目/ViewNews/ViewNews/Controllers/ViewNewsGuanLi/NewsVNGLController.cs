using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ViewNews.Controllers.ViewNewsGuanLi
{
    public class NewsVNGLController : Controller
    {
        // GET: NewsVNGL
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult NewsAdd()
        {
            return View();
        }
}
}