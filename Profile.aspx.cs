using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace FoodSaver
{
    public partial class Profile : Page
    {
        public string RoleClass { get; set; } = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack) LoadProfile(); 
        }

        private void LoadProfile()
        {
            var userId = Convert.ToInt32(Session["UserId"]);
            var dt = DbHelper.ExecuteQuery("SELECT * FROM Users WHERE Id=@u",
                new SqlParameter("@u", userId));

            if (dt.Rows.Count == 0) { Response.Redirect("Login.aspx"); return; }

            var r = dt.Rows[0];
            lblName.Text = Convert.ToString(r["FullName"]);
            lblEmail.Text = Convert.ToString(r["Email"]);
            lblPhone.Text = Convert.ToString(r["Phone"]);
            lblRole.Text = Convert.ToString(r["Role"]);
            lblJoined.Text = Convert.ToDateTime(r["JoinedOn"]).ToString("dd MMM yyyy");

            txtName.Text = Convert.ToString(r["FullName"]);
            txtEmail.Text = Convert.ToString(r["Email"]);
            txtPhone.Text = Convert.ToString(r["Phone"]);
            txtAddress.Text = Convert.ToString(r["Address"]);

            var initial = lblName.Text.Length > 0 ? lblName.Text.Substring(0, 1).ToUpper() : "?";
            initialSpan.InnerHtml = initial;

            var role = Convert.ToString(r["Role"]).ToLower();
            RoleClass = role; // donor / ngo / admin
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var userId = Convert.ToInt32(Session["UserId"]);
            DbHelper.ExecuteNonQuery(
                "UPDATE Users SET FullName=@n, Phone=@p, Address=@a WHERE Id=@u",
                new SqlParameter("@n", txtName.Text.Trim()),
                new SqlParameter("@p", txtPhone.Text.Trim()),
                new SqlParameter("@a", txtAddress.Text.Trim()),
                new SqlParameter("@u", userId));

            Session["UserName"] = txtName.Text.Trim();

            lblMsg.CssClass = "d-block mb-3 text-success";
            lblMsg.Text = "Profile updated successfully.";
            LoadProfile();
        }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            // focuses the user's attention there and shows a hint.
            lblMsg.CssClass = "d-block mb-3 text-success";
            lblMsg.Text = "You can edit your details in the form on the right, then click Save Changes.";
        }

    }
}