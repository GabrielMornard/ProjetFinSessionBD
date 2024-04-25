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
            var formule1Context = _context.Ecuries.Include(e => e.Sponsor);
            return View(await formule1Context.ToListAsync());
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
