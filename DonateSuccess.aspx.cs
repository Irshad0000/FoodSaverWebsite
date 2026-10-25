using System;
using System.Web.UI;

namespace FoodSaver
{
    // Code-behind for Donate Success page - simple confirmation page with no extra logic
    public partial class DonateSuccess : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)  // Only show the success page to logged-in users
                Response.Redirect("Login.aspx");
        }
    }
}