using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace WebApplicationtask3.Models
{
    public class DbManager
    {
        SqlConnection connection;
        public DbManager()
        {
            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        }
        public int ExecuteInsertUpdateDelete(string proc, SqlParameter[] parameters)
        {
            SqlCommand cmd = new SqlCommand(proc, connection);
            cmd.CommandType = CommandType.StoredProcedure;

            foreach (SqlParameter parameter in parameters)
            {
                if (parameter.Value != null)
                    cmd.Parameters.Add(parameter);
            }
            connection.Open();
            int s = cmd.ExecuteNonQuery();
            connection.Close();
            return s;

        }
        public DataTable GetDataTable(string proc, SqlParameter[] parameters)
        {
            SqlCommand cmd = new SqlCommand(proc, connection);
            cmd.CommandType = CommandType.StoredProcedure;
            foreach (SqlParameter parameter in parameters)
            {
                if (parameter.Value != null)
                {
                    cmd.Parameters.Add(parameter);
                }
            }
            DataTable dt = new DataTable();
            SqlDataAdapter sqld = new SqlDataAdapter(cmd);
            sqld.Fill(dt);

            return dt;

        }

    }
}