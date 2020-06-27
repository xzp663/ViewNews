using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ViewNews.Models;

namespace ViewNews.Controllers.ViewNewsKeHu
{
    public class NewsVNKHController : Controller
    {
        ViewNewsEntities db = new ViewNewsEntities();
        // GET: NewsVNKH
        public ActionResult Index()
        {

            return View();
        }
    }
}