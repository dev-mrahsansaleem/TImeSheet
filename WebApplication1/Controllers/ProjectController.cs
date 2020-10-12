using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.DBModel;

namespace WebApplication1.Controllers
{
    [Authorize]
    public class ProjectController : Controller
    {
        // GET: Project
        public ActionResult Index()
        {
            testEntities1 db = new testEntities1();
            var data = db.tblProjects.ToList();
            ViewBag.data = data;
            return View(data);
        }

        // GET: Project/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Project/Create
        public ActionResult Create()
        {
            testEntities1 db = new testEntities1();
            var list = db.tblLookUps.Where(a => a.cateegory.Equals("project")).Select(c => new SelectListItem()
            {
                Text = c.name,
                Value = c.ID+""
            }).ToList();
            ViewBag.typeID = list; 
            return View();
        }

        // POST: Project/Create
        [HttpPost]
        [Authorize]
        public ActionResult Create(ProjectViewModel collection)
        {
            try
            {
                // TODO: Add insert logic here
                testEntities1 db = new testEntities1();
                tblProject p = new tblProject();
                p.ID = 45;
                p.name = collection.name;
                p.typeID = collection.typeId;
                p.description = collection.description;
                var name = User.Identity.Name;
                p.creationDate = DateTime.Now;
                p.createdByID = User.Identity.Name;
                p.updationDate = DateTime.Now;
                p.updatedByID = User.Identity.Name;
                db.tblProjects.Add(p);
                db.SaveChanges();


                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Project/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Project/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Project/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Project/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
