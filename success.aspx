<%@ Page Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="success.aspx.cs" Inherits="Assignment.success" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="plugins/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/animation.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="plugins/themefisherFont/style.css">


    <!--header-->
   <section class="text-center" style="padding:5% 30%;">
  <h1>Application submitted</h1>
  <p>Please wait patiently for the evaluation process, we will notify via email once it's completed. Have a great day!</p>
    
   <a class="btn btn-block btn-primary btn-lg" href="CheckStatus.aspx">Check Status</a>

</section>


</asp:Content>