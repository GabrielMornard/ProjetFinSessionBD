using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ProjetFinSessionBD.Models
{
    [Table("TransactionsSimplifie", Schema = "Participations")]
    public partial class TransactionsSimplifie
    {
        [Key]
        [Column("TransactionID")]
        public int TransactionId { get; set; }
        [StringLength(30)]
        [Unicode(false)]
        public string Montant { get; set; } = null!;
        [Column("piloteId")]
        public int PiloteId { get; set; }
        public int EcurieId { get; set; }
    }
}
