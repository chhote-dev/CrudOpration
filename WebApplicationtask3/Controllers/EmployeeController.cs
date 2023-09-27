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
    public class EmployeeController : Controller
    {
        // GET: Employee
        DbManager db = new DbManager();
        public ActionResult Employee()
        {
            SqlParameter[] parameters1 = new SqlParameter[]
           {
                new SqlParameter("@action",2)

           };
            DataTable d1 = db.GetDataTable("sp_department", parameters1);
            ViewBag.d1 = d1;
            
            // for data binding
            SqlParameter[] parameters = new SqlParameter[]
                {
                new SqlParameter("@action",4)
                };
            DataTable dt = db.GetDataTable("sp_employee", parameters);
            ViewBag.dt = dt;
            return View();
        }
        [HttpPost]
        public ActionResult Employee(employeemodal em)
        {
            SqlParameter[] sql = new SqlParameter[]
                {
                    new SqlParameter("action",1),
                    new SqlParameter("@Empname",em.empname),
                    new SqlParameter("@City",em.city),
                    new SqlParameter("@Salary",em.salary),
                    new SqlParameter("@Deptid",em.deptid)
                };
            db.ExecuteInsertUpdateDelete("sp_employee", sql);
            return Content("<script>alert('Employee Data Inserted sucessfully'); location.href='/Employee/employee';</script>");
        }

        public ActionResult UpdateRecord(int? id)
        {

            SqlParameter[] parameters1 = new SqlParameter[]
         {
                new SqlParameter("@action",2)

         };
            DataTable d1 = db.GetDataTable("sp_department", parameters1);
            ViewBag.d1 = d1;// for data binding

            SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action",5),
                new SqlParameter("@Empid",id)
            };
            DataTable dt = db.GetDataTable("sp_employee", parameter);
            if (dt.Rows.Count > 0)
            {
                ViewBag.rows = dt.Rows[0];

            }

            return View();
        }
        [HttpPost]
        public ActionResult UpdateRecord(employeemodal empm1)
        {
            SqlParameter[] parameters = new SqlParameter[]
                {
                new SqlParameter ("@action",2),
                new SqlParameter("@Empid",empm1.emptid),
                new SqlParameter("@Empname",empm1.empname),
                new SqlParameter("@City",empm1.city),
                new SqlParameter("@Salary",empm1.salary),
                new SqlParameter("@Deptid",empm1.deptid)
                };
            db.ExecuteInsertUpdateDelete("sp_employee", parameters);
            return Content("<script>alert('Employee Data Update sucessfully'); location.href='/Employee/employee';</script>");
        }

        public ActionResult DeleteEmployee(int? id)
        {
            SqlParameter[] parameters = new SqlParameter[]
                {
                new SqlParameter("@action",3),
                new SqlParameter("@Empid",id)
                };
            db.ExecuteInsertUpdateDelete("sp_employee", parameters);
            return Content("<script>alert(' Employee Data Delete sucessfully'); location.href='/Employee/employee';</script>");
        }


    }
}