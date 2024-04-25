using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetFinSessionBD.Models
{
    [Keyless]
    public partial class VwGagnatDevenement
    {
        [Column("Nom de l'évênement")]
        [StringLength(30)]
        public string NomDeLÉvênement { get; set; } = null!;
        [StringLength(30)]
        public string Circuit { get; set; } = null!;
        [Column("Gagnant du GP")]
        [StringLength(30)]
        public string GagnantDuGp { get; set; } = null!;
        [Column("L'organisation")]
        [StringLength(30)]
        public string LOrganisation { get; set; } = null!;
        [Column("EvenementID")]
        public int EvenementId { get; set; }
        [Column("GrandPrixID")]
        public int GrandPrixId { get; set; }
        [Column("EvenSpecialID")]
        public int EvenSpecialId { get; set; }
        public int CircuitId { get; set; }
    }
}
