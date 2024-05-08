namespace ProjetFinSessionBD.Models.ViewModel
{
    public class CircuitViewModel
    {
        public string NomCircuit { get; set; }
        public string Pays { get; set; }
        public string Ville { get; set; }
        public string NomEvenement { get; set; }
        public DateTime date { get; set; }
        public int CircuitId { get; set; }
        public int EvenementId { get; set; }
    }
}
