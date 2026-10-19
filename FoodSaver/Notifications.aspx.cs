using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace FoodSaver
{
    public partial class Notifications : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack) Bind();
        }

        private void Bind()
        {
            var userId = Convert.ToInt32(Session["UserId"]);
            var dt = DbHelper.ExecuteQuery(
                "SELECT * FROM Notifications WHERE UserId=@u ORDER BY CreatedAt DESC",
                new SqlParameter("@u", userId));

            if (dt.Rows.Count > 0)
            {
                rptNotif.DataSource = dt;
                rptNotif.DataBind();
            }
            else
            {
                lblNone.Visible = true;
            }
        }

        protected string GetIconClass(object icon)
        {
            var i = Convert.ToString(icon);
            if (i == "🚚" || i == "✅") return "green";
            return "";
        }

        protected string TimeAgo(DateTime dt)
        {
            var span = DateTime.Now - dt;
            if (span.TotalSeconds < 60) return "just now";
            if (span.TotalMinutes < 60) return ((int)span.TotalMinutes) + " mins ago";
            if (span.TotalHours < 24) return ((int)span.TotalHours) + (span.TotalHours < 2 ? " hour ago" : " hours ago");
            if (span.TotalDays < 30) return ((int)span.TotalDays) + (span.TotalDays < 2 ? " day ago" : " days ago");
            return dt.ToString("dd MMM yyyy");
        }

        protected void lnkMarkAll_Click(object sender, EventArgs e)
        {
            var userId = Convert.ToInt32(Session["UserId"]);
            DbHelper.ExecuteNonQuery(
                "UPDATE Notifications SET IsRead=1 WHERE UserId=@u",
                new SqlParameter("@u", userId));

            Response.Redirect("Notifications.aspx");
        }
    }
}