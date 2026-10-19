<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DonateSuccess.aspx.cs" Inherits="FoodSaver.DonateSuccess" %>
<asp:Content ID="C1" ContentPlaceHolderID="MainContent" runat="server">

<div class="success-wrapper">
  <div class="success-card">

    <div class="check-circle">✓</div>

    <div class="success-title">Thank You!</div>

    <div class="success-sub">
      Your donation has been submitted successfully.<br />
      You are helping someone in need.
    </div>

    <div class="d-flex justify-content-center gap-3 flex-wrap">
      <a href="Dashboard.aspx" class="btn btn-success px-4 py-2">Go to Dashboard</a>
      <a href="DonateFood.aspx" class="btn btn-outline-fs px-4 py-2">Make Another Donation</a>
    </div>

  </div>
</div>

</asp:Content>