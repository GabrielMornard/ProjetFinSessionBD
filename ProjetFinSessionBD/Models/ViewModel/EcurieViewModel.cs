namespace ProjetFinSessionBD.Models.ViewModel
{
    public class EcurieViewModel
    {
        public string Name { get; set; }
        public int Victoires { get; set; }
        public List<PiloteViewModel> pilotes { get; set; }
    }
}