using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace FoodSaver
{
    public partial class AdminDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null || Convert.ToString(Session["Role"]) != "Admin")
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack) LoadStats();
        }

        private void LoadStats()
        {
            lblUsers.Text = Convert.ToString(DbHelper.ExecuteScalar("SELECT COUNT(*) FROM Users"));
            lblDonations.Text = Convert.ToString(DbHelper.ExecuteScalar("SELECT COUNT(*) FROM Donations"));
            lblRequests.Text = Convert.ToString(DbHelper.ExecuteScalar("SELECT COUNT(*) FROM Requests"));
            lblNGOs.Text = Convert.ToString(DbHelper.ExecuteScalar("SELECT COUNT(*) FROM Users WHERE Role='NGO'"));

            var dtDon = DbHelper.ExecuteQuery(@"
                SELECT TOP 3 d.*, u.FullName AS DonorName
                FROM Donations d
                LEFT JOIN Users u ON u.Id = d.DonorId
                ORDER BY d.CreatedAt DESC");
            rptRecentDonations.DataSource = dtDon;
            rptRecentDonations.DataBind();

            var dtReq = DbHelper.ExecuteQuery(@"
                SELECT TOP 3 r.*, u.FullName AS RequesterName
                FROM Requests r
                LEFT JOIN Users u ON u.Id = r.RequestedByUserId
                ORDER BY r.CreatedAt DESC");
            rptRecentRequests.DataSource = dtReq;
            rptRecentRequests.DataBind();
        }
    }
}