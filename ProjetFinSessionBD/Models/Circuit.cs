using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetFinSessionBD.Models
{
    [Table("Circuit", Schema = "Evenements")]
    public partial class Circuit
    {
        public Circuit()
        {
            Evenements = new HashSet<Evenement>();
        }

        [Key]
        public int CircuitId { get; set; }
        [StringLength(30)]
        public string Nom { get; set; } = null!;
        [StringLength(30)]
        public string Pays { get; set; } = null!;
        [StringLength(30)]
        public string Ville { get; set; } = null!;

        [InverseProperty("Circuit")]
        public virtual ICollection<Evenement> Evenements { get; set; }
    }
}
