namespace ProjetFinSessionBD.Models.ViewModel
{
    public class EcurieUploadVM
    {
        public int EcurieId { get; set; }
        public string Name { get; set; }
        public int Victoires { get; set; }


        public IFormFile? FormFile { get; set; }
        public Image? image { get; set; } = null;
    }
}
