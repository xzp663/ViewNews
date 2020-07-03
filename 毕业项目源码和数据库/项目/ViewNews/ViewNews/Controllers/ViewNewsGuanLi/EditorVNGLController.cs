using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ViewNews.Models;

namespace ViewNews.Controllers.ViewNewsGuanLi
{
    public class EditorVNGLController : Controller
    {
        ViewNewsEntities1 db = new ViewNewsEntities1();
        // GET: EditorVNGL
        public ActionResult Index()
        {
            ViewBag.Edits = db.Editor.ToList();
            return View();
        }
        public ActionResult EditorAdd()
        {
            return View();
        }
        [HttpPost]
        public ActionResult EditorAdd(Editor eidt)
        {
            db.Editor.Add(eidt);
            db.SaveChanges();
            return RedirectToAction("Index", "LoginVNGL");
        }

        public ActionResult EditorLook(int? EditorID)
        {
            ViewBag.eidtss = db.Editor.Find(EditorID);
            ViewBag.news = db.News.Where(a => a.EditorID == EditorID).ToList();
            ViewBag.writer = db.WriterCommun.Where(a=>a.EditorID==EditorID).ToList();
            return View();
        }

        public ActionResult EditorEdits(int? EditorID)
        {
            ViewBag.ditor = db.Editor.Find(EditorID);
            return View();
        }
        [HttpPost]
        public ActionResult EditorEdits(Editor eidt)
        {
            db.Entry(eidt).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index", "LoginVNGL");
        }
    }
}