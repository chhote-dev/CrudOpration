using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplicationtask3.Models;

namespace WebApplicationtask3.Controllers
{
    public class DepartmentController : Controller
    {
        // GET: Department
        DbManager db = new DbManager();
        public ActionResult Index()
        {
            SqlParameter[] sqls = new SqlParameter[]
               {
                new SqlParameter("@action",2)
               };
            DataTable dt = db.GetDataTable("sp_department", sqls);
            ViewBag.dt = dt;
            return View();
        }
        [HttpPost]
        public ActionResult Index(departmentmodal dm)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("action",1),
            new SqlParameter("@DeptName",dm.deptname)
            };
            db.ExecuteInsertUpdateDelete("sp_department", parameters);
            //return RedirectToAction("index");
            return Content("<script>alert('Data Inserted sucessfully'); location.href='/department/index';</script>");
        }


        public ActionResult EditRecord(int? id)
        {
            SqlParameter[] parameters = new SqlParameter[]
                {
                new SqlParameter ("action",5),
                new SqlParameter("@Deptid",id)
                };
            DataTable dt = db.GetDataTable("sp_department", parameters);
            if (dt.Rows.Count > 0)
            {
                ViewBag.rows = dt.Rows[0];
            }

            return View();
        }
        [HttpPost]
        public ActionResult EditRecord(departmentmodal depm)
        {
            SqlParameter[] parameters = new SqlParameter[]
                {
                new SqlParameter("action",3),
                new SqlParameter("Deptid",depm.deptid),
                new SqlParameter("DeptName",depm.deptname)

                };
            db.ExecuteInsertUpdateDelete("sp_department", parameters);
            return Content("<script>alert('Data Inserted sucessfully'); location.href='/department/index';</script>");

        }
        public ActionResult DeleteRecord(int? id)
        {


            SqlParameter[] parameters = new SqlParameter[]
                {
                new SqlParameter ("action",4),
                new SqlParameter("deptid",id)

                };
            db.ExecuteInsertUpdateDelete("sp_department", parameters);
            return Content("<script>alert('Data Delete sucessfully'); location.href='/department/index';</script>");

        }



    }
}