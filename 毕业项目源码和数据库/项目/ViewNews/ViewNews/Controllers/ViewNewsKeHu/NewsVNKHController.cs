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
            ViewBag.newss = db.News.OrderByDescending(a=>a.NewsTime).ToList();
            return View();
        }

        [HttpPost]
        public ActionResult Index(string Title = "")
        {
            ViewBag.newss = db.News.OrderByDescending(p => p.NewsTime)
               .Where(p => Title == "" || p.NewsTitle.Contains(Title))
               .ToList();
            ViewBag.name = Title;
            return View();
        }

        public ActionResult NewsWenZhang(int? Newsid)
        {
            ViewBag.newsS = db.News.Find(Newsid);
            return View();
        }
    }
}