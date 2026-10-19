<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RequestSuccess.aspx.cs" Inherits="FoodSaver.RequestSuccess" %>
<asp:Content ID="C1" ContentPlaceHolderID="MainContent" runat="server">

<div class="success-wrapper">
  <div class="success-card">

    <div class="check-circle">✓</div>

    <div class="success-title">Your Request has been sent!</div>

    <div class="success-sub">
      We will notify you when food is available.
    </div>

    <div class="d-flex justify-content-center">
      <a href="Dashboard.aspx" class="btn btn-success px-5 py-2">Go to Dashboard</a>
    </div>

  </div>
</div>

</asp:Content>