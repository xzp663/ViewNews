using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ViewNews.Filter;
using ViewNews.Models;

namespace ViewNews.Controllers.ViewNewsKeHu
{
    [LoginVNKH]
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
            WriterCommun writerCommun = db.WriterCommun.Find(WriterCoID);
            writerCommun.WCClick = writerCommun.WCClick + 1;
            db.SaveChanges();
            ViewBag.writersWen = writerCommun;
            ViewBag.EssCommComm = db.WriterCommunComment.Where(a => a.WriterCommunID == WriterCoID).OrderByDescending(a => a.WCCTime).ToList();

            List<News> news = db.News.OrderByDescending(a => a.NewsClick + (a.NewsComment.Count() * 2)).ToList();
            List<News> newss = new List<News>();
            foreach (var item in news)
            {
                DateTime timeHost1 = DateTime.Now;
                DateTime timeHost2 = item.NewsTime;
                var jian1 = timeHost1 - timeHost2;
                var jieguoHost = jian1.TotalHours;
                if (jieguoHost < 4)
                {
                    newss.Add(item);
                }
            }
            ViewBag.renews = newss;
            ViewBag.Allnews = news;
            //ViewBag.renews = db.News.OrderByDescending(a => a.NewsClick + (a.NewsComment.Count() * 2)).ToList();
            List<WriterCommun> writerCommuns = db.WriterCommun.OrderByDescending(a => a.WCClick + (a.WriterCommunComment.Count() * 2)).ToList();
            List<WriterCommun> writerCommunss = new List<WriterCommun>();
            foreach (var item in writerCommuns)
            {
                DateTime timeHost1 = DateTime.Now;
                DateTime timeHost2 = item.WCTime;
                var jian1 = timeHost1 - timeHost2;
                var jieguoHost = jian1.TotalHours;
                if (jieguoHost < 4)
                {
                    writerCommunss.Add(item);
                }
            }
            ViewBag.rewritercommun = writerCommunss;
            ViewBag.Allwritercommun = writerCommuns;

