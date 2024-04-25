using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetFinSessionBD.Models
{
    [Table("Participation", Schema = "Participations")]
    public partial class Participation
    {
        [Key]
        public int ParticipationId { get; set; }
        [Column("EcurieID")]
        public int EcurieId { get; set; }
        [Column("PiloteID")]
        public int PiloteId { get; set; }
        [Column("EvenementID")]
        public int EvenementId { get; set; }

        [ForeignKey("EcurieId")]
        [InverseProperty("Participations")]
        public virtual Ecurie Ecurie { get; set; } = null!;
        [ForeignKey("EvenementId")]
        [InverseProperty("Participations")]
        public virtual Evenement Evenement { get; set; } = null!;
        [ForeignKey("PiloteId")]
        [InverseProperty("Participations")]
        public virtual Pilote Pilote { get; set; } = null!;
    }
}
