using System;
using System.Web.UI;

namespace FoodSaver
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Public master: no auth check
        }
    }
}