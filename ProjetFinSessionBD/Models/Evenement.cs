using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetFinSessionBD.Models
{
    [Table("Evenement", Schema = "Evenements")]
    public partial class Evenement
    {
        public Evenement()
        {
            Participations = new HashSet<Participation>();
        }

        [Key]
        [Column("EvenementID")]
        public int EvenementId { get; set; }
        [StringLength(30)]
        public string Nom { get; set; } = null!;
        [Column(TypeName = "datetime")]
        public DateTime Date { get; set; }
        public int GrandPrixId { get; set; }
        [Column("EvenSpecialID")]
        public int EvenSpecialId { get; set; }
        public int CircuitId { get; set; }

        [ForeignKey("CircuitId")]
        [InverseProperty("Evenements")]
        public virtual Circuit Circuit { get; set; } = null!;
        [ForeignKey("EvenSpecialId")]
        [InverseProperty("Evenements")]
        public virtual EvenementSpecial EvenSpecial { get; set; } = null!;
        [InverseProperty("Evenement")]
        public virtual ICollection<Participation> Participations { get; set; }
    }
}
