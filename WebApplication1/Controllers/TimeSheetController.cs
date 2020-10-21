using ExcelDataReader;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.DBModel;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    [Authorize]
    public class TimeSheetController : Controller
    {
        // GET: TimeSheet
        public ActionResult Index()
        {
            testEntities1 db = new testEntities1();
            var userID = db.AspNetUsers.Where(a => a.UserName == User.Identity.Name).Select(a => a.Id).ToList()[0];
            //var sheetID = db.tblSheets.Where(sheet => sheet.userID == userID).Select(sheet => sheet.ID).ToList()[0];
            var sheetI = db.tblSheets.Where(sheet => sheet.userID == userID).ToList();
            //var data = db.tblTasks.Where(task => task.sheetID == sheetID).Select(task => task.).ToList();
            //var data=new List<tblTask>();

            List<SheetViewModel> myViewObj = new List<SheetViewModel>();
            foreach (var item in sheetI)
            {
                SheetViewModel temp = new SheetViewModel();
                temp.id = item.ID;
                temp.WeekNo = item.weekNo;
                temp.CreatedOn = item.creationDate.Value;
                myViewObj.Add(temp);
            }
            return View(myViewObj);
        }

        // GET: TimeSheet/Details/5
        public ActionResult Details(int id)
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

        // GET: TimeSheet/Create
        public ActionResult UploadSheet()
        {
            testEntities1 db = new testEntities1();
            var list = db.AspNetUsers.Select(c => new SelectListItem()
            {
                Text = c.UserName,
                Value = c.Id + ""
            }).ToList();
            ViewBag.userID = list;
            return View("UploadSheet");
        }

        // POST: TimeSheet/Create
        [HttpPost]
        public ActionResult UploadSheet(FormCollection collection)
        {
            try
            {

                if (ModelState.IsValid)
                {

                    string filePath = string.Empty;
                    if (Request != null)
                    {
                        HttpPostedFileBase file = Request.Files["FileUpload1"];
                        if ((file != null) && (file.ContentLength > 0) && !string.IsNullOrEmpty(file.FileName))
                        {

                            string fileName = file.FileName;
                            string fileContentType = file.ContentType;
                            string path = Server.MapPath("~/Uploads/");
                            if (!Directory.Exists(path))
                            {
                                Directory.CreateDirectory(path);
                            }
                            filePath = path + Path.GetFileName(file.FileName);
                            string extension = Path.GetExtension(file.FileName);
                            file.SaveAs(filePath);
                            Stream stream = file.InputStream;
                            // We return the interface, so that  
                            IExcelDataReader reader = null;
                            if (file.FileName.EndsWith(".xls"))
                            {
                                reader = ExcelReaderFactory.CreateBinaryReader(stream);
                            }
                            else if (file.FileName.EndsWith(".xlsx"))
                            {
                                reader = ExcelReaderFactory.CreateOpenXmlReader(stream);
                            }
                            else
                            {
                                ModelState.AddModelError("File", "This file format is not supported");
                                return RedirectToAction("ExcelUpload");
                            }
                            //reader.IsFirstRowAsColumnNames = true;
                            DataSet result = reader.AsDataSet();
                            reader.Close();
                            //delete the file from physical path after reading   
                            string filedetails = path + fileName;
                            FileInfo fileinfo = new FileInfo(filedetails);
                            if (fileinfo.Exists)
                            {
                                fileinfo.Delete();
                            }

                            testEntities1 db = new testEntities1();
                            CultureInfo ciCurr = CultureInfo.CurrentCulture;
                            var weekNum = ciCurr.Calendar.GetWeekOfYear(DateTime.Now, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday).ToString();
                            var userID = db.AspNetUsers.Where(a => a.UserName == User.Identity.Name).Select(a => a.Id).ToList()[0];

                            var sheetID = db.tblSheets.Where(s => s.userID == userID && s.weekNo == weekNum).FirstOrDefault();
                            if (sheetID == null)
                            {
                                //no record in db

                                tblSheet sheet = new tblSheet();
                                sheet.userID = userID;
                                sheet.weekNo = weekNum;
                                sheet.creationDate = DateTime.Now;
                                sheet.createdByID = User.Identity.Name;
                                sheet.updationDate = DateTime.Now;
                                sheet.updatedByID = User.Identity.Name;



                                //adding tasks

                                DataTable dt = result.Tables[0];
                                for (int i = 8; i < dt.Rows.Count; i++)
                                {
                                    var row = dt.Rows[i];
                                    var typename = row.ItemArray[2].ToString();
                                    var lookups = db.tblLookUps.Where(t => t.name == typename).FirstOrDefault();
                                    
                                    tblTask task = new tblTask();
                                    task.parentOF = null;
                                    task.Title = row.ItemArray[1].ToString();
                                    task.description = row.ItemArray[1].ToString();
                                    task.hours = Convert.ToInt32(row.ItemArray[3].ToString());

                                    task.typeID = lookups.ID;

                                    task.creationDate = DateTime.Now;
                                    task.createdByID = User.Identity.Name;
                                    task.updationDate = DateTime.Now;
                                    task.updatedByID = User.Identity.Name;
                                    sheet.tblTasks.Add(task);
                                }
                                db.tblSheets.Add(sheet);

                                ViewBag.msg = null;
                            }
                            else
                            {
                                //sheet already exist
                            }
                            db.SaveChanges();
                        }
                    }

                }

                // TODO: Add insert logic here
                return RedirectToAction("Index", "TimeSheet");
                //return RedirectToAction("UploadSheet");
            }
            catch(Exception ex)
            {
                return View();
            }
        }

        // GET: TimeSheet/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: TimeSheet/Edit/5
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

        // GET: TimeSheet/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: TimeSheet/Delete/5
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
