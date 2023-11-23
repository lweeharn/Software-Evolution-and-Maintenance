<%@ Page Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="ResponseTicket.aspx.cs" Inherits="Assignment.ResponseTicket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Response</h1>
    <a href="ViewTicket.aspx" class="back-button">Back</a>
    <form runat="server">
           <div>
        <h2>Ticket Details</h2>
        <table style="width: 100%;">
            <tr>
                <td style="width: 30%; background-color: #D6EEEE; border-style: none none none double;">Ticket ID</td>
                <td style="width: 70%; background-color: #D6EEEE;">
                    <asp:Label ID="lblTicketIDValue" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 30%; background-color: white; border-style: none none none double;">Subject</td>
                <td style="width: 70%; background-color: white;">
                    <asp:Label ID="lblSucjectValue" runat="server" Text=""></asp:Label></td>
            </tr>
             <tr>
                <td style="width: 30%; background-color: whitesmoke; border-style: none none none double;">Content</td>
                <td style="width: 70%; background-color: whitesmoke;">
                    <asp:Label ID="lblContentValue" runat="server" Text=""></asp:Label></td>
            </tr>
             <tr>
                <td style="width: 30%; background-color: white; border-style: none none none double;">Status</td>
                <td style="width: 70%; background-color: white;">
                    <asp:Label ID="lblStatusValue" runat="server" Text=""></asp:Label></td>
            </tr>

        </table>
        <br />
        <h2>Responses</h2>
<asp:GridView ID="GridViewResponse" runat="server" AutoGenerateColumns="False" CssClass="gridview-container">
    <HeaderStyle CssClass="gridview-header" />
    <Columns>
        <asp:BoundField DataField="adminID" HeaderText="Admin" ItemStyle-CssClass="gridview-col" />
        <asp:BoundField DataField="response" HeaderText="Response" ItemStyle-CssClass="gridview-col" />
    </Columns>
</asp:GridView>
    </div>
    </form>
 

    <style>
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
        /* Apply styles to the GridView */
        .gridview-container {
            font-family: 'lato', sans-serif;
            max-width: 1000px;
            /*
                   margin-left: auto;
            margin-right: auto;
            padding-left: 10px;
            padding-right: 10px;
            */
         
        }

        .gridview-header {
            background-color: #95A5A6;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.03em;
        }

        .gridview-row {
            background-color: #ffffff;
            box-shadow: 0px 0px 9px 0px rgba(0,0,0,0.1);
            display: flex;
            justify-content: space-between;
            margin-bottom: 25px;
        }

        .gridview-col {
            flex-basis: 25%;
            padding: 10px;
            text-align: center;
            border-left: 1px solid #ccc;
        }

        @media all and (max-width: 767px) {
            /* Hide GridView header on smaller screens */
            .gridview-header {
                display: none;
            }

            /* Adjust row and column styles for smaller screens */
            .gridview-row {
                background-color: #ffffff;
                box-shadow: 0px 0px 9px 0px rgba(0,0,0,0.1);
                display: flex;
                flex-wrap: wrap;
                justify-content: flex-start;
                margin-bottom: 25px;
            }

            .gridview-col {
                flex-basis: 100%;
                border: none;
                padding: 10px 0;
                text-align: left;
                &:before

        {
            color: #6C7A89;
            padding-right: 10px;
            content: attr(data-label);
            flex-basis: 50%;
            text-align: right;
        }

        }
        }
    </style>
</asp:Content>
