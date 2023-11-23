<%@ Page Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="CompareDiploma.aspx.cs" Inherits="Assignment.CompareDiploma" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        h1 {
            font-size: 28px;
            text-align: center;
            margin-top: 20px;
            background-color: #007bff;
            color: white;
            padding: 10px;
            border-radius: 10px;
        }

        label {
            font-size: 16px;
        }

        .dropdown {
            width: 50%;
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-bottom: 10px;
        }

        .btn-compare {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 10px;
            cursor: pointer;
            border-radius: 4px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            font-size: 14px;
            background-color: #f2f2f2;
            border-radius: 10px; /* Add border radius effect */
            overflow: hidden; /* Hide overflowing content */
        }

        th, td {
            border: 1px solid #ddd;
            text-align: left;
            padding: 8px;
            background-color: #fff; /* Change cell color to white */
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:hover {
            background-color: #ddd;
        }
    </style>


    <form runat="server">
        
        <div>
            <h1>Diploma Programmes</h1>
            <label>
                &nbsp; Select Programme that you wish to compare:
            <br />
                <br />
            </label>
            &nbsp;<asp:DropDownList ID="ddlProgram1" runat="server" CssClass="dropdown">
                <asp:ListItem Text="Diploma in Computer Science" Value="Diploma in Computer Science" />
                <asp:ListItem Text="Diploma in Information Systems" Value="Diploma in Information Systems" />
                <asp:ListItem Text="Diploma in Information Technology" Value="Diploma in Information Technology" />
                <asp:ListItem Text="Diploma in Software Engineering" Value="Diploma in Software Engineering" />
            </asp:DropDownList>

            <br />
            &nbsp;<asp:DropDownList ID="ddlProgram2" runat="server" CssClass="dropdown">
                <asp:ListItem Text="Diploma in Computer Science" Value="Diploma in Computer Science" />
                <asp:ListItem Text="Diploma in Information Systems" Value="Diploma in Information Systems" />
                <asp:ListItem Text="Diploma in Information Technology" Value="Diploma in Information Technology" />
                <asp:ListItem Text="Diploma in Software Engineering" Value="Diploma in Software Engineering" />
            </asp:DropDownList>

            &nbsp;&nbsp;
            <br />
            &nbsp;<asp:Button ID="btnCompare" runat="server" Text="Compare" OnClick="btnCompare_Click" CssClass="btn-compare" />

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <table border="1">
                <tr>
                    <th>Program Details</th>
                    <th>
                        <asp:Label ID="lblProgram1Name" runat="server" Text="Programme" /></th>
                    <th>
                        <asp:Label ID="lblProgram2Name" runat="server" Text="Programme" /></th>
                </tr>
                <tr>
                    <td>Duration</td>
                    <td>
                        <asp:Label ID="lblDuration1" runat="server"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblDuration2" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Campus</td>
                    <td>
                        <asp:Label ID="lblCampus1" runat="server"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblCampus2" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Intake</td>
                    <td>
                        <asp:Label ID="lblIntake1" runat="server"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblIntake2" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Careers Prospects</td>
                    <td>
                        <asp:Label ID="lblCareersProspects1" runat="server"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblCareersProspects2" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Fees</td>
                    <td>
                        <asp:Label ID="lblFees1" runat="server"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblFees2" runat="server"></asp:Label></td>
                </tr>
            </table>

        </div>
   


    </form>

   


</asp:Content>
