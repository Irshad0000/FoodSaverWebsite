<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FoodSaver.Default" %>
<asp:Content ID="C1" ContentPlaceHolderID="MainContent" runat="server">

<!-- HERO -->
<section class="hero-section">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-md-6">
        <h1 class="hero-title">
          Save Food.<br />
          <span class="light">Save Lives.</span>
        </h1>
        <p class="hero-sub">
          FoodSaver connects donors with NGOs and people in need.<br />
          Share extra food and help build a hunger-free community.
        </p>
      </div>
      <div class="col-md-6 text-center">
        <img src="Images/grocery.png" class="hero-image" alt="FoodSaver" />
      </div>
    </div>
  </div>
</section>

<!-- STATS STRIP -->
<section class="stats-strip">
  <div class="container">
    <div class="row">
      <div class="col-md-3 stat-block">
        <div class="num">12,450+</div>
        <div class="lbl">Meals Donated</div>
      </div>
      <div class="col-md-3 stat-block stat-divider">
        <div class="num">850+</div>
        <div class="lbl">Active Donors</div>
      </div>
      <div class="col-md-3 stat-block stat-divider">
        <div class="num">320+</div>
        <div class="lbl">NGO Partners</div>
      </div>
      <div class="col-md-3 stat-block stat-divider">
        <div class="num">25,000+</div>
        <div class="lbl">Lives Impacted</div>
      </div>
    </div>
  </div>
</section>

</asp:Content>