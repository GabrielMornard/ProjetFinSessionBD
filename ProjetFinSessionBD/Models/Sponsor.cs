using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetFinSessionBD.Models
{
    [Table("Sponsor", Schema = "Participations")]
    public partial class Sponsor
    {
        public Sponsor()
        {
            Ecuries = new HashSet<Ecurie>();
        }

        [Key]
        [Column("SponsorID")]
        public int SponsorId { get; set; }
        [StringLength(30)]
        public string Nom { get; set; } = null!;
        public int Budget { get; set; }

        [InverseProperty("Sponsor")]
        public virtual ICollection<Ecurie> Ecuries { get; set; }
    }
}
