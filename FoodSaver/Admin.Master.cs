using System;
using System.Web.UI;

namespace FoodSaver
{
    public partial class AdminMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null || Convert.ToString(Session["Role"]) != "Admin")
                Response.Redirect("Login.aspx");
        }
    }
}