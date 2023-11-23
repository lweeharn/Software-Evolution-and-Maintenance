<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Assignment.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
          /* Define styles for regular rows */
        .row-style {
            background-color: white; /* Background color for regular rows */
            padding: 10px; /* Add padding for spacing between columns */
            margin-bottom: 10px; /* Add margin for spacing between rows */
        }

        /* Define styles for alternating rows */
        .alternate-row {
            background-color: #EEEEEE; /* Background color for alternating rows */
            padding: 10px; /* Add padding for spacing between columns */
            margin-bottom: 10px; /* Add margin for spacing between rows */
        }
        .row-style1 {
            background-color: white; /* Background color for regular rows */
            padding: 10px; /* Add padding for spacing between columns */
            margin-bottom: 10px; /* Add margin for spacing between rows */
        }

        /* Define styles for alternating rows */
        .alternate-row1 {
            background-color: #EEEEEE; /* Background color for alternating rows */
            padding: 10px; /* Add padding for spacing between columns */
            margin-bottom: 10px; /* Add margin for spacing between rows */
        }

    </style>
</head>
<body>
     <table style="width: 100%;">
        <tr>
            <td style=" background-color: #D6EEEE;"><a href="SubmitEmail.aspx" style="text-decoration: none; color: black; ">
                <h1 style="text-align: center;">Dashboard</h1>
            </a>
            </td>
           
        </tr>
    </table>
    <form id="form1" runat="server">
        <div>
            <div class="adminView">
                <div style="text-align: center;">
                <asp:GridView ID="GridView3" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="adminID" 
                    DataSourceID="SqlDataSource3" style="width: 70%; margin: 0 auto;">
                       <HeaderStyle BackColor="maroon" ForeColor="white" />
                <RowStyle CssClass="row-style1" ForeColor="black" />
                <AlternatingRowStyle CssClass="alternate-row1" ForeColor="black" />
                    <Columns>
                      
                        <asp:BoundField DataField="adminID" HeaderText="adminID" ReadOnly="True" SortExpression="adminID" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                          <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
                    </div>
                </br>
                </br>
                    <hr style="border-top: 1px solid gray; margin-left: 8%; margin-right: 8%;" />
                </br>
                </br>

                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" DeleteCommand="DELETE FROM [Admin] WHERE [adminID] = @adminID" InsertCommand="INSERT INTO [Admin] ([adminID], [email], [password]) VALUES (@adminID, @email, @password)" SelectCommand="SELECT * FROM [Admin]" UpdateCommand="UPDATE [Admin] SET [email] = @email, [password] = @password WHERE [adminID] = @adminID">
                    <DeleteParameters>
                        <asp:Parameter Name="adminID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="adminID" Type="Int32" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="adminID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </div>


            <asp:GridView ID="gvTicket" runat="server" AutoGenerateColumns="False" DataKeyNames="ticketID" DataSourceID="SqlDataSource1" Style="width: 100%;"
                AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <HeaderStyle BackColor="#000" ForeColor="white" />
                <RowStyle CssClass="row-style" ForeColor="black" />
                <AlternatingRowStyle CssClass="alternate-row" ForeColor="black" />
                <Columns>
                    <asp:BoundField DataField="ticketID" HeaderText="ticketID" ReadOnly="True" SortExpression="ticketID" />
                    <asp:BoundField DataField="subject" HeaderText="subject" SortExpression="subject" />
                    <asp:BoundField DataField="content" HeaderText="content" SortExpression="content" />
                    <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                    <asp:BoundField DataField="createDate" HeaderText="createDate" SortExpression="createDate" />
                    <asp:BoundField DataField="archieveDate" HeaderText="archieveDate" SortExpression="archieveDate" />
                    <asp:BoundField DataField="userID" HeaderText="userID" SortExpression="userID" />
                    <asp:BoundField DataField="adminID" HeaderText="adminID" SortExpression="adminID" />
                                        <asp:CommandField ShowSelectButton="True" />
                </Columns>
            </asp:GridView>

            </br>
            </br>
                    <hr style="border-top: 1px solid gray; margin-left: 8%; margin-right: 8%;" />
            </br>
            </br>


            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" DeleteCommand="DELETE FROM [Ticket] WHERE [ticketID] = @original_ticketID AND (([subject] = @original_subject) OR ([subject] IS NULL AND @original_subject IS NULL)) AND (([content] = @original_content) OR ([content] IS NULL AND @original_content IS NULL)) AND (([status] = @original_status) OR ([status] IS NULL AND @original_status IS NULL)) AND (([createDate] = @original_createDate) OR ([createDate] IS NULL AND @original_createDate IS NULL)) AND (([archieveDate] = @original_archieveDate) OR ([archieveDate] IS NULL AND @original_archieveDate IS NULL)) AND (([userID] = @original_userID) OR ([userID] IS NULL AND @original_userID IS NULL)) AND (([adminID] = @original_adminID) OR ([adminID] IS NULL AND @original_adminID IS NULL))" InsertCommand="INSERT INTO [Ticket] ([ticketID], [subject], [content], [status], [createDate], [archieveDate], [userID], [adminID]) VALUES (@ticketID, @subject, @content, @status, @createDate, @archieveDate, @userID, @adminID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Ticket]" UpdateCommand="UPDATE [Ticket] SET [subject] = @subject, [content] = @content, [status] = @status, [createDate] = @createDate, [archieveDate] = @archieveDate, [userID] = @userID, [adminID] = @adminID WHERE [ticketID] = @original_ticketID AND (([subject] = @original_subject) OR ([subject] IS NULL AND @original_subject IS NULL)) AND (([content] = @original_content) OR ([content] IS NULL AND @original_content IS NULL)) AND (([status] = @original_status) OR ([status] IS NULL AND @original_status IS NULL)) AND (([createDate] = @original_createDate) OR ([createDate] IS NULL AND @original_createDate IS NULL)) AND (([archieveDate] = @original_archieveDate) OR ([archieveDate] IS NULL AND @original_archieveDate IS NULL)) AND (([userID] = @original_userID) OR ([userID] IS NULL AND @original_userID IS NULL)) AND (([adminID] = @original_adminID) OR ([adminID] IS NULL AND @original_adminID IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_ticketID" Type="Object" />
                    <asp:Parameter Name="original_subject" Type="String" />
                    <asp:Parameter Name="original_content" Type="String" />
                    <asp:Parameter Name="original_status" Type="String" />
                    <asp:Parameter Name="original_createDate" Type="DateTime" />
                    <asp:Parameter Name="original_archieveDate" Type="DateTime" />
                    <asp:Parameter Name="original_userID" Type="Int32" />
                    <asp:Parameter Name="original_adminID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ticketID" Type="Object" />
                    <asp:Parameter Name="subject" Type="String" />
                    <asp:Parameter Name="content" Type="String" />
                    <asp:Parameter Name="status" Type="String" />
                    <asp:Parameter Name="createDate" Type="DateTime" />
                    <asp:Parameter Name="archieveDate" Type="DateTime" />
                    <asp:Parameter Name="userID" Type="Int32" />
                    <asp:Parameter Name="adminID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="subject" Type="String" />
                    <asp:Parameter Name="content" Type="String" />
                    <asp:Parameter Name="status" Type="String" />
                    <asp:Parameter Name="createDate" Type="DateTime" />
                    <asp:Parameter Name="archieveDate" Type="DateTime" />
                    <asp:Parameter Name="userID" Type="Int32" />
                    <asp:Parameter Name="adminID" Type="Int32" />
                    <asp:Parameter Name="original_ticketID" Type="Object" />
                    <asp:Parameter Name="original_subject" Type="String" />
                    <asp:Parameter Name="original_content" Type="String" />
                    <asp:Parameter Name="original_status" Type="String" />
                    <asp:Parameter Name="original_createDate" Type="DateTime" />
                    <asp:Parameter Name="original_archieveDate" Type="DateTime" />
                    <asp:Parameter Name="original_userID" Type="Int32" />
                    <asp:Parameter Name="original_adminID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="responseID"
                DataSourceID="SqlDataSource2" DefaultMode="Insert" AllowPaging="True" AllowSorting="True"
                Style="width: 100%">
                <HeaderStyle BackColor="#000" ForeColor="white" />
                <RowStyle CssClass="row-style" ForeColor="black" />
                <AlternatingRowStyle CssClass="alternate-row" ForeColor="black" />
                <Columns>
                    <asp:BoundField DataField="responseID" HeaderText="responseID" ReadOnly="True" SortExpression="responseID" />
                    <asp:BoundField DataField="response" HeaderText="response" SortExpression="response" />
                    <asp:BoundField DataField="createDate" HeaderText="createDate" SortExpression="createDate" />
                    <asp:BoundField DataField="ticketID" HeaderText="ticketID" SortExpression="ticketID" />
                    <asp:BoundField DataField="userID" HeaderText="userID" SortExpression="userID" />
                    <asp:BoundField DataField="adminID" HeaderText="adminID" SortExpression="adminID" />
                </Columns>
            </asp:GridView>


            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" DeleteCommand="DELETE FROM [Response] WHERE [responseID] = @original_responseID AND (([response] = @original_response) OR ([response] IS NULL AND @original_response IS NULL)) AND (([createDate] = @original_createDate) OR ([createDate] IS NULL AND @original_createDate IS NULL)) AND (([ticketID] = @original_ticketID) OR ([ticketID] IS NULL AND @original_ticketID IS NULL)) AND (([userID] = @original_userID) OR ([userID] IS NULL AND @original_userID IS NULL)) AND (([adminID] = @original_adminID) OR ([adminID] IS NULL AND @original_adminID IS NULL))" InsertCommand="INSERT INTO [Response] ([responseID], [response], [createDate], [ticketID], [userID], [adminID]) VALUES (@responseID, @response, @createDate, @ticketID, @userID, @adminID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Response]" UpdateCommand="UPDATE [Response] SET [response] = @response, [createDate] = @createDate, [ticketID] = @ticketID, [userID] = @userID, [adminID] = @adminID WHERE [responseID] = @original_responseID AND (([response] = @original_response) OR ([response] IS NULL AND @original_response IS NULL)) AND (([createDate] = @original_createDate) OR ([createDate] IS NULL AND @original_createDate IS NULL)) AND (([ticketID] = @original_ticketID) OR ([ticketID] IS NULL AND @original_ticketID IS NULL)) AND (([userID] = @original_userID) OR ([userID] IS NULL AND @original_userID IS NULL)) AND (([adminID] = @original_adminID) OR ([adminID] IS NULL AND @original_adminID IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_responseID" Type="Object" />
                    <asp:Parameter Name="original_response" Type="String" />
                    <asp:Parameter Name="original_createDate" Type="DateTime" />
                    <asp:Parameter Name="original_ticketID" Type="Object" />
                    <asp:Parameter Name="original_userID" Type="Int32" />
                    <asp:Parameter Name="original_adminID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="responseID" Type="Object" />
                    <asp:Parameter Name="response" Type="String" />
                    <asp:Parameter Name="createDate" Type="DateTime" />
                    <asp:Parameter Name="ticketID" Type="Object" />
                    <asp:Parameter Name="userID" Type="Int32" />
                    <asp:Parameter Name="adminID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="response" Type="String" />
                    <asp:Parameter Name="createDate" Type="DateTime" />
                    <asp:Parameter Name="ticketID" Type="Object" />
                    <asp:Parameter Name="userID" Type="Int32" />
                    <asp:Parameter Name="adminID" Type="Int32" />
                    <asp:Parameter Name="original_responseID" Type="Object" />
                    <asp:Parameter Name="original_response" Type="String" />
                    <asp:Parameter Name="original_createDate" Type="DateTime" />
                    <asp:Parameter Name="original_ticketID" Type="Object" />
                    <asp:Parameter Name="original_userID" Type="Int32" />
                    <asp:Parameter Name="original_adminID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
    </form>
</body>
   
</html>
