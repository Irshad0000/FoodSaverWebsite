using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace FoodSaver
{
    public partial class ChangePassword : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
                Response.Redirect("Login.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            lblMsg.CssClass = "d-block mb-3 text-danger";

            if (string.IsNullOrWhiteSpace(txtCurrent.Text) ||
                string.IsNullOrWhiteSpace(txtNew.Text))
            {
                lblMsg.Text = "Please fill all fields.";
                return;
            }

            if (txtNew.Text != txtConfirm.Text)
            {
                lblMsg.Text = "New passwords do not match.";
                return;
            }

            if (txtNew.Text.Length < 6)
            {
                lblMsg.Text = "New password must be at least 6 characters.";
                return;
            }

            var userId = Convert.ToInt32(Session["UserId"]);
            var dt = DbHelper.ExecuteQuery("SELECT Password FROM Users WHERE Id=@u",
                new SqlParameter("@u", userId));

            if (dt.Rows.Count == 0) { Response.Redirect("Login.aspx"); return; }

            var currentDb = Convert.ToString(dt.Rows[0]["Password"]);
            if (currentDb != txtCurrent.Text)
            {
                lblMsg.Text = "Current password is incorrect.";
                return;
            }

            DbHelper.ExecuteNonQuery(
                "UPDATE Users SET Password=@p WHERE Id=@u",
                new SqlParameter("@p", txtNew.Text),
                new SqlParameter("@u", userId));

            lblMsg.CssClass = "d-block mb-3 text-success";
            lblMsg.Text = "Password changed successfully.";
            txtCurrent.Text = txtNew.Text = txtConfirm.Text = "";
        }
    }
}