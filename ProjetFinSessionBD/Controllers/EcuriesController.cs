﻿using System;
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
        public async Task<IActionResult> Index(FiltreVM fvm)
        {
            var ecuries = await _context.Ecuries.ToListAsync();

            if (ecuries == null)
            {
                return NotFound("Aucune Écurie de trouver!");
            }

            if (fvm.Name != null) 
            {
                ecuries = ecuries.Where(x => x.Nom == fvm.Name).ToList();
            }

            if (fvm.VictoiresMinimum != null)
            {
                ecuries = ecuries.Where(x => x.Victoire >= fvm.VictoiresMinimum).ToList();
            }

            var ecurieViewModel = new List<EcurieViewModel>();

            foreach (var ecurie in ecuries)
            {

                var ecurieVM = new EcurieViewModel
                {
                    EcurieId = ecurie.EcurieId,
                    Name = ecurie.Nom,
                    Victoires = ecurie.Victoire,
                    pilotes = new List<PiloteViewModel>(),
                    ImageUrl = _context.Images.Where(x => x.EcurieId == ecurie.EcurieId)
                                    .Select(x => x.FichierImage == null ? null : $"data:image/png;base64,{Convert.ToBase64String(x.FichierImage)}")
                                    .FirstOrDefault()
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

            fvm.Ecurie = ecurieViewModel;

            return View(fvm);
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
            return View();
        }

        // POST: Ecuries/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(EcurieUploadVM ecurieVM)
        {
            if (ModelState.IsValid)
            {
                Ecurie newEcurie = new Ecurie
                {
                    Nom = ecurieVM.Name,
                    Victoire = ecurieVM.Victoires,
                };
                _context.Add(newEcurie);
                await _context.SaveChangesAsync();

                if (ecurieVM.FormFile != null && ecurieVM.FormFile.Length >= 0) 
                {
                    using (var memoryStream = new MemoryStream())
                    {
                        await ecurieVM.FormFile.CopyToAsync(memoryStream);
                        byte[] fichierImage = memoryStream.ToArray();

                        Image newImage = new Image
                        {
                            EcurieId = newEcurie.EcurieId,
                            FichierImage = fichierImage
                        };

                        _context.Add(newImage);
                    }
                }

                await _context.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View();
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
