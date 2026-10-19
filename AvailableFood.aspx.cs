using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodSaver
{
    public partial class AvailableFood : Page
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
                "SELECT * FROM Donations WHERE Status='Pending' AND DonorId<>@u ORDER BY CreatedAt DESC",
                new SqlParameter("@u", userId));

            if (dt.Rows.Count > 0)
            {
                rptFood.DataSource = dt;
                rptFood.DataBind();
            }
            else
            {
                lblNone.Visible = true;
            }
        }

        protected void Claim_Click(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            var donationId = Convert.ToInt32(btn.CommandArgument);
            var userId = Convert.ToInt32(Session["UserId"]);

            DbHelper.ExecuteNonQuery(
                "UPDATE Donations SET Status='Completed', ClaimedByNGOId=@n WHERE Id=@d",
                new SqlParameter("@n", userId),
                new SqlParameter("@d", donationId));

            Response.Redirect("MyDonations.aspx");
        }
    }
}