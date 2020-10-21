using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.DBModel;
using WebApplication1.Models;

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
            List<ProjectViewModel> vmData = new List<ProjectViewModel>();
            foreach (var item in data)
            {
                ProjectViewModel x = new ProjectViewModel();
                x.Id = item.ID;
                x.type = db.tblLookUps.Where(e=>e.ID == item.typeID.Value).Select(e => e.name).ToList()[0];
                x.name = item.name;
                vmData.Add(x);

            }
            return View(vmData);
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
        public ActionResult Create(tblProject collection)
        {
            try
            {
                // TODO: Add insert logic here
                testEntities1 db = new testEntities1();
                tblProject p = new tblProject();
                p.name = collection.name;
                p.typeID = collection.typeID;
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
            catch(Exception e)
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
