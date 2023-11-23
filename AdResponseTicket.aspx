<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdResponseTicket.aspx.cs" Inherits="Assignment.AdResponseTicket" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .button1:link, a:visited {
            background-color: white;
            color: black;
            text-decoration: none;
            padding: 10px 25px;
        }

        .button1:hover, a:active {
            background-color: #77dd77;
            color: white;
            text-decoration: none;
        }

        .button2:link, a:visited {
            background-color: white;
            color: black;
            text-decoration: none;
            padding: 10px 25px;
        }

        .button2:hover, a:active {
            background-color: #f1807e;
            color: white;
            text-decoration: none;
        }

        .back-button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    font-size: 16px;
}

.back-button:hover {
    background-color: #0056b3;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">


        <div>
            <div>
                <h2>Ticket Details</h2> <a href="Admin.aspx" class="back-button">Back</a>

                <table style="width: 70%; margin: 0 auto; border: 1px solid black;">
                   
                     <tr>
                        <td style="width: 30%; background-color: black; color: white;">User ID:</td>
                        <td style="width: 70%; background-color: black; color: white;">
                            <asp:Label ID="lbluserIDValue" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 30%; background-color: #D6EEEE;">Ticket ID:</td>
                        <td style="width: 70%; background-color: #D6EEEE;">
                            <asp:Label ID="lblTicketIDValue" runat="server" Text=""></asp:Label></td>
                    </tr>
                   
                    <tr>
                        <td style="width: 30%;">Subject:</td>
                        <td>
                            <asp:Label ID="lblSubject" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 30%;">Content:</td>
                        <td>
                            <asp:Label ID="lblContent" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 30%;">Status:</td>
                        <td>
                            <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 30%;">Archive Status:</td>
                        <td>
                            <asp:DropDownList ID="ddlArchiveStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlArchiveStatus_SelectedIndexChanged">
                                <asp:ListItem Text="Pending" Value="Pending" Selected="True" />

                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>

            </div>

        </div>

        <asp:FormView ID="FormView1" runat="server" DataKeyNames="responseID" DefaultMode="Insert"
            OnItemInserting="FormView1_ItemInserting" style="width: 70%; margin: 0 auto;">

            <InsertItemTemplate>
                <table style="width: 70%; margin: 0 auto;">
                    <tr>
                        <td style="width: 30%;">Admin ID</td>
                        <td style="width: 70%;">
                            <asp:TextBox ID="adminIDTextBox" runat="server" Text='<%# Bind("adminID") %>' /></td>
                    </tr>
                    <br />
                    <tr>
                        <td>Response</td>
                        <td>
                            <asp:TextBox ID="subjectTextBox" runat="server" Text='<%# Bind("response") %>' />
                        </td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td style="vertical-align: middle; padding: 15px;">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Submit" class="button1" Style="padding: 5px 15px;"/>

                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" class="button2" Style="padding: 5px 15px;"/>
                        </td>
                    </tr>
                </table>
            </InsertItemTemplate>

        </asp:FormView>


    </form>
</body>
</html>
