//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace ViewNews.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class EssayCommunFalse
    {
        public int EssayCommunFalseID { get; set; }
        public string ECFTitle { get; set; }
        public string ECFContent { get; set; }
        public Nullable<int> ECFState { get; set; }
        public Nullable<int> ECFClick { get; set; }
        public string ECFReturns { get; set; }
        public Nullable<System.DateTime> ECFTime { get; set; }
        public Nullable<int> NewsUserID { get; set; }
    
        public virtual NewsUser NewsUser { get; set; }
    }
}
