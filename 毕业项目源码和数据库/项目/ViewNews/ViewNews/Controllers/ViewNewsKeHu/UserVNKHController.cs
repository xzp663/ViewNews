using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ViewNews.Models;

namespace ViewNews.Controllers.ViewNewsKeHu
{
    public class UserVNKHController : Controller
    {
        ViewNewsEntities db = new ViewNewsEntities();
        // GET: UserVNKH
        public ActionResult Index()
        {
            ViewBag.userEss = db.EssayCommun.OrderByDescending(a => a.ECTime).ToList();
            return View();
        }
        [HttpPost]
        public ActionResult Index(string Title = "")
        {
            ViewBag.userEss = db.EssayCommun.OrderByDescending(p => p.ECTime)
               .Where(p => Title == "" || p.ECTitle.Contains(Title))
               .ToList();
            ViewBag.name = Title;
            return View();
        }

        public ActionResult UserWenZhang(int? ECid)
        {
            ViewBag.EssComm = db.EssayCommun.Find(ECid);
            return View();
        }
    }
}