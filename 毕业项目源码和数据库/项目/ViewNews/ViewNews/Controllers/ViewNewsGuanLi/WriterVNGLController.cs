using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ViewNews.Models;

namespace ViewNews.Controllers.ViewNewsGuanLi
{
    public class WriterVNGLController : Controller
    {
        ViewNewsEntities db = new ViewNewsEntities();
        // GET: WriterVNGL
        public ActionResult Index(int? WriterID)
        {
            if (WriterID != null)
            {
                db.WriterCommun.Remove(db.WriterCommun.Find(WriterID));
                db.SaveChanges();
            }
            ViewBag.writer = db.WriterCommun.ToList();
            return View();
        }

        public ActionResult WriterDel(int? WriterID)
        {
            db.WriterCommun.Remove(db.WriterCommun.Find(WriterID));
            db.SaveChanges();
            return RedirectToAction("Index", "LoginVNGL");
        }


        public ActionResult WriterCommunAdd()
        {
            ViewBag.writers = db.Writer.ToList();
            return View();
        }

        [HttpPost]
        public ActionResult WriterCommunAdd(WriterCommun wic, HttpPostedFileBase WCImage)
        {
            if (WCImage != null)
            {
                //拿到图片名称
                string fileName = Path.GetFileName(WCImage.FileName);

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
                    WCImage.SaveAs(Server.MapPath("~/Content/WriterImage/Commun/" + fileName));

                    //将图片文件名，绑定到该用户的Photo
                    wic.WCImage = fileName;
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
            wic.WCTime = DateTime.Now;
            db.WriterCommun.Add(wic);
            db.SaveChanges();
            return RedirectToAction("Index", "LoginVNGL");
        }


        public ActionResult Writer()
        {
            ViewBag.zuojia = db.Writer.ToList();
            return View();
        }

        public ActionResult WriterAdd()
        {
            return View();
        }
        [HttpPost]
        public ActionResult WriterAdd(Writer wir, HttpPostedFileBase WriterImage)
        {
            if (WriterImage != null)
            {
                //拿到图片名称
                string fileName = Path.GetFileName(WriterImage.FileName);

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
                    WriterImage.SaveAs(Server.MapPath("~/Content/WriterImage/Men/" + fileName));

                    //将图片文件名，绑定到该用户的Photo
                    wir.WriterImage = fileName;
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
            db.Writer.Add(wir);
            db.SaveChanges();
            return RedirectToAction("Index", "LoginVNGL");
        }

        public ActionResult WriterZuoJiaDel(int? WriterID)
        {
            db.Writer.Remove(db.Writer.Find(WriterID));
            db.SaveChanges();
            return RedirectToAction("Index", "LoginVNGL");
        }


        public ActionResult WriterXiangXi(int? WriterID)
        {
            ViewBag.writer = db.WriterCommun.Find(WriterID);
            ViewBag.comments = db.WriterCommunComment.Where(a => a.WriterCommunID == WriterID).Count();
            return View();
        }


        public ActionResult WriterEdits(int? WriterID)
        {
            ViewBag.writer = db.WriterCommun.Find(WriterID);
            ViewBag.writers = db.Writer.ToList();
            return View();
        }


        [HttpPost]
        public ActionResult WriterEdits(WriterCommun wir, HttpPostedFileBase EWCImage)
        {
            if (EWCImage != null)
            {
                //拿到图片名称
                string fileName = Path.GetFileName(EWCImage.FileName);

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
                    EWCImage.SaveAs(Server.MapPath("~/Content/WriterImage/Commun/" + fileName));

                    //将图片文件名，绑定到该用户的Photo
                    wir.WCImage = fileName;
                }
                else
                {
                    return Content("<script>alert('图片格式错误')</script>");
                }
            }
            wir.WCTime = DateTime.Now;
            db.Entry(wir).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index", "LoginVNGL");
        }



        public ActionResult WriterZuoJiaEdits(int? WriterID)
        {
            ViewBag.writerzuojia = db.Writer.Find(WriterID);
            return View();
        }


        [HttpPost]
        public ActionResult WriterZuoJiaEdits(Writer wir, HttpPostedFileBase EWriterImage)
        {
            if (EWriterImage != null)
            {
                //拿到图片名称
                string fileName = Path.GetFileName(EWriterImage.FileName);

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
                    EWriterImage.SaveAs(Server.MapPath("~/Content/WriterImage/Men/" + fileName));

                    //将图片文件名，绑定到该用户的Photo
                    wir.WriterImage = fileName;
                }
                else
                {
                    return Content("<script>alert('图片格式错误')</script>");
                }
            }
            db.Entry(wir).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index", "LoginVNGL");
        }
    }
}