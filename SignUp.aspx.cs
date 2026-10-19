using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace FoodSaver
{
    public partial class SignUp : Page
    {
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtName.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtPwd.Text))
            {
                lblMsg.Text = "Please fill all required fields.";
                return;
            }

            if (txtPwd.Text != txtConfirm.Text)
            {
                lblMsg.Text = "Passwords do not match.";
                return;
            }

            if (txtPwd.Text.Length < 6)
            {
                lblMsg.Text = "Password must be at least 6 characters.";
                return;
            }

            var exists = DbHelper.ExecuteScalar(
                "SELECT COUNT(*) FROM Users WHERE Email=@e",
                new SqlParameter("@e", txtEmail.Text.Trim()));
            if (Convert.ToInt32(exists) > 0)
            {
                lblMsg.Text = "Email already registered.";
                return;
            }

            DbHelper.ExecuteNonQuery(
                "INSERT INTO Users (FullName, Email, Phone, Password, Role) VALUES (@n,@e,@p,@pw,@r)",
                new SqlParameter("@n", txtName.Text.Trim()),
                new SqlParameter("@e", txtEmail.Text.Trim()),
                new SqlParameter("@p", txtPhone.Text.Trim()),
                new SqlParameter("@pw", txtPwd.Text),
                new SqlParameter("@r", ddlRole.SelectedValue));

            Response.Redirect("Login.aspx");
        }
    }
}