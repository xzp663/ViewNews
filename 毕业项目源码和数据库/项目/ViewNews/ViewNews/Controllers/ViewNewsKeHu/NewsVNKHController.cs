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

            List<News> news = db.News.OrderByDescending(a => a.NewsClick + (a.NewsComment.Count() * 2)).ToList();
            List<News> newsss = new List<News>();
            foreach (var item in news)
            {
                DateTime timeHost1 = DateTime.Now;
                DateTime timeHost2 = item.NewsTime;
                var jian1 = timeHost1 - timeHost2;
                var jieguoHost = jian1.TotalHours;
                if (jieguoHost < 4)
                {
                    newsss.Add(item);
                }
            }
            ViewBag.renews = newsss;
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

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ECCAdd(NewsComment esscommComm)
        {

            esscommComm.NCTime = DateTime.Now;
            db.NewsComment.Add(esscommComm);
            db.SaveChanges();
            return RedirectToAction("NewsWenZhang", "NewsVNKH", new { Newsid = esscommComm.NewsID });
        }

        [HttpPost]
        [ValidateInput(false)]
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
                return Content("<script>alert('已经点过赞了');history.go(-1);</script>");
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
                return Content("<script>alert('已举报');history.go(-1);</script>");
            }
        }
    }
}