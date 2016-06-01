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
    public class alertmeetingsController : Controller
    {
        private antidrugdbEntities db = new antidrugdbEntities();

        // GET: alertmeetings
        public ActionResult Index(string searchString)
        {
            var alert = from e in db.alertmeeting select e;

            if (!String.IsNullOrEmpty(searchString))
            {
                alert = alert.Where(s => s.meetingTitle.Contains(searchString));
            }
            return View(alert);
        }

        // GET: alertmeetings/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            alertmeeting alertmeeting = db.alertmeeting.Find(id);
            if (alertmeeting == null)
            {
                return HttpNotFound();
            }
            return View(alertmeeting);
        }

        // GET: alertmeetings/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: alertmeetings/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "alertID,meetingDate,meetingTitle,meetingDetail,meetingSummary,meetingByStaffID")] alertmeeting alertmeeting)
        {
            if (ModelState.IsValid)
            {
                db.alertmeeting.Add(alertmeeting);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(alertmeeting);
        }

        // GET: alertmeetings/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            alertmeeting alertmeeting = db.alertmeeting.Find(id);
            if (alertmeeting == null)
            {
                return HttpNotFound();
            }
            return View(alertmeeting);
        }

        // POST: alertmeetings/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "alertID,meetingDate,meetingTitle,meetingDetail,meetingSummary,meetingByStaffID")] alertmeeting alertmeeting)
        {
            if (ModelState.IsValid)
            {
                db.Entry(alertmeeting).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(alertmeeting);
        }

        // GET: alertmeetings/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            alertmeeting alertmeeting = db.alertmeeting.Find(id);
            if (alertmeeting == null)
            {
                return HttpNotFound();
            }
            return View(alertmeeting);
        }

        // POST: alertmeetings/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            alertmeeting alertmeeting = db.alertmeeting.Find(id);
            db.alertmeeting.Remove(alertmeeting);
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
