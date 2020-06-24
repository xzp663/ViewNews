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
    
    public partial class WriterCommun
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public WriterCommun()
        {
            this.WriterCommunComment = new HashSet<WriterCommunComment>();
        }
    
        public int WriterCommunID { get; set; }
        public string WCTitle { get; set; }
        public string WCImage { get; set; }
        public string WCContent { get; set; }
        public System.DateTime WCTime { get; set; }
        public int WCClick { get; set; }
        public int WriterID { get; set; }
        public int EditorID { get; set; }
    
        public virtual Editor Editor { get; set; }
        public virtual Writer Writer { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WriterCommunComment> WriterCommunComment { get; set; }
    }
}
