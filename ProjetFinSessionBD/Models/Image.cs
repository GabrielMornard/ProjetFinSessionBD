using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetFinSessionBD.Models
{
    [Table("Image", Schema = "Images")]
    [Index("Identifiant", Name = "UC_Image_Identifiant", IsUnique = true)]
    public partial class Image
    {
        [Key]
        [Column("ImageID")]
        public int ImageId { get; set; }
        [Column("EcurieID")]
        public int EcurieId { get; set; }
        public Guid Identifiant { get; set; }
        public byte[]? FichierImage { get; set; }

        [ForeignKey("EcurieId")]
        [InverseProperty("Images")]
        public virtual Ecurie Ecurie { get; set; } = null!;
    }
}
