using System.ComponentModel.DataAnnotations;

namespace ProjetFinSessionBD.Models.ViewModel
{
    public class FiltreVM
    {
        public List<EcurieViewModel> Ecurie { get; set; }

        [Range(1, int.MaxValue)]
        public int VictoiresMinimum { get; set; } = 1;


        public string? Name { get; set; } 
    }
}
