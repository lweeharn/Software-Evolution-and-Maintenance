using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the selected ticket ID
            GridViewRow row = gvTicket.SelectedRow;
            string ticketID = row.Cells[0].Text; // Assuming ticketID is in the second cell
            string userID = row.Cells[6].Text;

            // Redirect to another page with the ticketID as a query parameter
            Response.Redirect($"AdResponseTicket.aspx?ticketID={ticketID}&userID={userID}");
        }


    }
}