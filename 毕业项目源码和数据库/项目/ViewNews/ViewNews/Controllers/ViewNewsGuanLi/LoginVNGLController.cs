using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.Mvc;
using ViewNews.Models;

namespace ViewNews.Controllers.ViewNewsGuanLi
{
    public class LoginVNGLController : Controller
    {
        ViewNewsEntities db = new ViewNewsEntities();
        // GET: LoginVNGL
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(Editor editor)
        {
           Editor edt=db.Editor.Where(a => a.EditorAccount == editor.EditorAccount && a.EditorPwd == editor.EditorPwd).FirstOrDefault();
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
    }
}