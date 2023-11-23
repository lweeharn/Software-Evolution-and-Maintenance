using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Assignment.AdResponseTicket;

namespace Assignment
{
    public partial class AdResponseTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["ticketID"] != null)
                {
                    string ticketID = Request.QueryString["ticketID"];
                    lblTicketIDValue.Text = ticketID;

                    string userID = Request.QueryString["userID"];
                    lbluserIDValue.Text = userID;

                    // Assuming you have a method to retrieve ticket details based on ticketID
                    Ticket ticket = GetTicketDetails(ticketID);

                    // Populate the subject, content, and status labels or controls
                    lblTicketIDValue.Text = ticket.TicketID;
                    lbluserIDValue.Text = userID;
                    lblSubject.Text = ticket.Subject;
                    lblContent.Text = ticket.Content;
                    lblStatus.Text = ticket.Status;

                    // Populate the DropDownList for archiving
                    if (ticket.Status == "Pending")
                    {
                        // Add an "Archive" option to the DropDownList
                        ddlArchiveStatus.Items.Add(new ListItem("In Progress", "In Progress"));
                    }
                    else if (ticket.Status == "In Progress")
                    {
                        // Add an "Archive" option to the DropDownList
                        ddlArchiveStatus.Items.Add(new ListItem("Archieve", "Archieve"));
                    }
                    else if (ticket.Status == "Archieve")
                    {
                        // Add a disabled "Archived" option if the ticket is already archived
                        ddlArchiveStatus.Items.Add(new ListItem("Archieved", "Archieved"));
                        ddlArchiveStatus.Enabled = false;
                    }
                }
            }
        }

        // Define a class to represent a ticket (you can use your actual class)
        public class Ticket
        {
            public string TicketID { get; set; }
            public string Subject { get; set; }
            public string Content { get; set; }
            public string Status { get; set; }
        }

        private Ticket GetTicketDetails(string ticketID)
        {
            Ticket ticket = null; // Initialize the ticket as null

            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\huezh\\Desktop\\SEM\\Assignment\\App_Data\\Database.mdf;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // SQL query to retrieve ticket details based on ticketID
                string query = "SELECT [ticketID], [subject], [content], [status] FROM [Ticket] WHERE [ticketID] = @ticketID";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@ticketID", ticketID);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        // Populate the ticket object with the fetched details
                        ticket = new Ticket
                        {
                            TicketID = reader["ticketID"].ToString(),
                            Subject = reader["subject"].ToString(),
                            Content = reader["content"].ToString(),
                            Status = reader["status"].ToString()
                        };
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    // Handle exceptions (e.g., log or display an error)
                    // You can add your error handling logic here
                }
            }

            return ticket;
        }

        protected void ddlArchiveStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ticketID = lblTicketIDValue.Text;

            if (ddlArchiveStatus.SelectedValue == "Archieve")
            {
                ArchiveTicket(ticketID);

                // Update the status label to "Archived"
                lblStatus.Text = "Archieved";
            }
            else if (ddlArchiveStatus.SelectedValue == "In Progress")
            {
                // Update the status to "In Progress" in the database
                UpdateTicketStatus(ticketID, "In Progress");

                // Update the status label to "In Progress"
                lblStatus.Text = "In Progress";
            }

            // Disable the DropDownList to prevent further changes
            ddlArchiveStatus.Enabled = true;
        }

        // Method to archive a ticket (you need to implement this logic)
        private void ArchiveTicket(string ticketID)
        {
            // Define your connection string
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\huezh\\Desktop\\SEM\\Assignment\\App_Data\\Database.mdf;Integrated Security=True";

            // Define your SQL query with parameters
            string query = "UPDATE Ticket SET status = @status, archieveDate = @archieveDate WHERE ticketID = @ticketID";

            // Get the current date and time for the archieveDate field
            DateTime archieveDate = DateTime.Now;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the command
                    command.Parameters.AddWithValue("@status", "Archieved");
                    command.Parameters.AddWithValue("@archieveDate", archieveDate);
                    command.Parameters.AddWithValue("@ticketID", ticketID);

                    try
                    {
                        // Open the connection
                        connection.Open();

                        // Execute the query to update the ticket
                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            // The ticket was successfully archived
                            // You can add additional logic or messages here if needed
                        }
                        else
                        {
                            // No rows were affected, indicating an issue with the update
                            // You can handle this scenario accordingly
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handle any exceptions that occur during the database operation
                        // You can log the error or display an error message as needed
                    }
                }
            }
        }

        private void UpdateTicketStatus(string ticketID, string status)
        {
            // Define your connection string
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\huezh\\Desktop\\SEM\\Assignment\\App_Data\\Database.mdf;Integrated Security=True";

            // Define your SQL query with parameters
            string query = "UPDATE Ticket SET status = @status WHERE ticketID = @ticketID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the command
                    command.Parameters.AddWithValue("@status", status);
                    command.Parameters.AddWithValue("@ticketID", ticketID);

                    try
                    {
                        // Open the connection
                        connection.Open();

                        // Execute the query to update the ticket
                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            // The ticket status was successfully updated
                            // You can add additional logic or messages here if needed
                        }
                        else
                        {
                            // No rows were affected, indicating an issue with the update
                            // You can handle this scenario accordingly
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handle any exceptions that occur during the database operation
                        // You can log the error or display an error message as needed
                    }
                }
            }
        }

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            // Generate a unique responseID
            Guid responseID = Guid.NewGuid();

            // Get the adminID from the FormView control
            TextBox adminIDTextBox = (TextBox)FormView1.FindControl("adminIDTextBox");
            string adminID = adminIDTextBox.Text;

            // Get the response from the FormView control
            TextBox responseTextBox = (TextBox)FormView1.FindControl("subjectTextBox");
            string response = responseTextBox.Text;

            // Get the current date and time for createDate
            DateTime createDate = DateTime.Now;

            // Get the ticketID and userID from the query string
            string ticketID = Request.QueryString["ticketID"];
            string userID = Request.QueryString["userID"];

            // Set the values for the FormView's insert operation
            e.Values["responseID"] = responseID;
            e.Values["adminID"] = adminID;
            e.Values["response"] = response;
            e.Values["createDate"] = createDate;
            e.Values["ticketID"] = ticketID;
            e.Values["userID"] = userID;

            // Insert the data into the database
            InsertResponse(responseID, adminID, response, createDate, ticketID, userID);
        }

        private void InsertResponse(Guid responseID, string adminID, string response, DateTime createDate, string ticketID, string userID)
        {
            // Define your connection string
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\huezh\\Desktop\\SEM\\Assignment\\App_Data\\Database.mdf;Integrated Security=True";


            // Define your SQL query to insert data into the Response table
            string responseQuery = "INSERT INTO Response (responseID, adminID, response, createDate, ticketID, userID) " +
                                   "VALUES (@responseID, @adminID, @response, @createDate, @ticketID, @userID)";

            // Define your SQL query to update the Ticket table's adminID
            string updateTicketQuery = "UPDATE Ticket SET adminID = @adminID WHERE ticketID = @ticketID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlTransaction transaction = connection.BeginTransaction())
                {
                    using (SqlCommand responseCommand = new SqlCommand(responseQuery, connection, transaction))
                    using (SqlCommand updateTicketCommand = new SqlCommand(updateTicketQuery, connection, transaction))
                    {
                        // Add parameters to the responseCommand
                        responseCommand.Parameters.AddWithValue("@responseID", responseID);
                        responseCommand.Parameters.AddWithValue("@adminID", adminID);
                        responseCommand.Parameters.AddWithValue("@response", response);
                        responseCommand.Parameters.AddWithValue("@createDate", createDate);
                        responseCommand.Parameters.AddWithValue("@ticketID", ticketID);
                        responseCommand.Parameters.AddWithValue("@userID", userID);

                        // Add parameters to the updateTicketCommand
                        updateTicketCommand.Parameters.AddWithValue("@adminID", adminID);
                        updateTicketCommand.Parameters.AddWithValue("@ticketID", ticketID);

                        try
                        {
                            // Execute the responseCommand to insert the response
                            int rowsAffectedResponse = responseCommand.ExecuteNonQuery();

                            if (rowsAffectedResponse > 0)
                            {
                                // Response was successfully inserted
                                Response.Write("Response successful.");

                                // Execute the updateTicketCommand to update the Ticket table
                                int rowsAffectedTicket = updateTicketCommand.ExecuteNonQuery();

                                if (rowsAffectedTicket > 0)
                                {
                                    // Ticket adminID was successfully updated
                                    Response.Write("Ticket adminID updated successfully.");
                                }
                                else
                                {
                                    // No rows were affected when updating the Ticket table
                                    Response.Write("No rows were affected. Ticket adminID update failed.");
                                }

                                // Commit the transaction
                                transaction.Commit();
                            }
                            else
                            {
                                // No rows were affected, indicating an issue with the insert
                                Response.Write("No rows were affected. Insert failed.");
                            }
                        }
                        catch (Exception ex)
                        {
                            // Handle any exceptions that occur during the database operation
                            // Log the error for debugging purposes
                            Response.Write("Error: " + ex.Message);

                            // Rollback the transaction
                            transaction.Rollback();
                        }
                    }
                }
            }
        }

    }
}