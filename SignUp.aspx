<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="FoodSaver.SignUp" %>
<asp:Content ID="C1" ContentPlaceHolderID="MainContent" runat="server">

<div class="auth-wrapper">
  <div class="auth-card">
    <div class="row g-5 align-items-center">

      <div class="col-md-5">
        <div class="auth-left">
<div class="brand">
    <img src="Images/logo-public.png" alt="FoodSaver" />
    <span>FoodSaver</span>
</div>
            <h2>Let's get started!</h2>
          <p>Create an account to donate or request food.</p>
          <img src="Images/grocery.png" alt="" />
        </div>
      </div>

      <div class="col-md-7">
        <h3 class="fw-bold">Create Account</h3>
        <p class="text-muted mb-4">Join FoodSaver and start making a difference.</p>

        <asp:Label ID="lblMsg" runat="server" CssClass="text-danger d-block mb-2" />

        <div class="mb-3">
          <label class="form-label">Full Name</label>
          <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your full name" />
        </div>

        <div class="mb-3">
          <label class="form-label">Email Address</label>
          <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter your email" />
        </div>

        <div class="mb-3">
          <label class="form-label">Phone Number</label>
          <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Enter your phone number" />
        </div>

        <div class="mb-3">
          <label class="form-label">I want to register as</label>
          <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-select">
            <asp:ListItem Text="Donor" Value="Donor" />
            <asp:ListItem Text="NGO"   Value="NGO" />
          </asp:DropDownList>
        </div>

        <div class="mb-3">
          <label class="form-label">Password</label>
          <asp:TextBox ID="txtPwd" runat="server" CssClass="form-control" TextMode="Password" placeholder="Create a password" />
        </div>

        <div class="mb-4">
          <label class="form-label">Confirm Password</label>
          <asp:TextBox ID="txtConfirm" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm your password" />
        </div>

        <asp:Button ID="btnSignUp" runat="server" Text="Create an Account"
                    CssClass="btn btn-success w-100 py-2" OnClick="btnSignUp_Click" />

        <p class="text-center text-muted mt-4 mb-0">
          Already have an account? <a href="Login.aspx" class="link-green">Login</a>
        </p>
      </div>

    </div>
  </div>
</div>

</asp:Content>