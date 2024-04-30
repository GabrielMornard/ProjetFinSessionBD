using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using ProjetFinSessionBD.Data;
using ProjetFinSessionBD.Models;
using ProjetFinSessionBD.Models.ViewModel;

namespace ProjetFinSessionBD.Controllers
{
    public class TransactionsController : Controller
    {
        private readonly Formule1Context _context;

        public TransactionsController(Formule1Context context)
        {
            _context = context;
        }

        // GET: Transactions
        public async Task<IActionResult> Index()
        {
            List<TransactionViewModel> decryptedTransactions = new List<TransactionViewModel>();

            foreach (var transaction in _context.Transactions)
            {
                string query = "EXEC Participations.USP_DechiffrementTransactions @TransactionId";

                List<SqlParameter> parameters = new List<SqlParameter>
                {
                    new SqlParameter{ParameterName = "@Montant", Value = transaction.Montant },
                    new SqlParameter{ParameterName = "@PiloteId", Value = transaction.PiloteId },
                    new SqlParameter{ParameterName = "@EcurieId", Value = transaction.EcurieId }
                };

                var decryptedData = await _context.Database.ExecuteSqlRawAsync(query, parameters);

                TransactionViewModel decryptedTransaction = new TransactionViewModel
                {
                    //Montant = decryptedData.Montant,
                    //PiloteId = decryptedData.PiloteId,
                    //EcurieId = decryptedData.EcurieId
                };

                decryptedTransactions.Add(decryptedTransaction);
            }

            return View(decryptedTransactions);
        }


        // GET: Transactions/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Transactions == null)
            {
                return NotFound();
            }

            var transaction = await _context.Transactions
                .Include(t => t.Ecurie)
                .Include(t => t.Pilote)
                .FirstOrDefaultAsync(m => m.TransactionId == id);
            if (transaction == null)
            {
                return NotFound();
            }

            return View(transaction);
        }

        // GET: Transactions/Create
        public IActionResult Create()
        {
            List<Pilote> pilotes = _context.Pilotes.ToList();
            List<Ecurie> ecuries = _context.Ecuries.ToList();

            ViewBag.Pilotes = pilotes;
            ViewBag.Ecuries = ecuries;

            return View();
        }



        // POST: Transactions/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(TransactionViewModel transactionViewModel)
        {
            if (ModelState.IsValid)
            {
                Transaction transaction = new Transaction
                {
                    Montant = transactionViewModel.Montant,
                    PiloteId = transactionViewModel.PiloteId,
                    EcurieId = transactionViewModel.EcurieId
                };

                string query = "EXEC Participations.USP_ChiffrementTransactions @Montant, @PiloteId, @EcurieId";

                List<SqlParameter> parameters = new List<SqlParameter>
                {
                    new SqlParameter{ParameterName = "@Montant", Value = transaction.Montant },
                    new SqlParameter{ParameterName = "@PiloteId", Value = transaction.PiloteId },
                    new SqlParameter{ParameterName = "@EcurieId", Value = transaction.EcurieId }
                };

                await _context.Database.ExecuteSqlRawAsync(query, parameters);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }

            List<Pilote> pilotes = _context.Pilotes.ToList();
            List<Ecurie> ecuries = _context.Ecuries.ToList();

            ViewBag.Pilotes = pilotes;
            ViewBag.Ecuries = ecuries;
            return View(transactionViewModel);
        }

        // POST: Transactions/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("TransactionId,Montant,PiloteId,EcurieId")] Transaction transaction)
        {
            if (id != transaction.TransactionId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(transaction);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TransactionExists(transaction.TransactionId))
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
            ViewData["EcurieId"] = new SelectList(_context.Ecuries, "EcurieId", "EcurieId", transaction.EcurieId);
            ViewData["PiloteId"] = new SelectList(_context.Pilotes, "PiloteId", "PiloteId", transaction.PiloteId);
            return View(transaction);
        }

        // GET: Transactions/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Transactions == null)
            {
                return NotFound();
            }

            var transaction = await _context.Transactions
                .Include(t => t.Ecurie)
                .Include(t => t.Pilote)
                .FirstOrDefaultAsync(m => m.TransactionId == id);
            if (transaction == null)
            {
                return NotFound();
            }

            return View(transaction);
        }

        // POST: Transactions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Transactions == null)
            {
                return Problem("Entity set 'Formule1Context.Transactions'  is null.");
            }
            var transaction = await _context.Transactions.FindAsync(id);
            if (transaction != null)
            {
                _context.Transactions.Remove(transaction);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool TransactionExists(int id)
        {
          return (_context.Transactions?.Any(e => e.TransactionId == id)).GetValueOrDefault();
        }
    }
}
