using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace FoodSaver
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["UserId"] != null)
            {
                var role = Convert.ToString(Session["Role"]);
                Response.Redirect(role == "Admin" ? "AdminDashboard.aspx" : "Dashboard.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            var dt = DbHelper.ExecuteQuery(
                "SELECT TOP 1 * FROM Users WHERE Email=@e AND Password=@p",
                new SqlParameter("@e", txtEmail.Text.Trim()),
                new SqlParameter("@p", txtPwd.Text));

            if (dt.Rows.Count == 0)
            {
                lblMsg.Text = "Invalid email or password.";
                return;
            }

            var row = dt.Rows[0];
            Session["UserId"] = row["Id"];
            Session["UserName"] = row["FullName"];
            Session["Role"] = row["Role"];

            var role = row["Role"].ToString();
            Response.Redirect(role == "Admin" ? "AdminDashboard.aspx" : "Dashboard.aspx");
        }
    }
}