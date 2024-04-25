using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetFinSessionBD.Models
{
    [Table("GrandPrix", Schema = "Evenements")]
    public partial class GrandPrix
    {
        [Key]
        [Column("GrandPrixID")]
        public int GrandPrixId { get; set; }
        [StringLength(30)]
        public string Gagnant { get; set; } = null!;
        public int BilletVendu { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime Date { get; set; }
    }
}
