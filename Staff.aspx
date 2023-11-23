<%@ Page Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="Staff.aspx.cs" Inherits="Assignment.Staff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
         <style>
        .tmp {
            padding: 40px 40px 40px 40px;
            position: inherit;
            width: 94%;
            height: 720px;
            background-color: #ffffff;
            visibility: visible;
            margin-top: 0px;
        }

        .category_count {
            color: #656565;
            padding-left: 10px;
        }

        .staff_name {
            font-family: 'Poppins';
            font-style: normal;
            font-weight: 500;
            font-size: 15px;
            line-height: 36px;
            color: black;
            padding-left: 50px;
        }

        a {
            text-decoration: none;
        }

        .staff_position {
            font-family: 'Poppins';
            font-style: normal;
            font-weight: 500;
            font-size: 15px;
            line-height: 36px;
            color: #656565;
            padding-left: 50px;
        }


        .singleItem {
            width: 250px;
            height: 300px;
        }

        .staff_image {
            width: 150px;
            height: 180px;
            margin: 0px;
            padding-left: 50px;
        }

        .department_name {
            font-family: 'Poppins';
            font-style: normal;
            font-weight: 800;
            font-size: 18px;
            line-height: 36px;
            color: #345ed8;
            position: inherit;
        }
    </style>
    <div>
        <div class="tmp">

            <main style="padding: 50px;">

                <div style="display: flex; width: 104%; height: 100%; margin-left: -30px;">

                    <div style="width: 25%; padding-top: 10px;">

                        <div style="width: 99%; min-height: 100px; text-align: left; margin-top: 10px;">
                            <span style="font-size: 18px; text-align: left;">Sort By Department</span>
                            <asp:DropDownList ID="ddl_staff_sort" runat="server" Style="border: 1px solid black; width: 290px; height: 40px;" AutoPostBack="True" OnSelectedIndexChanged="ddl_staff_sort_SelectedIndexChanged">
                                <asp:ListItem>Faculty of Computing And Information Technology</asp:ListItem>
                                <asp:ListItem>Department of Software Engineering And Technology, Faculty of Computing And Information Technology</asp:ListItem>
                                <asp:ListItem>Department of Mathematical And Data Science, Faculty of Computing And Information Technology</asp:ListItem>
                                <asp:ListItem>Department of Information Systems And Security, Faculty of Computing And Information Technology</asp:ListItem>
                                <asp:ListItem>Department of Information And Communication Technology, Faculty of Computing And Information Technology</asp:ListItem>
                                <asp:ListItem>Department of Computer Science And Embedded Systems, Faculty of Computing And Information Technology</asp:ListItem>
                                <asp:ListItem>Administrative Office, Faculty of Computing And Information Technology</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div style="width: 100%">
                            <span style="font-size: 18px; text-align: left;">Search By Staff Name</span>
                            <div style="width: 99%; min-height: 20px">
                                <asp:TextBox ID="txt_search" runat="server"></asp:TextBox>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                    <asp:Button ID="btn_search" runat="server" Text="Search" OnClick="btn_search_Click" />
                            </div>
                            <div>
                                <asp:Label ID="lblSearchMessage" runat="server" ForeColor="Red"></asp:Label>
                            </div>


                        </div>
                    </div>

                    <div style="width: 84%; padding-left: 40px;">

                        <div class="department_name">
                            <asp:Label ID="lblCurrentDepartment" runat="server"></asp:Label>
                        </div>
                        <!-- container-->
                        <div>
                            <asp:Repeater ID="rptImages" runat="server" OnItemDataBound="OnItemDataBound">
                                <ItemTemplate>
                                    <div style="float: left; width: 33.33%;">
                                        <div class="singleItem">
                                            <a href="/Staff_Details.aspx?staffID=<%# Eval("staffID") %>">
                                                <div class="staff_image">
                                                    <asp:Image ID="Image1" runat="server" Width="150px" Height="180px" />
                                                </div>
                                                <div class="staff_name">
                                                    <%# Eval("staffName") %>
                                                </div>
                                                <div class="staff_position">
                                                    <%# Eval("staffPosition") %>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                    </div>
                </div>
                <!-- Add pagination controls -->
                <div style="margin-top: 10px; text-align: center;">
                    <asp:LinkButton ID="lnkFirst" runat="server" OnClick="lnkFirst_Click">First</asp:LinkButton>
                    <asp:LinkButton ID="lnkPrev" runat="server" OnClick="lnkPrev_Click">Previous</asp:LinkButton>
                    <asp:Label ID="lblPager" runat="server" />
                    <asp:LinkButton ID="lnkNext" runat="server" OnClick="lnkNext_Click">Next</asp:LinkButton>
                    <asp:LinkButton ID="lnkLast" runat="server" OnClick="lnkLast_Click">Last</asp:LinkButton>
                </div>
            </main>
        </div>
    </div>

    </form>
   


</asp:Content>

