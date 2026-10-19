using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace FoodSaver
{
    public static class DbHelper
    {
        public static SqlConnection GetConnection()
        {
            var conn = new SqlConnection(
                ConfigurationManager.ConnectionStrings["FoodSaverDb"].ConnectionString);
            conn.Open();
            return conn;
        }

        public static DataTable ExecuteQuery(string sql, params SqlParameter[] prms)
        {
            using (var conn = GetConnection())
            using (var cmd = new SqlCommand(sql, conn))
            {
                if (prms != null) cmd.Parameters.AddRange(prms);
                var dt = new DataTable();
                new SqlDataAdapter(cmd).Fill(dt);
                return dt;
            }
        }

        public static int ExecuteNonQuery(string sql, params SqlParameter[] prms)
        {
            using (var conn = GetConnection())
            using (var cmd = new SqlCommand(sql, conn))
            {
                if (prms != null) cmd.Parameters.AddRange(prms);
                return cmd.ExecuteNonQuery();
            }
        }

        public static object ExecuteScalar(string sql, params SqlParameter[] prms)
        {
            using (var conn = GetConnection())
            using (var cmd = new SqlCommand(sql, conn))
            {
                if (prms != null) cmd.Parameters.AddRange(prms);
                return cmd.ExecuteScalar();
            }
        }
    }
}