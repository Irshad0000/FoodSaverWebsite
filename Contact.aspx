<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="FoodSaver.Contact" %>
<asp:Content ID="C1" ContentPlaceHolderID="MainContent" runat="server">

<section class="container py-5">
  <div class="text-center mb-5">
    <h1 class="fw-bold" style="color:var(--fs-green); font-size:2.6rem;">Get in Touch</h1>
    <p class="text-muted">Questions, feedback, or partnership ideas — we'd love to hear from you.</p>
  </div>

  <div class="row justify-content-center g-4">
    <div class="col-md-5">
      <div class="panel h-100">
        <h5>Reach Us</h5>
        <div class="mb-3">
          <strong>Email</strong><br />
          <span class="text-muted">hello@foodsaver.com</span>
        </div>
        <div class="mb-3">
          <strong>Phone</strong><br />
          <span class="text-muted">+91 98054931</span>
        </div>
        <div>
          <strong>Address</strong><br />
          <span class="text-muted">FoodSaver HQ, Rajkot, Gujarat, India</span>
        </div>
      </div>
    </div>

    <div class="col-md-5">
      <div class="panel">
        <h5>Send a Message</h5>

        <asp:Label ID="lblMsg" runat="server" CssClass="d-block mb-2" />

        <div class="mb-3">
          <label class="form-label">Your Name</label>
          <asp:TextBox ID="txtName" runat="server" CssClass="form-control" MaxLength="50" placeholder="Your name" />
          <asp:RequiredFieldValidator ID="rfvContactName" runat="server" ControlToValidate="txtName"
              ErrorMessage="Name is required." Display="Dynamic" CssClass="text-danger" />
          <asp:RegularExpressionValidator ID="revContactName" runat="server" ControlToValidate="txtName"
              ErrorMessage="Name can contain letters and spaces only." Display="Dynamic" CssClass="text-danger"
              ValidationExpression="^[A-Za-z ]+$" />
        </div>
        <div class="mb-3">
          <label class="form-label">Email</label>
          <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="SingleLine" MaxLength="50" placeholder="you@example.com" />
          <asp:RequiredFieldValidator ID="rfvContactEmail" runat="server" ControlToValidate="txtEmail"
              ErrorMessage="Email is required." Display="Dynamic" CssClass="text-danger" />
          <asp:RegularExpressionValidator ID="revContactEmail" runat="server" ControlToValidate="txtEmail"
              ErrorMessage="Enter a valid email address." Display="Dynamic" CssClass="text-danger"
              ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" />
        </div>
        <div class="mb-3">
          <label class="form-label">Message</label>
          <asp:TextBox ID="txtMsg" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"
                       MaxLength="150" placeholder="Type your message..." />
          <asp:RequiredFieldValidator ID="rfvContactMessage" runat="server" ControlToValidate="txtMsg"
              ErrorMessage="Message is required." Display="Dynamic" CssClass="text-danger" />
        </div>
        <asp:Button ID="btnSend" runat="server" Text="Send Message"
                    CssClass="btn btn-success w-100 py-2" OnClick="btnSend_Click" />
      </div>
    </div>
  </div>
</section>

</asp:Content>