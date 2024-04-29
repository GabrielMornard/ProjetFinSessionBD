using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetFinSessionBD.Models
{
    [Table("Transactions", Schema = "Participations")]
    public partial class Transaction
    {
        [Key]
        [Column("TransactionID")]
        public int TransactionId { get; set; }
        public int Montant { get; set; }
        [Column("piloteId")]
        public int PiloteId { get; set; }
        public int EcurieId { get; set; }

        [ForeignKey("EcurieId")]
        [InverseProperty("Transactions")]
        public virtual Ecurie Ecurie { get; set; } = null!;
        [ForeignKey("PiloteId")]
        [InverseProperty("Transactions")]
        public virtual Pilote Pilote { get; set; } = null!;
    }
}
