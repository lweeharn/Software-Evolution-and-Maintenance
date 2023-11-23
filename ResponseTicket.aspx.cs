using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Assignment
{
    public partial class ResponseTicket : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["ticketID"] != null)
                {
                    string ticketID = Request.QueryString["ticketID"];
                    string subject = Request.QueryString["subject"];
                    string content = Request.QueryString["content"];
                    string status = Request.QueryString["status"];
                    lblTicketIDValue.Text = ticketID;
                    lblSucjectValue.Text = subject;
                    lblContentValue.Text = content;
                    lblStatusValue.Text = status;
                    FetchAndDisplayResponseData(ticketID);
                }
            }
        }

        private void FetchAndDisplayResponseData(string ticketID)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\huezh\\Desktop\\SEM\\Assignment\\App_Data\\Database.mdf;Integrated Security=True";
            string query = "SELECT adminID, response FROM Response WHERE ticketID = @ticketID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ticketID", ticketID);

                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.HasRows)
                        {
                            GridViewResponse.DataSource = reader;
                            GridViewResponse.DataBind();
                        }
                        else
                        {
                            // Handle the case where no data is found
                            //lbladminIDValue.Text = "No Data Found";
                            // lblResponseValue.Text = "No Data Found";
                        }

                        reader.Close();
                    }
                    catch (Exception ex)
                    {
                        // Handle any exceptions that occur during the database operation
                        // You can log the error or display an error message as needed
                    }
                }
            }
        }
    }
}
