using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ViewNews.Filter;
using ViewNews.Models;

namespace ViewNews.Controllers.ViewNewsGuanLiGaiDong
{
    public class LoginVNGLGDController : Controller
    {
        ViewNewsEntities1 db = new ViewNewsEntities1();
        // GET: LoginVNGLGD
        [LoginVNGLGD]
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult VNGLGLogin()
        {
            return View();
        }

        [HttpPost]
        public ActionResult VNGLGLogin(Editor editor)
        {
            Editor edt = db.Editor.Where(a => a.EditorAccount == editor.EditorAccount && a.EditorPwd == editor.EditorPwd).FirstOrDefault();
            if (edt == null)
            {
                ViewBag.tishi = "账号或密码错误";
                return View();
            }
            else
            {
                Session["Editors"] = edt;
                return RedirectToAction("Index");
            }

        }

        public ActionResult VNGLGLoginOut()
        {
            Session["Editors"] = null;
            return RedirectToAction("VNGLGLogin", "LoginVNGLGD");
        }
    }
}