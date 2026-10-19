using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace FoodSaver
{
    public partial class DashboardPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                var userId = Convert.ToInt32(Session["UserId"]);
                var role = Convert.ToString(Session["Role"]);
                lblName.Text = Convert.ToString(Session["UserName"]);

                // Stat cards
                var donations = DbHelper.ExecuteScalar(
                    "SELECT COUNT(*) FROM Donations WHERE DonorId=@u",
                    new SqlParameter("@u", userId));
                lblDonations.Text = donations != null ? donations.ToString() : "0";

                var requests = DbHelper.ExecuteScalar(
                    "SELECT COUNT(*) FROM Requests WHERE RequestedByUserId=@u",
                    new SqlParameter("@u", userId));
                lblRequests.Text = requests != null ? requests.ToString() : "0";

                // Simple derived numbers (mocked for prototype)
                lblMeals.Text = "08";
                lblPeople.Text = "120";

                // Recent donations (this user)
                var dtDon = DbHelper.ExecuteQuery(
                    "SELECT TOP 3 * FROM Donations WHERE DonorId=@u ORDER BY CreatedAt DESC",
                    new SqlParameter("@u", userId));
                if (dtDon.Rows.Count > 0)
                {
                    rptDonations.DataSource = dtDon;
                    rptDonations.DataBind();
                }
                else
                {
                    lblNoDonations.Visible = true;
                }

                // Available food (pending, not mine)
                var dtAv = DbHelper.ExecuteQuery(
                    "SELECT TOP 3 * FROM Donations WHERE Status='Pending' AND DonorId<>@u ORDER BY CreatedAt DESC",
                    new SqlParameter("@u", userId));
                if (dtAv.Rows.Count > 0)
                {
                    rptAvailable.DataSource = dtAv;
                    rptAvailable.DataBind();
                }
                else
                {
                    lblNoAvailable.Visible = true;
                }
            }
        }
    }
}