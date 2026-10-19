using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace FoodSaver
{
    public partial class ForgotPassword : Page
    {
        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                lblMsg.CssClass = "text-danger d-block mb-2";
                lblMsg.Text = "Please enter your email address.";
                return;
            }

            var exists = DbHelper.ExecuteScalar(
                "SELECT COUNT(*) FROM Users WHERE Email=@e",
                new SqlParameter("@e", txtEmail.Text.Trim()));

            // We show the same message either way (security best practice)
            lblMsg.CssClass = "text-success d-block mb-2";
            lblMsg.Text = "If an account exists for that email, a reset link has been sent.";
        }
    }
}