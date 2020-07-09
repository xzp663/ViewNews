using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ViewNews.Filter;
using ViewNews.Models;

namespace ViewNews.Controllers.ViewNewsGuanLiGaiDong
{
    [LoginVNGLGD]
    public class NewsVNGLGDController : Controller
    {
        ViewNewsEntities1 db = new ViewNewsEntities1();
        // GET: NewsVNGLGD
        public ActionResult Index()
        {
            ViewBag.newss = db.News.OrderByDescending(a=>a.NewsTime).ToList();
            return View();
        }
        //新闻详情
        public ActionResult NewsXiangXi(int? NewsID)
        {
            ViewBag.news = db.News.Find(NewsID);
            ViewBag.comments = db.NewsComment.Where(a => a.NewsID == NewsID).Count();
            return View();
        }


        //新闻添加
        [ValidateInput(false)]
        public ActionResult NewsAdd()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult NewsAdd(News news, HttpPostedFileBase NewsImage)
        {
            if (NewsImage != null)
            {
                //拿到图片名称
                string fileName = Path.GetFileName(NewsImage.FileName);

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
                    NewsImage.SaveAs(Server.MapPath("~/Content/NewsImage/" + fileName));

                    //将图片文件名，绑定到该用户的Photo
                    news.NewsImage = fileName;
                }
                else
                {
                    return Content("<script>alert('图片格式错误')</script>");
                }
            }
            else
            {
                return Content("<script>alert('未获取上传文件')</script>");
            }
            news.NewsTime = DateTime.Now;
            db.News.Add(news);
            db.SaveChanges();
            return RedirectToAction("Index", "NewsVNGLGD");
        }

        //新闻修改
        [ValidateInput(false)]
        public ActionResult NewsEdits(int? NewsID)
        {
            ViewBag.news = db.News.Find(NewsID);
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult NewsEdits(News news, HttpPostedFileBase ENewsImage)
        {
            if (ENewsImage != null)
            {
                //拿到图片名称
                string fileName = Path.GetFileName(ENewsImage.FileName);

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
                    ENewsImage.SaveAs(Server.MapPath("~/Content/NewsImage/" + fileName));

                    //将图片文件名，绑定到该用户的Photo
                    news.NewsImage = fileName;
                }
                else
                {
                    return Content("<script>alert('图片格式错误')</script>");
                }
            }
            news.NewsTime = DateTime.Now;
            db.Entry(news).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index", "NewsVNGLGD");
        }

        public ActionResult NewsDel(int? NewsID)
        {
            
            List<NewsComment> ncomm = db.NewsComment.Where(a => a.NewsID == NewsID).ToList();
            foreach (var item in ncomm)
            {
                List<NCLike> nclike = db.NCLike.Where(a => a.NewsCommentID == item.NewsCommentID).ToList();
                foreach (var item1 in nclike)
                {
                    db.NCLike.Remove(item1);
                }
                List<NCReport> ncreport = db.NCReport.Where(a => a.NewsCommentID == item.NewsCommentID).ToList();
                foreach (var item1 in ncreport)
                {
                    db.NCReport.Remove(item1);
                }
                db.NewsComment.Remove(item);
            }
            db.News.Remove(db.News.Find(NewsID));
            db.SaveChanges();
            return RedirectToAction("Index", "NewsVNGLGD");
        }
    }
}