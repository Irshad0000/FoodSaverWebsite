using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace FoodSaver
{
    // Code-behind for Dashboard page - loads user stats, recent donations and available food
    public partial class DashboardPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Redirect to login if the user is not authenticated
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                var userId = Convert.ToInt32(Session["UserId"]);
                var role = Convert.ToString(Session["Role"]);
                // Greet the logged-in user by name and read their role
                lblName.Text = Convert.ToString(Session["UserName"]);

                // Count this user's total donations and requests for the stat cards
                // Stat cards
                var donations = DbHelper.ExecuteScalar(
                    "SELECT COUNT(*) FROM Donations WHERE DonorId=@u",
                    new SqlParameter("@u", userId));
                lblDonations.Text = donations != null ? donations.ToString() : "0";

                var requests = DbHelper.ExecuteScalar(
                    "SELECT COUNT(*) FROM Requests WHERE RequestedByUserId=@u",
                    new SqlParameter("@u", userId));
                lblRequests.Text = requests != null ? requests.ToString() : "0";

                // Placeholder numbers for prototype - to be calculated from real data later
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

                // Load up to 3 pending donations from other users to show as available food
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