using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ViewNews.Filter;
using ViewNews.Models;

namespace ViewNews.Controllers.ViewNewsGuanLiGaiDong
{
    [LoginVNGLGD]
    public class UserVNGLGDController : Controller
    {
        ViewNewsEntities1 db = new ViewNewsEntities1();
        // GET: UserVNGLGD
        //用户列表
        public ActionResult Index()
        {
            ViewBag.user = db.NewsUser.ToList();
            return View();
        }

        public ActionResult UserXiangxi(int UserID)
        {
            ViewBag.user = db.NewsUser.Find(UserID);
            ViewBag.newss = db.NewsComment.Where(a => a.NewsUserID == UserID).ToList();
            ViewBag.writers = db.WriterCommunComment.Where(a => a.NewsUserID == UserID).ToList();
            ViewBag.essayC = db.EssayCommun.Where(a => a.NewsUserID == UserID).ToList();
            ViewBag.essayCC = db.EssayCommunComment.Where(a => a.NewsUserID == UserID).ToList();
            return View();
        }

        //社区文章审议
        public ActionResult UserText()
        {
            ViewBag.EComm = db.EssayCommun.OrderByDescending(a => a.ECTime).ToList();
            return View();
        }

        //社区文章详情
        public ActionResult EssayCommunXianQing(int? EssayCoID)
        {
            ViewBag.EComm = db.EssayCommun.Find(EssayCoID);
            ViewBag.comments = db.EssayCommunComment.Where(a => a.EssayCommunID == EssayCoID).Count();
            return View();
        }
        //社区文章同意
        public ActionResult EssayCommunTongYi(int? EssayCoID)
        {
            EssayCommun essc = db.EssayCommun.Find(EssayCoID);
            essc.ECState = 2;
            db.Entry(essc).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("UserText", "UserVNGLGD");
        }
        //社区文章打回
        public ActionResult EssayCommunDaHui(string ECReturns, int EssayCommunID)
        {
            EssayCommun essc = db.EssayCommun.Find(EssayCommunID);
            essc.ECReturns = ECReturns;
            essc.ECState = 1;
            db.Entry(essc).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("UserText", "UserVNGLGD");
        }
        //社区文章封禁
        public ActionResult EssayCommunFengJin(int? EssayCoID)
        {
            EssayCommun essc = db.EssayCommun.Find(EssayCoID);
            essc.ECState = 3;
            db.Entry(essc).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("UserText", "UserVNGLGD");
        }
        //社区文章解封
        public ActionResult EssayCommunJieFeng(int? EssayCoID)
        {
            EssayCommun essc = db.EssayCommun.Find(EssayCoID);
            essc.ECState = 2;
            db.Entry(essc).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("UserText", "UserVNGLGD");
        }
    }
}