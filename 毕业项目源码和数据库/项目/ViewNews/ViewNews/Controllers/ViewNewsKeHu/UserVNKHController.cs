using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ViewNews.Models;

namespace ViewNews.Controllers.ViewNewsKeHu
{
    public class UserVNKHController : Controller
    {
        ViewNewsEntities1 db = new ViewNewsEntities1();
        // GET: UserVNKH
        public ActionResult Index()
        {
            ViewBag.userEss = db.EssayCommun.OrderByDescending(a => a.ECTime).Where(a=>a.ECState==2).ToList();
            
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

        public ActionResult UserWenZhang(int ECid)
        {
            EssayCommun essaycomm = db.EssayCommun.Find(ECid);
            essaycomm.ECClick = essaycomm.ECClick + 1;
            db.SaveChanges();
            ViewBag.EssComms = essaycomm;
            ViewBag.EssCommComm = db.EssayCommunComment.Where(a => a.EssayCommunID == ECid).OrderByDescending(a=>a.ECCTime).ToList();

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

        public ActionResult UserXiangxiKeHu(int UserID)
        {
            ViewBag.user = db.NewsUser.Find(UserID);
            ViewBag.newss = db.NewsComment.Where(a => a.NewsUserID == UserID).ToList();
            ViewBag.writers = db.WriterCommunComment.Where(a => a.NewsUserID == UserID).ToList();
            ViewBag.essayC = db.EssayCommun.Where(a => a.NewsUserID == UserID).ToList();
            ViewBag.essayCC = db.EssayCommunComment.Where(a => a.NewsUserID == UserID).ToList();
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult UserEssayCommAdd(EssayCommun esscomm)
        {

            esscomm.ECTime = DateTime.Now;
            db.EssayCommun.Add(esscomm);
            db.SaveChanges();
            return RedirectToAction("UserXiangxiKeHu", "UserVNKH",new { UserID = esscomm.NewsUserID });
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult UserEssayCommEdit(EssayCommun esscomm)
        {
            esscomm.ECState = 0;
            db.Entry(esscomm).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("UserXiangxiKeHu", "UserVNKH", new { UserID = esscomm.NewsUserID });
        }



        [HttpPost]
        public ActionResult UserEdit(NewsUser user, HttpPostedFileBase ENewsUserImage)
        {
            if (ENewsUserImage != null)
            {
                //拿到图片名称
                string fileName = Path.GetFileName(ENewsUserImage.FileName);

                //判断文件是否是图片
                //string hz = Path.GetExtension(fileName);//.jpg
                if (fileName.EndsWith("jpg")
                    || fileName.EndsWith("png")
                    || fileName.EndsWith("gif")
                    || fileName.EndsWith("jpeg")
                    || fileName.EndsWith("JPG")
                    || fileName.EndsWith("PNG")
                    || fileName.EndsWith("GIF")
                    || fileName.EndsWith("JPEG"))
                {
                    //保存图片到项目文件夹中
                    ENewsUserImage.SaveAs(Server.MapPath("~/Content/imageKeHu/User/" + fileName));

                    //将图片文件名，绑定到该用户的Photo
                    user.NewsUserImage = fileName;
                }
                else
                {
                    return Content("<script>alert('图片格式错误')</script>");
                }
            }
            
            db.Entry(user).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            Session["userLogin"] = user;
            return RedirectToAction("UserXiangxiKeHu", "UserVNKH",new { UserID =user.NewsUserID});
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ECCAdd(EssayCommunComment esscommComm)
        {

            esscommComm.ECCTime = DateTime.Now;
            db.EssayCommunComment.Add(esscommComm);
            db.SaveChanges();
            return RedirectToAction("UserWenZhang", "UserVNKH", new { ECid = esscommComm.EssayCommunID });
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ECCC_Add(EssayCommunComment esscommComm)
        {

            esscommComm.ECCTime = DateTime.Now;
            db.EssayCommunComment.Add(esscommComm);
            db.SaveChanges();
            return RedirectToAction("UserWenZhang", "UserVNKH", new { ECid = esscommComm.EssayCommunID });
        }

        public ActionResult LookHuiFu(int ECCCID)
        {
            ViewBag.zhupinglun = db.EssayCommunComment.Find(ECCCID);
            ViewBag.pinglun = db.EssayCommunComment.Where(a=>a.ECCCID==ECCCID).OrderByDescending(a => a.ECCTime).ToList();
            ViewBag.wenzhang = db.EssayCommun.Find(db.EssayCommunComment.Find(ECCCID).EssayCommunID);

            List<News> news= db.News.OrderByDescending(a => a.NewsClick + (a.NewsComment.Count() * 2)).ToList();
            List<News> newss = new List<News>();
            foreach (var item in news)
            {
                DateTime timeHost1= DateTime.Now;
                DateTime timeHost2 = item.NewsTime;
                var jian1 = timeHost1 - timeHost2;
                var jieguoHost = jian1.TotalHours;
                if (jieguoHost<4)
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

            List<EssayCommun> essayCommuns=db.EssayCommun.OrderByDescending(a => a.ECClick + (a.EssayCommunComment.Count() * 2)).Where(a=>a.ECState == 2).ToList();
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

        public ActionResult ECCLike(int ECCID,int ECCren)
        {
            ECCLike like = db.ECCLike.FirstOrDefault(a => a.NewsUserID == ECCren && a.EssayCommunCommentID == ECCID);
            if (like == null)
            {
                EssayCommunComment ecc = db.EssayCommunComment.Find(ECCID);
                ecc.ECCLike = ecc.ECCLike + 1;
                ECCLike ecclike = new ECCLike()
                {
                    NewsUserID = ECCren,
                    EssayCommunCommentID = ECCID
                };
                db.ECCLike.Add(ecclike);
                db.SaveChanges();
                return RedirectToAction("UserWenZhang", "UserVNKH", new { ECid = ecc.EssayCommunID });
            }
            else 
            {
                return Content("<script>alert('已经点过赞了');history.go(-1);</script>");
            }
        }

        public ActionResult ECCReport(int ECCID, int ECCren)
        {
            ECCReport report = db.ECCReport.FirstOrDefault(a => a.NewsUserID == ECCren && a.EssayCommunCommentID == ECCID);
            if (report == null)
            {
                EssayCommunComment ecc = db.EssayCommunComment.Find(ECCID);
                ecc.ECCReport = ecc.ECCReport + 1;
                ECCReport ecceccreport = new ECCReport()
                {
                    NewsUserID = ECCren,
                    EssayCommunCommentID = ECCID
                };
                db.ECCReport.Add(ecceccreport);
                db.SaveChanges();
                return RedirectToAction("UserWenZhang", "UserVNKH", new { ECid = ecc.EssayCommunID });
            }
            else
            {
                return Content("<script>alert('已举报');history.go(-1);</script>");
            }
        }
    }
}