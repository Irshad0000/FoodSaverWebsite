<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="FoodSaver.About" %>
<asp:Content ID="C1" ContentPlaceHolderID="MainContent" runat="server">

<section class="container py-5">
  <div class="text-center mb-5">
    <h1 class="fw-bold" style="color:var(--fs-green); font-size:2.6rem;">About FoodSaver</h1>
    <p class="text-muted">Rescuing food, feeding hope — one donation at a time.</p>
  </div>

  <div class="row justify-content-center">
    <div class="col-md-10">
      <div class="panel mb-4">
        <h5>Our Mission</h5>
        <p class="text-muted mb-0">
          Every day, tons of perfectly edible food is thrown away while millions go hungry.
          FoodSaver connects restaurants, hotels, households, and event organizers with NGOs
          and community kitchens so that surplus food reaches the people who need it — before it spoils.
        </p>
      </div>

      <div class="panel mb-4">
        <h5>How We Started</h5>
        <p class="text-muted mb-0">
          FoodSaver began as a simple idea: make food donation as easy as ordering takeout.
          We built a platform where a donor can list surplus food in under 60 seconds, and
          a nearby NGO can claim it with one click.
        </p>
      </div>

      <div class="row g-3">
        <div class="col-md-4">
          <div class="panel text-center">
            <h3 class="fw-bold" style="color:var(--fs-green);">12,450+</h3>
            <div class="text-muted">Meals Rescued</div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="panel text-center">
            <h3 class="fw-bold" style="color:var(--fs-green);">320+</h3>
            <div class="text-muted">NGO Partners</div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="panel text-center">
            <h3 class="fw-bold" style="color:var(--fs-green);">25,000+</h3>
            <div class="text-muted">Lives Impacted</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

</asp:Content>