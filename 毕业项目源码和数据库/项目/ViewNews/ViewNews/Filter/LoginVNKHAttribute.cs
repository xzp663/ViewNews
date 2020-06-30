using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ViewNews.Filter
{
    public class LoginVNKHAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (HttpContext.Current.Session["userLogin"] == null)
            {
                filterContext.Result = new RedirectResult("/LoginVNKH/LoginUser");
            }
        }
    }
}