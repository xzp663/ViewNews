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
        ViewNewsEntities1 db = new ViewNewsEntities1();
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
            News newss=db.News.Find(Newsid);
            newss.NewsClick = newss.NewsClick + 1;
            db.SaveChanges();
            ViewBag.newsS = newss;
            ViewBag.newsComm = db.NewsComment.Where(a => a.NewsID == Newsid).OrderByDescending(a => a.NCTime).ToList();

            ViewBag.renews = db.News.OrderByDescending(a => a.NewsClick + (a.NewsComment.Count() * 2)).ToList();
            ViewBag.rewritercommun = db.WriterCommun.OrderByDescending(a => a.WCClick + (a.WriterCommunComment.Count() * 2)).ToList();
            ViewBag.reessaycommun = db.EssayCommun.OrderByDescending(a => a.ECClick + (a.EssayCommunComment.Count() * 2)).Where(a => a.ECState == 2).ToList();
            return View();
        }

        [HttpPost]
        public ActionResult ECCAdd(NewsComment esscommComm)
        {

            esscommComm.NCTime = DateTime.Now;
            db.NewsComment.Add(esscommComm);
            db.SaveChanges();
            return RedirectToAction("NewsWenZhang", "NewsVNKH", new { Newsid = esscommComm.NewsID });
        }

        [HttpPost]
        public ActionResult ECCC_Add(NewsComment esscommComm)
        {

            esscommComm.NCTime = DateTime.Now;
            db.NewsComment.Add(esscommComm);
            db.SaveChanges();
            return RedirectToAction("NewsWenZhang", "NewsVNKH", new { Newsid = esscommComm.NewsID });
        }

        public ActionResult LookHuiFu(int ECCCID)
        {
            ViewBag.zhupinglun = db.NewsComment.Find(ECCCID);
            ViewBag.pinglun = db.NewsComment.Where(a => a.NCID == ECCCID).OrderByDescending(a => a.NCTime).ToList();
            ViewBag.wenzhang = db.News.Find(db.NewsComment.Find(ECCCID).NewsID);

            ViewBag.renews = db.News.OrderByDescending(a => a.NewsClick + (a.NewsComment.Count() * 2)).ToList();
            ViewBag.rewritercommun = db.WriterCommun.OrderByDescending(a => a.WCClick + (a.WriterCommunComment.Count() * 2)).ToList();
            ViewBag.reessaycommun = db.EssayCommun.OrderByDescending(a => a.ECClick + (a.EssayCommunComment.Count() * 2)).Where(a => a.ECState == 2).ToList();
            return View();
        }

        public ActionResult ECCLike(int ECCID, int ECCren)
        {
            NCLike like = db.NCLike.FirstOrDefault(a => a.NewsUserID == ECCren && a.NewsCommentID == ECCID);
            if (like == null)
            {
                NewsComment ecc = db.NewsComment.Find(ECCID);
                ecc.NCLike = ecc.NCLike + 1;
                NCLike ecclike = new NCLike()
                {
                    NewsUserID = ECCren,
                    NewsCommentID = ECCID
                };
                db.NCLike.Add(ecclike);
                db.SaveChanges();
                return RedirectToAction("NewsWenZhang", "NewsVNKH", new { Newsid = ecc.NewsID });
            }
            else
            {
                return Content("<script>alert('已经点过赞了')</script>");
            }
        }

        public ActionResult ECCReport(int ECCID, int ECCren)
        {
            NCReport report = db.NCReport.FirstOrDefault(a => a.NewsUserID == ECCren && a.NewsCommentID == ECCID);
            if (report == null)
            {
                NewsComment ecc = db.NewsComment.Find(ECCID);
                ecc.NCReport = ecc.NCReport + 1;
                NCReport ecceccreport = new NCReport()
                {
                    NewsUserID = ECCren,
                    NewsCommentID = ECCID
                };
                db.NCReport.Add(ecceccreport);
                db.SaveChanges();
                return RedirectToAction("NewsWenZhang", "NewsVNKH", new { Newsid = ecc.NewsID });
            }
            else
            {
                return Content("<script>alert('已举报')</script>");
            }
        }
    }
}