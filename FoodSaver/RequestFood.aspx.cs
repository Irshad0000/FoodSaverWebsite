using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace FoodSaver
{
    public partial class RequestFood : Page
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
                txtRequiredDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lblMsg.CssClass = "d-block mb-3 text-danger";

            if (string.IsNullOrWhiteSpace(ddlFoodType.SelectedValue) ||
                string.IsNullOrWhiteSpace(txtQuantity.Text) ||
                string.IsNullOrWhiteSpace(txtAddress.Text))
            {
                lblMsg.Text = "Please fill all required fields.";
                return;
            }

            var urgency = rbHigh.Checked ? "High"
                        : rbMedium.Checked ? "Medium"
                        : "Low";

            var userId = Convert.ToInt32(Session["UserId"]);

            DbHelper.ExecuteNonQuery(@"
                INSERT INTO Requests
                  (RequestedByUserId, FoodType, Category, Quantity,
                   RequiredDate, Address, Notes, Urgency, Status)
                VALUES
                  (@u, @t, @c, @q, @rd, @ad, @n, @ur, 'Pending')",
                new SqlParameter("@u", userId),
                new SqlParameter("@t", ddlFoodType.SelectedValue),
                new SqlParameter("@c", string.IsNullOrEmpty(ddlCategory.SelectedValue)
                                          ? (object)DBNull.Value
                                          : ddlCategory.SelectedValue),
                new SqlParameter("@q", txtQuantity.Text.Trim()),
                new SqlParameter("@rd", string.IsNullOrWhiteSpace(txtRequiredDate.Text)
                                          ? (object)DBNull.Value
                                          : DateTime.Parse(txtRequiredDate.Text)),
                new SqlParameter("@ad", txtAddress.Text.Trim()),
                new SqlParameter("@n", txtNotes.Text.Trim()),
                new SqlParameter("@ur", urgency));

            Response.Redirect("RequestSuccess.aspx");
        }
    }
}