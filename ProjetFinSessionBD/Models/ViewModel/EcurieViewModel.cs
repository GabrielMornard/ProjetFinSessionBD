﻿namespace ProjetFinSessionBD.Models.ViewModel
{
    public class EcurieViewModel
    {
        public int EcurieId { get; set; }
        public string Name { get; set; }
        public int Victoires { get; set; }
        public List<PiloteViewModel> pilotes { get; set; }

        public string? ImageUrl { get; set; }
    }
}