<%@ Page Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="Staff_Details.aspx.cs" Inherits="Assignment.Staff_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">

        <section class="tmp">
            <div style="display: flex; width: 100%; height: 100%;">
                <div style="width: 50%;">
                    <div style="text-align: center; margin-top: 100px;">
                        <asp:Image ID="Image1" runat="server" Width="250px" Height="300px" />
                    </div>
                </div>

                <div style="width: 50%; padding-top: 100px;">
                    <div class="staff_name">
                        <asp:Label ID="lblStaffName" runat="server"></asp:Label>
                    </div>
                    <br />
                    <div class="staff_position">
                        <asp:Label ID="lblStaffPosition" runat="server"></asp:Label>
                    </div>
                    <br />
                    <div class="normal_text">
                        <label style="font-style: normal;">Roles: </label>
                        <asp:Label ID="lblStaffRoles" runat="server"></asp:Label>
                    </div>
                    <br />
                    <div class="normal_text">
                        <label style="font-style: normal;">Department: </label>
                        <asp:Label ID="lblStaffDepartment" runat="server"></asp:Label>
                    </div>
                    <br />
                    <div class="normal_text">
                        <label style="font-style: normal;">Qualification: </label>
                        <asp:Label ID="lblStaffQualification" runat="server"></asp:Label>
                    </div>
                    <br />
                    <div class="normal_text">
                        <label style="font-style: normal;">Email: </label>
                        <asp:HyperLink ID="lnkBackupEmail" runat="server" NavigateUrl="#" CssClass="backup-email">
                            <asp:Label ID="lblStaffEmail" runat="server"></asp:Label>
                        </asp:HyperLink>
                    </div>
                    <br />
                    <div class="normal_text">
                        <label style="font-style: normal;">Major Of Study: </label>
                        <asp:Label ID="lblStaffMajorOfStudy" runat="server"></asp:Label>
                    </div>
                    <br />
                    <div class="normal_text">
                        <label style="font-style: normal;">Area Of Study: </label>
                        <asp:Label ID="lblStaffAreaOfStudy" runat="server"></asp:Label>
                    </div>
                    <br />
                    <div class="btnBack">
                        <div class=" mt-30" style="text-align: center;">
                            <asp:Button ID="btnBack" runat="server" Text="Back" Style="width: 160px; height: 50px; background: #272727; color: white; display: block; margin-left: auto; margin-right: auto; margin-top: 50px; cursor: pointer; transition: background-color 0.3s, color 0.3s;" OnClick="btnBack_Click"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>
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

        .staff_name {
            font-family: 'Poppins';
            font-style: normal;
            font-weight: 700;
            font-size: 30px;
            line-height: 36px;
            color: black;
            text-align: center;
            width: 100%;
        }

        .staff_position {
            font-family: 'Poppins';
            font-style: normal;
            font-weight: 500;
            font-size: 18px;
            line-height: 36px;
            color: #656565;
            text-align: center;
            width: 100%;
        }

        .normal_text {
            font-family: 'Poppins';
            font-style: italic;
            font-weight: 100;
            font-size: 14px;
            line-height: 36px;
            color: #656565;
            text-align: left;
            width: 100%;
        }

        #img {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        /*review*/
        meter::-webkit-meter-optimum-value {
            background: grey;
        }

        /* bolded star --> &#9733; */
        /* unbolded star --> &#9734; */

        section {
            padding: 50px;
        }

        span a {
            text-decoration: none;
            color: black;
        }
    </style>


    <script type="text/javascript">
        window.onload = function () {
            var backupEmailLink = document.querySelector('.backup-email');
            var emailLabel = document.getElementById('<%= lblStaffEmail.ClientID %>');

            if (backupEmailLink && emailLabel) {
                backupEmailLink.onclick = function () {
                    var email = emailLabel.innerText || emailLabel.textContent;
                    window.open('https://mail.google.com/mail/?view=cm&fs=1&to=' + email);
                    return false; // Prevent default link behavior
                };
            }
        }
    </script>


</asp:Content>
