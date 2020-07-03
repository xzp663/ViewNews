using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ViewNews.Models;

namespace ViewNews.Controllers.ViewNewsKeHu
{
    public class LoginVNKHController : Controller
    {
        ViewNewsEntities1 db = new ViewNewsEntities1();
        // GET: LoginVNKH
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult LoginUser(int? acc)
        {
            ViewBag.accc = db.NewsUser.Find(acc);
            return View();
        }

        [HttpPost]
        public ActionResult LoginUser(NewsUser nuser)
        {
            NewsUser newsuser = db.NewsUser.Where(a => a.NewsUserAccount == nuser.NewsUserAccount && a.NewsUserPwd == nuser.NewsUserPwd).FirstOrDefault();
            if (newsuser == null)
            {
                ViewBag.tishi = "账号或密码错误";
                return View();
            }
            else
            {
                Session["userLogin"] = newsuser;
                return RedirectToAction("Index", "NewsVNKH");
            }
        }

        [HttpPost]
        public ActionResult RegisterUser(NewsUser nuser)
        {
            NewsUser newsuser = db.NewsUser.Where(a => a.NewsUserAccount == nuser.NewsUserAccount && a.NewsUserPwd == nuser.NewsUserPwd).FirstOrDefault();
            if (newsuser == null)
            {
                nuser.NewsUserSex = "保密";
                nuser.NewsUserImage = "通用.png";
                db.NewsUser.Add(nuser);
                db.SaveChanges();
                return RedirectToAction("LoginUser", "LoginVNKH",new { acc=nuser.NewsUserID });
            }
            else 
            {
                TempData["cunzai"] = "该账号和密码已经存在";
                return RedirectToAction("LoginUser", "LoginVNKH");
            
            }
        }

        public ActionResult OutLogin()
        {
            Session["userLogin"] = null;
            return RedirectToAction("Index", "NewsVNKH");
        }
    }
}