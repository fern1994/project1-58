using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AntiDrugWeb4.Models;

namespace AntiDrugWeb4.Controllers
{
    public class evaluatesController : Controller
    {
        private antidrugdbEntities db = new antidrugdbEntities();

        // GET: evaluates
        public ActionResult Index(string searchString)
        {
            var eva = from e in db.evaluate select e;

            if (!String.IsNullOrEmpty(searchString))
            {
                eva = eva.Where(s => s.patientName.Contains(searchString));
            }
            return View(eva);
        }

        // GET: evaluates/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            evaluate evaluate = db.evaluate.Find(id);
            if (evaluate == null)
            {
                return HttpNotFound();
            }
            return View(evaluate);
        }

        // GET: evaluates/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: evaluates/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "evaluateID,patientIDCard,patientName,patientLastname,patientAge,patientAddress,evaluatePoint,drugType,evaluateResult,evaluateDate,evaluateByStaffID")] evaluate evaluate)
        {
            if (ModelState.IsValid)
            {
                db.evaluate.Add(evaluate);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(evaluate);
        }

        // GET: evaluates/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            evaluate evaluate = db.evaluate.Find(id);
            if (evaluate == null)
            {
                return HttpNotFound();
            }
            return View(evaluate);
        }

        // POST: evaluates/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "evaluateID,patientIDCard,patientName,patientLastname,patientAge,patientAddress,evaluatePoint,drugType,evaluateResult,evaluateDate,evaluateByStaffID")] evaluate evaluate)
        {
            if (ModelState.IsValid)
            {
                db.Entry(evaluate).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(evaluate);
        }

        // GET: evaluates/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            evaluate evaluate = db.evaluate.Find(id);
            if (evaluate == null)
            {
                return HttpNotFound();
            }
            return View(evaluate);
        }

        // POST: evaluates/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            evaluate evaluate = db.evaluate.Find(id);
            db.evaluate.Remove(evaluate);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
