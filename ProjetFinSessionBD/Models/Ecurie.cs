using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetFinSessionBD.Models
{
    [Table("Ecurie", Schema = "Participations")]
    public partial class Ecurie
    {
        public Ecurie()
        {
            Images = new HashSet<Image>();
            Participations = new HashSet<Participation>();
            Pilotes = new HashSet<Pilote>();
            Transactions = new HashSet<Transaction>();
        }

        [Key]
        [Column("EcurieID")]
        public int EcurieId { get; set; }
        [StringLength(30)]
        public string Nom { get; set; } = null!;
        public int Victoire { get; set; }
        [Column("SponsorID")]
        public int? SponsorId { get; set; }

        [ForeignKey("SponsorId")]
        [InverseProperty("Ecuries")]
        public virtual Sponsor? Sponsor { get; set; }
        [InverseProperty("Ecurie")]
        public virtual ICollection<Image> Images { get; set; }
        [InverseProperty("Ecurie")]
        public virtual ICollection<Participation> Participations { get; set; }
        [InverseProperty("Ecurie")]
        public virtual ICollection<Pilote> Pilotes { get; set; }
        [InverseProperty("Ecurie")]
        public virtual ICollection<Transaction> Transactions { get; set; }
    }
}
