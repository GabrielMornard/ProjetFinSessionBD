using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetFinSessionBD.Models
{
    [Table("Pilote", Schema = "Participations")]
    public partial class Pilote
    {
        public Pilote()
        {
            Participations = new HashSet<Participation>();
            Transactions = new HashSet<Transaction>();
        }

        [Key]
        [Column("PiloteID")]
        public int PiloteId { get; set; }
        [StringLength(30)]
        public string Nom { get; set; } = null!;
        [Column("NBVictoire")]
        public int Nbvictoire { get; set; }
        [Column("EcurieID")]
        public int EcurieId { get; set; }
        public int Points { get; set; }

        [ForeignKey("EcurieId")]
        [InverseProperty("Pilotes")]
        public virtual Ecurie Ecurie { get; set; } = null!;
        [InverseProperty("Pilote")]
        public virtual ICollection<Participation> Participations { get; set; }
        [InverseProperty("Pilote")]
        public virtual ICollection<Transaction> Transactions { get; set; }
    }
}
