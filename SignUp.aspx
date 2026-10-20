<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="FoodSaver.SignUp" %>
<asp:Content ID="C1" ContentPlaceHolderID="MainContent" runat="server">

<div class="auth-wrapper">
  <div class="auth-card">
    <div class="row g-5 align-items-center">

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
          <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Full name is required." Display="Dynamic" CssClass="text-danger" />
          <asp:RegularExpressionValidator ID="revName" runat="server" ControlToValidate="txtName"
              ErrorMessage="Name can contain letters and spaces only." Display="Dynamic" CssClass="text-danger"
              ValidationExpression="^[A-Za-z ]+$" />
        </div>

        <div class="mb-3">
          <label class="form-label">Email Address</label>
          <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="Enter your email" />
          <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required." Display="Dynamic" CssClass="text-danger" />
          <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter a valid email." Display="Dynamic" CssClass="text-danger" ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" />
        </div>

        <div class="mb-3">
          <label class="form-label">Phone Number</label>
          <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Enter your phone number" />
          <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="Phone is required." Display="Dynamic" CssClass="text-danger" />
          <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone"
              ErrorMessage="Enter a valid phone number." Display="Dynamic" CssClass="text-danger"
              ValidationExpression="^[0-9]{7,15}$" />
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
          <asp:RequiredFieldValidator ID="rfvPwd" runat="server" ControlToValidate="txtPwd" ErrorMessage="Password is required." Display="Dynamic" CssClass="text-danger" />
          <asp:CustomValidator ID="cvPwdLength" runat="server" ControlToValidate="txtPwd" ErrorMessage="Password must be at least 6 characters." Display="Dynamic" CssClass="text-danger" OnServerValidate="cvPwdLength_ServerValidate" />
        </div>

        <div class="mb-4">
          <label class="form-label">Confirm Password</label>
          <asp:TextBox ID="txtConfirm" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm your password" />
          <asp:RequiredFieldValidator ID="rfvConfirm" runat="server" ControlToValidate="txtConfirm" ErrorMessage="Please confirm password." Display="Dynamic" CssClass="text-danger" />
          <asp:CompareValidator ID="cmpPwd" runat="server" ControlToValidate="txtConfirm" ControlToCompare="txtPwd" ErrorMessage="Passwords do not match." Display="Dynamic" CssClass="text-danger" />
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