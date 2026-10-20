<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FoodSaver.Login" %>
<asp:Content ID="C1" ContentPlaceHolderID="MainContent" runat="server">

<div class="auth-wrapper">
  <div class="auth-card">
    <div class="row g-5 align-items-center">

      <!-- LEFT PANEL -->
      <div class="col-md-5">
        <div class="auth-left">

<div class="brand" style="display: flex !important; flex-direction: row !important; align-items: center !important; justify-content: center; gap: 8px; width: 100%; white-space: nowrap;">

    <img src="Images/logo-public.png"
         alt="FoodSaver"
         style="display: block !important; width: 32px !important; height: 32px !important; object-fit: contain; margin: 0 !important; padding: 0; flex-shrink: 0; transform: translateY(-3px);" />

    <span style="display: inline-block !important; margin: 0 !important; padding: 0; line-height: 32px; font-size: 1.25rem; font-weight: 700; color: #1e7a2c;">
        FoodSaver
    </span>

</div>
          <h2>Welcome Back!</h2>
          <p>Glad to see you again. Please login to continue.</p>
          <img src="Images/grocery.png" alt="" />
        </div>
      </div>

      <!-- RIGHT PANEL -->
      <div class="col-md-7">
        <h3 class="fw-bold mb-4">Login</h3>

        <asp:Label ID="lblMsg" runat="server" CssClass="text-danger d-block mb-2" />

        <div class="mb-3">
          <label class="form-label">Email Address</label>
          <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"
                       placeholder="Enter your email" />
        </div>

        <div class="mb-3">
          <label class="form-label">Password</label>
          <asp:TextBox ID="txtPwd" runat="server" CssClass="form-control" TextMode="Password"
                       placeholder="Enter your password" />
        </div>

        <div class="d-flex justify-content-between align-items-center mb-4">
          <div class="form-check">
            <asp:CheckBox ID="chkRemember" runat="server" CssClass="form-check-input" />
            <label class="form-check-label" for="<%= chkRemember.ClientID %>">Remember Me</label>
          </div>
          <a href="ForgotPassword.aspx" class="link-green">Forgot Password?</a>
        </div>

        <asp:ValidationSummary ID="vsLogin" runat="server" CssClass="text-danger mb-3" DisplayMode="BulletList" ShowMessageBox="false" ShowSummary="true" />

        <asp:Button ID="btnLogin" runat="server" Text="Login"
                    CssClass="btn btn-success w-100 py-2" OnClick="btnLogin_Click" />

        <hr class="my-4" />

        <p class="text-center text-muted mb-0">
          Don't have an account? <a href="SignUp.aspx" class="link-green">Sign Up</a>
        </p>
      </div>

    </div>
  </div>
</div>

</asp:Content>