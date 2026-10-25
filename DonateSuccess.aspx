<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DonateSuccess.aspx.cs" Inherits="FoodSaver.DonateSuccess" %>
<asp:Content ID="C1" ContentPlaceHolderID="MainContent" runat="server">
    <%-- Donate Success page - confirmation shown after a donation is submitted --%>

<div class="success-wrapper">
  <div class="success-card">

      <%-- Big tick icon to visually confirm the donation was successful --%>
    <div class="check-circle">✓</div>

      <%-- Thank-you message shown to the donor --%>
    <div class="success-title">Thank You!</div>

    <div class="success-sub">
      Your donation has been submitted successfully.<br />
      You are helping someone in need.
    </div>

      <%-- Action buttons: go back to dashboard or donate again --%>
    <div class="d-flex justify-content-center gap-3 flex-wrap">
      <a href="Dashboard.aspx" class="btn btn-success px-4 py-2">Go to Dashboard</a>
      <a href="DonateFood.aspx" class="btn btn-outline-fs px-4 py-2">Make Another Donation</a>
    </div>

  </div>
</div>

</asp:Content>