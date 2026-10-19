<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="FoodSaver.Profile" %>
<asp:Content ID="C1" ContentPlaceHolderID="MainContent" runat="server">

<div class="db-header">
  <h2>Profile</h2>
</div>

<asp:Label ID="lblMsg" runat="server" CssClass="d-block mb-3" />

<div class="row g-3">

  <!-- LEFT: SUMMARY -->
  <div class="col-md-4">
    <div class="profile-left">
      <div class="avatar">
        <asp:Image ID="imgAvatar" runat="server" Visible="false" />
           <span id="initialSpan" runat="server"></span>
          <div class="check">✓</div>
      </div>

      <div class="name"><asp:Label ID="lblName" runat="server" /></div>
      <div class="email"><asp:Label ID="lblEmail" runat="server" /></div>

      <div class="text-center mb-3">
        <span class='<%# "badge-role " + RoleClass %>'>
          <asp:Label ID="lblRole" runat="server" />
        </span>
      </div>

  <div class="meta"><i class="bi bi-telephone"></i> <asp:Label ID="lblPhone" runat="server" /></div>
<div class="meta"><i class="bi bi-calendar"></i> Member Since: <asp:Label ID="lblJoined" runat="server" /></div>

<asp:Button ID="btnEditProfile" runat="server" Text="Edit Profile"
            CssClass="btn btn-success w-100 mb-2"
            OnClick="btnEditProfile_Click" />

<a href="ChangePassword.aspx" class="btn btn-outline-fs w-100">Change Password</a>
    </div>
  </div>

  <!-- RIGHT: FORM -->
  <div class="col-md-8">
    <div class="panel">
      <h5>Personal Information</h5>

      <div class="row g-3">
        <div class="col-md-6">
          <label class="form-label">Full Name</label>
          <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
        </div>
        <div class="col-md-6">
          <label class="form-label">Email Address</label>
          <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ReadOnly="true" />
        </div>
        <div class="col-md-6">
          <label class="form-label">Phone Number</label>
          <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />
        </div>
        <div class="col-12">
          <label class="form-label">Address</label>
          <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"
                       TextMode="MultiLine" Rows="3" />
        </div>
      </div>

      <div class="text-end mt-4">
        <asp:Button ID="btnSave" runat="server" Text="Save Changes"
                    CssClass="btn btn-success px-4 py-2" OnClick="btnSave_Click" />
      </div>
    </div>
  </div>

</div>

</asp:Content>