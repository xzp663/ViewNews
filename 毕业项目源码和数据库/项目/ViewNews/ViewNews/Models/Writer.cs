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
    
    public partial class Writer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Writer()
        {
            this.WriterCommun = new HashSet<WriterCommun>();
            this.WriterCommunFalse = new HashSet<WriterCommunFalse>();
        }
    
        public int WriterID { get; set; }
        public string WriterName { get; set; }
        public string WriterImage { get; set; }
        public string WriterPosition { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WriterCommun> WriterCommun { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WriterCommunFalse> WriterCommunFalse { get; set; }
    }
}
