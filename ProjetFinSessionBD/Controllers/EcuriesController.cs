using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ProjetFinSessionBD.Data;
using ProjetFinSessionBD.Models;
using ProjetFinSessionBD.Models.ViewModel;

namespace ProjetFinSessionBD.Controllers
{
    public class EcuriesController : Controller
    {
        private readonly Formule1Context _context;

        public EcuriesController(Formule1Context context)
        {
            _context = context;
        }

        // GET: Ecuries
        public async Task<IActionResult> Index()
        {
                var ecuries = await _context.Ecuries.ToListAsync();

                if (ecuries == null) 
                {
                    return NotFound("Aucune Écurie de trouver!");
                }

                var ecurieViewModel = new List<EcurieViewModel>();

                foreach (var ecurie in ecuries)
                {
                    var ecurieVM = new EcurieViewModel
                    {
                        Name = ecurie.Nom,
                        Victoires = ecurie.Victoire,
                        pilotes = new List<PiloteViewModel>()
                    };

                    var pilotes = await _context.Pilotes.Where(x => x.EcurieId == ecurie.EcurieId).ToListAsync();

                    foreach (var pilote in pilotes) 
                    {
                        var piloteVM = new PiloteViewModel
                        {
                            Name = pilote.Nom,
                            Victoires = pilote.Nbvictoire,
                            Id = pilote.PiloteId
                        };

                        ecurieVM.pilotes.Add(piloteVM);
                    }
                    ecurieViewModel.Add(ecurieVM);
                }

            return View(ecurieViewModel);
        }

        //GET : Ecuries/TousLesGagants
        public async Task<IActionResult> TousLesGagants()
        {
            var gagnants = await _context.VwGagnatDevenements.ToListAsync();
            return View(gagnants);
        }

        // GET: Ecuries/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Ecuries == null)
            {
                return NotFound();
            }

            var ecurie = await _context.Ecuries
                .Include(e => e.Sponsor)
                .FirstOrDefaultAsync(m => m.EcurieId == id);
            if (ecurie == null)
            {
                return NotFound();
            }

            return View(ecurie);
        }

        // GET: Ecuries/Create
        public IActionResult Create()
        {
            ViewData["SponsorId"] = new SelectList(_context.Sponsors, "SponsorId", "SponsorId");
            return View();
        }

        // POST: Ecuries/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("EcurieId,Nom,Victoire,SponsorId")] Ecurie ecurie)
        {
            if (ModelState.IsValid)
            {
                _context.Add(ecurie);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["SponsorId"] = new SelectList(_context.Sponsors, "SponsorId", "SponsorId", ecurie.SponsorId);
            return View(ecurie);
        }

        // GET: Ecuries/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Ecuries == null)
            {
                return NotFound();
            }

            var ecurie = await _context.Ecuries.FindAsync(id);
            if (ecurie == null)
            {
                return NotFound();
            }
            ViewData["SponsorId"] = new SelectList(_context.Sponsors, "SponsorId", "SponsorId", ecurie.SponsorId);
            return View(ecurie);
        }

        // POST: Ecuries/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("EcurieId,Nom,Victoire,SponsorId")] Ecurie ecurie)
        {
            if (id != ecurie.EcurieId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(ecurie);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!EcurieExists(ecurie.EcurieId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["SponsorId"] = new SelectList(_context.Sponsors, "SponsorId", "SponsorId", ecurie.SponsorId);
            return View(ecurie);
        }

        // GET: Ecuries/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Ecuries == null)
            {
                return NotFound();
            }

            var ecurie = await _context.Ecuries
                .Include(e => e.Sponsor)
                .FirstOrDefaultAsync(m => m.EcurieId == id);
            if (ecurie == null)
            {
                return NotFound();
            }

            return View(ecurie);
        }

        // POST: Ecuries/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Ecuries == null)
            {
                return Problem("Entity set 'Formule1Context.Ecuries'  is null.");
            }
            var ecurie = await _context.Ecuries.FindAsync(id);
            if (ecurie != null)
            {
                _context.Ecuries.Remove(ecurie);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool EcurieExists(int id)
        {
          return (_context.Ecuries?.Any(e => e.EcurieId == id)).GetValueOrDefault();
        }
    }
}
