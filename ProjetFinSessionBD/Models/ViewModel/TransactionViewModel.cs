﻿namespace ProjetFinSessionBD.Models.ViewModel
{
    public class TransactionViewModel
    {
        public int Id { get; set; }
        public string Montant { get; set; }
        public int PiloteId { get; set; }
        public int EcurieId { get; set; }
    }
}
