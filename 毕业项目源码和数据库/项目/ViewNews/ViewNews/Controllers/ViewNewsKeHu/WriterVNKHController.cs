using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ViewNews.Models;

namespace ViewNews.Controllers.ViewNewsKeHu
{
    public class WriterVNKHController : Controller
    {
        ViewNewsEntities1 db = new ViewNewsEntities1();
        // GET: WriterVNKH
        public ActionResult Index()
        {
            ViewBag.writers = db.WriterCommun.OrderByDescending(a => a.WCTime).ToList();
            return View();
        }

        [HttpPost]
        public ActionResult Index(string Title = "")
        {
            ViewBag.writers = db.WriterCommun.OrderByDescending(p => p.WCTime)
               .Where(p => Title == "" || p.WCTitle.Contains(Title))
               .ToList();
            ViewBag.name = Title;
            return View();
        }

        public ActionResult WriterWenZhang(int? WriterCoID)
        {
            ViewBag.writersWen = db.WriterCommun.Find(WriterCoID);
            return View();
        }

        public ActionResult WriterMen(int? WriterID)
        {
            ViewBag.writersPor = db.Writer.Find(WriterID);
            return View();
        }
    }
}