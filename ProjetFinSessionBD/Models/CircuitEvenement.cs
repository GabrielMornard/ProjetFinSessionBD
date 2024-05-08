using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetFinSessionBD.Models
{
    [Keyless]
    [Table("CircuitEvenement", Schema = "Evenements")]
    public partial class CircuitEvenement
    {
        [StringLength(30)]
        public string NomCircuit { get; set; } = null!;
        [StringLength(30)]
        public string Pays { get; set; } = null!;
        [StringLength(30)]
        public string Ville { get; set; } = null!;
        [StringLength(30)]
        public string NomEvenement { get; set; } = null!;
        [Column(TypeName = "datetime")]
        public DateTime Date { get; set; }
    }
}
