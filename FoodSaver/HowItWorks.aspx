<%@ Page Title="How It Works" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HowItWorks.aspx.cs" Inherits="FoodSaver.HowItWorks" %>
<asp:Content ID="C1" ContentPlaceHolderID="MainContent" runat="server">

<section class="container py-5">
  <div class="text-center mb-5">
    <h1 class="fw-bold" style="color:var(--fs-green); font-size:2.6rem;">How It Works</h1>
    <p class="text-muted">Three simple steps to rescue food.</p>
  </div>

  <div class="row g-4 justify-content-center">
    <div class="col-md-4">
      <div class="panel text-center h-100">
        <div class="check-circle" style="width:64px;height:64px;font-size:26px;box-shadow:none;">1</div>
        <h5 class="mt-3">Donors Post Food</h5>
        <p class="text-muted mb-0" style="font-size:.92rem;">
          Restaurants, hotels, and households list surplus food — name, quantity, pickup time, and address.
        </p>
      </div>
    </div>

    <div class="col-md-4">
      <div class="panel text-center h-100">
        <div class="check-circle" style="width:64px;height:64px;font-size:26px;box-shadow:none;">2</div>
        <h5 class="mt-3">NGOs Claim It</h5>
        <p class="text-muted mb-0" style="font-size:.92rem;">
          Nearby NGOs browse available donations, claim them, and schedule a pickup before the food expires.
        </p>
      </div>
    </div>

    <div class="col-md-4">
      <div class="panel text-center h-100">
        <div class="check-circle" style="width:64px;height:64px;font-size:26px;box-shadow:none;">3</div>
        <h5 class="mt-3">Food Reaches People</h5>
        <p class="text-muted mb-0" style="font-size:.92rem;">
          The donation is delivered to shelters, community kitchens, and families in need.
          You get notified when it's picked up.
        </p>
      </div>
    </div>
  </div>

  <div class="text-center mt-5">
    <a href="SignUp.aspx" class="btn btn-success px-4 py-2">Join FoodSaver</a>
    <a href="Login.aspx" class="btn btn-outline-fs px-4 py-2 ms-2">Login</a>
  </div>
</section>

</asp:Content>