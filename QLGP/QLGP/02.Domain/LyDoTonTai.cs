using System.ComponentModel.DataAnnotations;

namespace Domain
{
    public class LyDoTonTai
    {
        [Key]
        [Required]
        [Display(Name ="Id")]
        public int Id { get; set; }

        [Required]
        [Display(Name ="Lý do")]
        public string? Reason { get; set; }

        [Required]
        [Display(Name = "Chi tiết")]
        public string? Description { get; set; }

        [Display(Name = "Link Youtube")]
        public string? LinkYoutube { get; set; }

        [Display(Name = "Hình ảnh")]
        public string? ImageThumbnail { get; set; }
    }
}
