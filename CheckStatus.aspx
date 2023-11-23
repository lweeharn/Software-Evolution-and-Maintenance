<%@ Page Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="CheckStatus.aspx.cs" Inherits="Assignment.CheckStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="plugins/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/animation.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="plugins/themefisherFont/style.css">
    <script src="https://cdnjs.deepai.org/deepai.min.js"></script>
    <script src="js/enroll.js"></script>

    <section class="text-center" style="padding: 5% 30%;">
        <form id="form1" runat="server">
            <h1>Check Application Status</h1>


            <div class="form-group">
                <label>Enter IC</label>
                <asp:TextBox ID="txtIC" class="form-control p-2" runat="server"></asp:TextBox>
                <asp:Button class="btn btn-block btn-primary" Style="margin: 10px auto; width: 40%; padding: 2% 0" ID="sendBtn" runat="server" OnClick="sendBtn_Click" Text="Send" />
            </div>

            <div class="form-group">
                <label>Enter Code</label>
                <asp:TextBox ID="txtCode" class="form-control p-2" runat="server"></asp:TextBox>
                <asp:Button class="btn btn-block btn-secondary" Style="margin: 10px auto; width: 40%; padding: 2% 0" ID="submitBtn" runat="server" OnClick="submitBtn_Click" Text="Submit" />
            </div>
            <asp:Label ID="lblErrorMessage" runat="server" Visible="false" ForeColor="Red"></asp:Label>
            Status:<asp:Label ID="lblStatus" runat="server" Visible="false"></asp:Label>
        </form>
    </section>


    <!---fix image processing fix if got time-->
    <%-- <div class="form-group">
                <label>Result</label><br>
                <input id="resultImage" type="file" >

                <img src="#" id="enhancedImage" style="width:200px;height:auto"/>
            </div>

           <button class="btn btn-block btn-primary btn-lg" onclick="processImage()">Submit</button>--%>

    <script src="js/common.js"></script>

</asp:Content>
