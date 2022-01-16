using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class TocHo
    {
        [Key]
        [Required]
        [Display(Name = "Id")]
        public int Id { get; set; }

        [Required]
        [Display(Name = "Tên tộc họ")]
        public string? Name { get; set; }

        [Required]
        [Display(Name = "Địa chỉ")]
        public string? AddressId { get; set; }

        [Display(Name = "Cập nhật lần cuối")]
        public string? LastUpdate { get; set; }

        [Display(Name = "Triết lý tiêu biểu")]
        public string? Slogan { get; set; }

        [Display(Name = "Hình ảnh")]
        public string? ImageThumbnail { get; set; }
    }
}
