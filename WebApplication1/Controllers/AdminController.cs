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
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult Index()
        {
            if (User.Identity.Name == "Admin1122@admin.com")
            {
                testEntities1 db = new testEntities1();
                //var sheetID = db.tblSheets.Where(sheet => sheet.userID == userID).Select(sheet => sheet.ID).ToList()[0];
                var sheetI = db.tblSheets.ToList();
                //var data = db.tblTasks.Where(task => task.sheetID == sheetID).Select(task => task.).ToList();
                //var data=new List<tblTask>();

                List<SheetViewModel> myViewObj = new List<SheetViewModel>();
                foreach (var item in sheetI)
                {
                    SheetViewModel temp = new SheetViewModel();
                    temp.id = item.ID;
                    temp.WeekNo = item.weekNo;
                    temp.Title = item.Title;
                    temp.CreatedOn = item.creationDate.Value;
                    myViewObj.Add(temp);
                }
                return View(myViewObj);
            }
            else
            {
                return RedirectToAction("index", "TimeSheet");
            }
        }

        // GET: Admin/Details/5
        public ActionResult Details(int id)
        {
            if (User.Identity.Name == "Admin1122@admin.com")
            {
                testEntities1 db = new testEntities1();
                var sheet = db.tblSheets.Find(id);
                ViewBag.weekNo = sheet.weekNo;

                var list = db.tblTasks.Where(a => a.sheetID == id).ToList();

                List<TaskViewModel> listView = new List<TaskViewModel>();
                int sum = 0;
                foreach (var item in list)
                {
                    TaskViewModel taskView = new TaskViewModel();
                    taskView.id = item.ID;
                    taskView.title = item.Title;
                    taskView.hours = item.hours.Value;
                    sum = sum + taskView.hours;
                    string type = db.tblLookUps.FirstOrDefault(e => e.ID == item.typeID).name;
                    taskView.type = type;
                    listView.Add(taskView);
                }
                ViewBag.totalHours = sum;
                return View(listView);
            }
            else
            {
                return RedirectToAction("index", "TimeSheet");
            }
        }

        // GET: Admin/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Admin/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Admin/Edit/5
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

        // GET: Admin/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Admin/Delete/5
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