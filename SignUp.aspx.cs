using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace FoodSaver
{
    public partial class SignUp : Page
    {
        protected void cvPwdLength_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(args.Value) && args.Value.Length >= 6;
        }
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

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