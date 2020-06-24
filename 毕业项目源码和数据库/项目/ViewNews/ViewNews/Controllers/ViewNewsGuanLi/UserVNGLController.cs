using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ViewNews.Models;

namespace ViewNews.Controllers.ViewNewsGuanLi
{
    public class UserVNGLController : Controller
    {
        ViewNewsEntities db = new ViewNewsEntities();
        // GET: UserVNGL
        public ActionResult Index()
        {
            ViewBag.user = db.NewsUser.ToList();
            return View();
        }
        public ActionResult UserText()
        {
            ViewBag.EComm = db.EssayCommun.ToList();
            return View();
        }

        public ActionResult EssayCommunXianQing(int? EssayCoID)
        {
            ViewBag.EComm = db.EssayCommun.Find(EssayCoID);
            return View();
        }

        public ActionResult EssayCommunTongYi(int? EssayCoID)
        {
            EssayCommun essc = db.EssayCommun.Find(EssayCoID);
            essc.ECState = 2; 
            db.Entry(essc).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index", "LoginVNGL");
        }

        public ActionResult EssayCommunDaHui(int? EssayCoID)
        {
            EssayCommun essc = db.EssayCommun.Find(EssayCoID);
            essc.ECState = 1;
            db.Entry(essc).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index", "LoginVNGL");
        }
    }
}