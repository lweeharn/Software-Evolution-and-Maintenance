<%@ Page Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="enrollment.aspx.cs" Inherits="Assignment.enrollment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">





    <form id="form2" runat="server">
 

        <section class="text-center" style="padding: 5% 30%;">
            <h1>Enrollment</h1>

            <div class="text-left">
                <div class="form-group">
                    <label>Name</label>
                    <asp:TextBox ID="txtName" class="form-control p-2" runat="server" required="required"></asp:TextBox>

                </div>

                <div class="form-group">
                    <label>IC</label>
                    <asp:TextBox ID="txtIc" class="form-control p-2" runat="server" required="required"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Phone</label>
                    <asp:TextBox ID="txtPhone" class="form-control p-2" runat="server" required="required"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>
                        Email
                    </label>
                    <asp:TextBox ID="txtEmail" class="form-control p-2" runat="server" required="required"></asp:TextBox>
                </div>

                <div class="text-left">
                    <div class="form-group">
                        <label>Select Programme</label>
                        <select id="ddlProgramme2" class="custom-select" fdprocessedid="6c1wdj">
                            <option value="Diploma">Diploma</option>
                            <option value="Bachelor Degree">Bachelor Degree</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Select Course</label>
                        <asp:DropDownList class="custom-select" ID="ddlCourse2" ClientIDMode="Static" runat="server" EnableViewState="true">
                            <asp:ListItem Text="Diploma in Computer Science">Diploma in Computer Science</asp:ListItem>
                            <asp:ListItem Text="Diploma in Software Engineering">Diploma in Software Engineering</asp:ListItem>
                            <asp:ListItem Text="Diploma in Information Security">Diploma in Information Security</asp:ListItem>
                            <asp:ListItem Text="Diploma in Information Technology">Diploma in Information Technology</asp:ListItem>
                        </asp:DropDownList>

                    </div>

                    <div class="form-group">
                        <label>Result</label><br>
                        <asp:FileUpload ID="resultImage" runat="server" required="required" />
                    </div>
                    <asp:Button class="btn btn-block btn-primary btn-lg" ID="enrollBtn" runat="server" OnClick="enrollBtn_Click" Text="Submit" ClientIDMode="Static" />

                    <!---fix image processing fix if got time-->
                    <%-- <div class="form-group">
                <label>Result</label><br>
                <input id="resultImage" type="file" >

                <img src="#" id="enhancedImage" style="width:200px;height:auto"/>
            </div>

           <button class="btn btn-block btn-primary btn-lg" onclick="processImage()">Submit</button>--%>
                    </div>
                </div>
        </section>




        <script src="js/enroll.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="plugins/bootstrap/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="plugins/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/animation.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="plugins/themefisherFont/style.css">
        <script src="https://cdnjs.deepai.org/deepai.min.js"></script>

    </form>










</asp:Content>
