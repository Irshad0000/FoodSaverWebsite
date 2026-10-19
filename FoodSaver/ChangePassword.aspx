<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="FoodSaver.ChangePassword" %>
<asp:Content ID="C1" ContentPlaceHolderID="MainContent" runat="server">

<div class="db-header">
  <h2>Profile</h2>
</div>

<asp:Label ID="lblMsg" runat="server" CssClass="d-block mb-3" />

<div class="row g-3">

  <!-- LEFT: PASSWORD FORM -->
  <div class="col-md-7">
    <div class="panel">
      <h5>Change Password</h5>

      <div class="mb-3">
        <label class="form-label">Current Password</label>
        <asp:TextBox ID="txtCurrent" runat="server" CssClass="form-control"
                     TextMode="Password" placeholder="Enter current password" />
      </div>

      <div class="mb-3">
        <label class="form-label">New Password</label>
        <asp:TextBox ID="txtNew" runat="server" CssClass="form-control"
                     TextMode="Password" placeholder="Create new password" />
      </div>

      <div class="mb-4">
        <label class="form-label">Confirm New Password</label>
        <asp:TextBox ID="txtConfirm" runat="server" CssClass="form-control"
                     TextMode="Password" placeholder="Confirm new password" />
      </div>

      <div class="text-end">
        <a href="Profile.aspx" class="btn btn-outline-fs me-2">Cancel</a>
        <asp:Button ID="btnSave" runat="server" Text="Save Changes"
                    CssClass="btn btn-success px-4" OnClick="btnSave_Click" />
      </div>
    </div>
  </div>

  <!-- RIGHT: TIPS -->
  <div class="col-md-5">
    <div class="pwd-tips">
      <div class="head">
        <div class="icon-circle">🔒</div>
        <div>
          <div class="title">Password Best Practices</div>
          <div class="sub">Creating a strong password helps keep the FoodSaver community safe. We recommend:</div>
        </div>
      </div>
      <ul>
        <li>At least 12 characters long</li>
        <li>A mix of uppercase and lowercase letters</li>
        <li>Include numbers and symbols (e.g., !, @, #)</li>
        <li>Avoid common words or personal info</li>
      </ul>
    </div>
  </div>

</div>

</asp:Content>