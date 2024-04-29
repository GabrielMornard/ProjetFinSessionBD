using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ProjetFinSessionBD.Data;
using ProjetFinSessionBD.Models;

namespace ProjetFinSessionBD.Controllers
{
    public class PilotesController : Controller
    {
        private readonly Formule1Context _context;

        public PilotesController(Formule1Context context)
        {
            _context = context;
        }

        // GET: Pilotes
        public async Task<IActionResult> Index()
        {
            var formule1Context = _context.Pilotes.Include(p => p.Ecurie).OrderBy(x => x.Nom);
            return View(await formule1Context.ToListAsync());
        }

        // GET: Pilotes/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Pilotes == null)
            {
                return NotFound();
            }

            var pilote = await _context.Pilotes
                .Include(p => p.Ecurie)
                .FirstOrDefaultAsync(m => m.PiloteId == id);
            if (pilote == null)
            {
                return NotFound();
            }

            return View(pilote);
        }

        // GET: Pilotes/Create
        public IActionResult Create()
        {
            ViewData["EcurieId"] = new SelectList(_context.Ecuries, "EcurieId", "EcurieId");
            return View();
        }

        // POST: Pilotes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("PiloteId,Nom,Nbvictoire,EcurieId,Points")] Pilote pilote)
        {
            if (ModelState.IsValid)
            {
                _context.Add(pilote);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["EcurieId"] = new SelectList(_context.Ecuries, "EcurieId", "EcurieId", pilote.EcurieId);
            return View(pilote);
        }

        // GET: Pilotes/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Pilotes == null)
            {
                return NotFound();
            }

            var pilote = await _context.Pilotes.FindAsync(id);
            if (pilote == null)
            {
                return NotFound();
            }
            ViewData["EcurieId"] = new SelectList(_context.Ecuries, "EcurieId", "EcurieId", pilote.EcurieId);
            return View(pilote);
        }

        // POST: Pilotes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("PiloteId,Nom,Nbvictoire,EcurieId,Points")] Pilote pilote)
        {
            if (id != pilote.PiloteId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(pilote);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PiloteExists(pilote.PiloteId))
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
            ViewData["EcurieId"] = new SelectList(_context.Ecuries, "EcurieId", "EcurieId", pilote.EcurieId);
            return View(pilote);
        }

        // GET: Pilotes/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Pilotes == null)
            {
                return NotFound();
            }

            var pilote = await _context.Pilotes
                .Include(p => p.Ecurie)
                .FirstOrDefaultAsync(m => m.PiloteId == id);
            if (pilote == null)
            {
                return NotFound();
            }

            return View(pilote);
        }

        // POST: Pilotes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Pilotes == null)
            {
                return Problem("Entity set 'Formule1Context.Pilotes'  is null.");
            }
            var pilote = await _context.Pilotes.FindAsync(id);
            if (pilote != null)
            {
                _context.Pilotes.Remove(pilote);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool PiloteExists(int id)
        {
          return (_context.Pilotes?.Any(e => e.PiloteId == id)).GetValueOrDefault();
        }
    }
}
