using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetFinSessionBD.Models
{
    [Table("EvenementSpecial", Schema = "Evenements")]
    public partial class EvenementSpecial
    {
        public EvenementSpecial()
        {
            Evenements = new HashSet<Evenement>();
        }

        [Key]
        [Column("EvenSpecialID")]
        public int EvenSpecialId { get; set; }
        [StringLength(30)]
        public string Organisation { get; set; } = null!;

        [InverseProperty("EvenSpecial")]
        public virtual ICollection<Evenement> Evenements { get; set; }
    }
}