            List<EssayCommun> essayCommuns = db.EssayCommun.OrderByDescending(a => a.ECClick + (a.EssayCommunComment.Count() * 2)).Where(a => a.ECState == 2).ToList();
            List<EssayCommun> essayCommunss = new List<EssayCommun>();
            foreach (var item in essayCommuns)
            {
                DateTime timeHost1 = DateTime.Now;
                DateTime timeHost2 = item.ECTime;
                var jian1 = timeHost1 - timeHost2;
                var jieguoHost = jian1.TotalHours;
                if (jieguoHost < 4)
                {
                    essayCommunss.Add(item);
                }
            }
            ViewBag.reessaycommun = essayCommunss;
            ViewBag.Allessaycommun = essayCommuns;
            return View();
        }

        public ActionResult WriterMen(int? WriterID)
        {
            ViewBag.writersPor = db.Writer.Find(WriterID);
            return View();
        }



        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ECCAdd(WriterCommunComment esscommComm)
        {

            esscommComm.WCCTime = DateTime.Now;
            db.WriterCommunComment.Add(esscommComm);
            db.SaveChanges();
            return RedirectToAction("WriterWenZhang", "WriterVNKH", new { WriterCoID = esscommComm.WriterCommunID });
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ECCC_Add(WriterCommunComment esscommComm)
        {

            esscommComm.WCCTime = DateTime.Now;
            db.WriterCommunComment.Add(esscommComm);
            db.SaveChanges();
            return RedirectToAction("WriterWenZhang", "WriterVNKH", new { WriterCoID = esscommComm.WriterCommunID });
        }

        public ActionResult LookHuiFu(int ECCCID)
        {
            ViewBag.zhupinglun = db.WriterCommunComment.Find(ECCCID);
            ViewBag.pinglun = db.WriterCommunComment.Where(a => a.WCCID == ECCCID).OrderByDescending(a => a.WCCTime).ToList();
            ViewBag.wenzhang = db.WriterCommun.Find(db.WriterCommunComment.Find(ECCCID).WriterCommunID);

            List<News> news = db.News.OrderByDescending(a => a.NewsClick + (a.NewsComment.Count() * 2)).ToList();
            List<News> newss = new List<News>();
            foreach (var item in news)
            {
                DateTime timeHost1 = DateTime.Now;
                DateTime timeHost2 = item.NewsTime;
                var jian1 = timeHost1 - timeHost2;
                var jieguoHost = jian1.TotalHours;
                if (jieguoHost < 4)
                {
                    newss.Add(item);
                }
            }
            ViewBag.renews = newss;
            ViewBag.Allnews = news;
            //ViewBag.renews = db.News.OrderByDescending(a => a.NewsClick + (a.NewsComment.Count() * 2)).ToList();
            List<WriterCommun> writerCommuns = db.WriterCommun.OrderByDescending(a => a.WCClick + (a.WriterCommunComment.Count() * 2)).ToList();
            List<WriterCommun> writerCommunss = new List<WriterCommun>();
            foreach (var item in writerCommuns)
            {
                DateTime timeHost1 = DateTime.Now;
                DateTime timeHost2 = item.WCTime;
                var jian1 = timeHost1 - timeHost2;
                var jieguoHost = jian1.TotalHours;
                if (jieguoHost < 4)
                {
                    writerCommunss.Add(item);
                }
            }
            ViewBag.rewritercommun = writerCommunss;
            ViewBag.Allwritercommun = writerCommuns;

            List<EssayCommun> essayCommuns = db.EssayCommun.OrderByDescending(a => a.ECClick + (a.EssayCommunComment.Count() * 2)).Where(a => a.ECState == 2).ToList();
            List<EssayCommun> essayCommunss = new List<EssayCommun>();
            foreach (var item in essayCommuns)
            {
                DateTime timeHost1 = DateTime.Now;
                DateTime timeHost2 = item.ECTime;
                var jian1 = timeHost1 - timeHost2;
                var jieguoHost = jian1.TotalHours;
                if (jieguoHost < 4)
                {
                    essayCommunss.Add(item);
                }
            }
            ViewBag.reessaycommun = essayCommunss;
            ViewBag.Allessaycommun = essayCommuns;
            return View();
        }

        public ActionResult ECCLike(int ECCID, int ECCren)
        {
            WCCLike like = db.WCCLike.FirstOrDefault(a => a.NewsUserID == ECCren && a.WriterCommunCommentID == ECCID);
            if (like == null)
            {
                WriterCommunComment ecc = db.WriterCommunComment.Find(ECCID);
                ecc.WCCLike = ecc.WCCLike + 1;
                WCCLike ecclike = new WCCLike()
                {
                    NewsUserID = ECCren,
                    WriterCommunCommentID = ECCID
                };
                db.WCCLike.Add(ecclike);
                db.SaveChanges();
                return RedirectToAction("WriterWenZhang", "WriterVNKH", new { WriterCoID = ecc.WriterCommunID });
            }
            else
            {
                return Content("<script>alert('已经点过赞了');history.go(-1);</script>");
            }
        }

        public ActionResult ECCReport(int ECCID, int ECCren)
        {
            WCCReport report = db.WCCReport.FirstOrDefault(a => a.NewsUserID == ECCren && a.WriterCommunCommentID == ECCID);
            if (report == null)
            {
                WriterCommunComment ecc = db.WriterCommunComment.Find(ECCID);
                ecc.WCCReport = ecc.WCCReport + 1;
                WCCReport ecceccreport = new WCCReport()
                {
                    NewsUserID = ECCren,
                    WriterCommunCommentID = ECCID
                };
                db.WCCReport.Add(ecceccreport);
                db.SaveChanges();
                return RedirectToAction("WriterWenZhang", "WriterVNKH", new { WriterCoID = ecc.WriterCommunID });
            }
            else
            {
                return Content("<script>alert('已举报');history.go(-1);</script>");
            }
        }
    }
}