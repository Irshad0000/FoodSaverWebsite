using System;
using System.Web.UI;

namespace FoodSaver
{
    public partial class DonateSuccess : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
                Response.Redirect("Login.aspx");
        }
    }
}