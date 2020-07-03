using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ViewNews.Models;

namespace ViewNews.Controllers.ViewNewsGuanLi
{
    public class NewsVNGLController : Controller
    {
        ViewNewsEntities1 db = new ViewNewsEntities1();
        // GET: NewsVNGL
        public ActionResult Index(int? NewsID)
        {
            if (NewsID!=null)
            {
                db.News.Remove(db.News.Find(NewsID));
                db.SaveChanges();
            }
            ViewBag.newss = db.News.ToList();
            return View();
        }

        public ActionResult NewsDel(int? NewsID)
        {
            db.News.Remove(db.News.Find(NewsID));
            db.SaveChanges();
            return RedirectToAction("Index", "LoginVNGL");
        }

        public ActionResult NewsAdd()
        {
            return View();
        }
        [HttpPost]
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
            return RedirectToAction("Index", "LoginVNGL");
        }


        public ActionResult NewsXiangXi(int? NewsID) 
        {
            ViewBag.news = db.News.Find(NewsID);
            ViewBag.comments = db.NewsComment.Where(a => a.NewsID == NewsID).Count();
            return View();
        }

        public ActionResult NewsEdits(int? NewsID)
        {
            ViewBag.news = db.News.Find(NewsID);
            return View();
        }
        [HttpPost]
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
            return RedirectToAction("Index", "LoginVNGL");
        }
        //删除（已废除）
        //public void Delect(int? NewsID)
        //{
        //    db.News.Remove(db.News.Find(NewsID));
        //    db.SaveChanges();
        //}
    }
}