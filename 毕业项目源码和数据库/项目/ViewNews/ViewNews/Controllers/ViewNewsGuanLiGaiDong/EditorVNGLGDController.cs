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
    public class EditorVNGLGDController : Controller
    {
        ViewNewsEntities1 db = new ViewNewsEntities1();
        // GET: EditorVNGLGD
        //责任编辑列表
        public ActionResult Index()
        {
            ViewBag.Edits = db.Editor.ToList();
            return View();
        }

        //责任编辑添加
        public ActionResult EditorAdd()
        {
            return View();
        }
        [HttpPost]
        public ActionResult EditorAdd(Editor eidt)
        {
            Editor eidts = db.Editor.Where(a => a.EditorAccount == eidt.EditorAccount && a.EditorPwd == eidt.EditorPwd).FirstOrDefault();
            if (eidts==null)
            {
                db.Editor.Add(eidt);
            db.SaveChanges();
            return RedirectToAction("Index", "EditorVNGLGD");
            }
            else 
            {
            return Content("<script>alert('该责任编辑已存在');history.go(-1);</script>");
            }
           
        }

        //责任编辑详情
        public ActionResult EditorLook(int? EditorID)
        {
            ViewBag.eidtss = db.Editor.Find(EditorID);
            ViewBag.news = db.News.Where(a => a.EditorID == EditorID).ToList();
            ViewBag.writer = db.WriterCommun.Where(a => a.EditorID == EditorID).ToList();
            return View();
        }

        //责任编辑修改
        public ActionResult EditorEdits(int? EditorID)
        {
            ViewBag.ditor = db.Editor.Find(EditorID);
            return View();
        }
        [HttpPost]
        public ActionResult EditorEdits(Editor eidt)
        {
            Editor eidts = db.Editor.Where(a => a.EditorAccount == eidt.EditorAccount && a.EditorPwd == eidt.EditorPwd).FirstOrDefault();
            if (eidts == null)
            {
                db.Entry(eidt).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", "EditorVNGLGD");
            }
            else
            {
                return Content("<script>alert('该责任编辑已存在');history.go(-1);</script>");
            }
        }

        //编辑删除
        //public ActionResult EditorDelects(int? EditorID)
        //{
        //    Editor chaedit = db.Editor.Find(EditorID);
        //    Editor eidts = db.Editor.Where(a => a.EditorAccount == chaedit.EditorAccount && a.EditorPwd == chaedit.EditorPwd).FirstOrDefault();
        //    if (eidts == null)
        //    {
        //        db.Editor.Remove(chaedit);
        //        db.SaveChanges();
        //        return RedirectToAction("Index", "EditorVNGLGD");
        //    }
        //    else
        //    {
        //        return Content("<script>alert('');history.go(-1);</script>");
        //    }
        //}
    }
}