<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="FoodSaver.ForgotPassword" %>
<asp:Content ID="C1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .forgot-wrap {
        min-height: calc(100vh - 80px);
        display: flex;
        align-items: center;
        justify-content: center;
        background: #f5f6f8;
        padding: 40px 15px;
    }
    .forgot-card {
        background: #fff;
        border-radius: 18px;
        box-shadow: 0 12px 40px rgba(0,0,0,.07);
        overflow: hidden;
        max-width: 1060px;
        width: 100%;
    }

    /* LEFT panel — the image you exported, shown as-is */
    .forgot-left {
        background: url('Images/forgot-panel.png') center/cover no-repeat;
        min-height: 560px;
    }

    /* RIGHT panel — reset form */
    .forgot-right {
        padding: 60px 50px;
    }
    .forgot-icon {
        width: 60px;
        height: 60px;
        border-radius: 50%;
        background: var(--fs-green-light);
        color: var(--fs-green);
        display: inline-flex;
        align-items: center;
        justify-content: center;
        font-size: 26px;
    }
</style>

<div class="forgot-wrap">
  <div class="forgot-card">
    <div class="row g-0">

      <!-- LEFT: exported image -->
      <div class="col-md-6 d-none d-md-block">
        <div class="forgot-left"></div>
      </div>

      <!-- RIGHT: form -->
      <div class="col-md-6">
        <div class="forgot-right text-center">

          <div class="forgot-icon mb-3">
            <i class="bi bi-arrow-counterclockwise"></i>
          </div>

          <h3 class="fw-bold mb-2">Forgot Password?</h3>
          <p class="text-muted mb-4" style="font-size:.92rem;">
            Enter your email address and we'll send you a link to reset your password.
          </p>

          <asp:Label ID="lblMsg" runat="server" CssClass="d-block mb-2 text-start" />

          <div class="mb-3 text-start">
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"
                         TextMode="Email" placeholder="Email Address" />
          </div>

          <asp:Button ID="btnSend" runat="server" Text="✉  Send Reset Link"
                      CssClass="btn btn-success w-100 py-2 mb-3" OnClick="btnSend_Click" />

          <a href="Login.aspx" class="btn btn-outline-fs w-100 py-2">
            ← Back to Login
          </a>

          <p class="text-muted mt-4 mb-0" style="font-size:.86rem;">
            Need help? <a href="Contact.aspx" class="link-green">Contact Support</a>
          </p>
        </div>
      </div>

    </div>
  </div>
</div>

</asp:Content>