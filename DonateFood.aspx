<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="DonateFood.aspx.cs" Inherits="FoodSaver.DonateFood" %>
<asp:Content ID="C1" ContentPlaceHolderID="MainContent" runat="server">
    <%-- Donate Food page - form for donors to submit a new food donation --%>

<div class="db-crumbs">
  <a href="Dashboard.aspx">Dashboard</a> &rsaquo; Donate Food
</div>

<div class="db-header">
  <h2>Donate Food</h2>
</div>

<asp:Label ID="lblMsg" runat="server" CssClass="d-block mb-3" />

    <%-- Left column: donation form, right column: image upload and submit button --%>
<div class="row g-3">
  <!-- LEFT: FORM -->
  <div class="col-md-8">
    <div class="form-panel">
      <h5>Food Information</h5>

      <div class="row g-3">
        <div class="col-md-6">
          <label class="form-label">Food Name</label>
            <%-- Basic food details - name, type, quantity and category --%>
          <asp:TextBox ID="txtFoodName" runat="server" CssClass="form-control" placeholder="Enter food name" />
        </div>

        <div class="col-md-6">
          <label class="form-label">Food Type</label>
          <asp:DropDownList ID="ddlFoodType" runat="server" CssClass="form-select">
            <asp:ListItem Text="Select type" Value="" />
            <asp:ListItem Text="Veg" Value="Veg" />
            <asp:ListItem Text="Non-Veg" Value="Non-Veg" />
            <asp:ListItem Text="Bakery" Value="Bakery" />
            <asp:ListItem Text="Packaged" Value="Packaged" />
          </asp:DropDownList>
        </div>

        <div class="col-md-6">
          <label class="form-label">Quantity</label>
          <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" placeholder="Enter quantity" />
        </div>

        <div class="col-md-6">
          <label class="form-label">Food Category</label>
          <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select">
            <asp:ListItem Text="Select category" Value="" />
            <asp:ListItem Text="Cooked" Value="Cooked" />
            <asp:ListItem Text="Fresh" Value="Fresh" />
            <asp:ListItem Text="Packaged" Value="Packaged" />
            <asp:ListItem Text="Beverages" Value="Beverages" />
          </asp:DropDownList>
        </div>

        <div class="col-md-6">
            <%-- Pickup date and time so the NGO knows when to collect --%>
          <label class="form-label">Pick-up Date</label>
          <asp:TextBox ID="txtPickupDate" runat="server" CssClass="form-control" TextMode="Date" />
        </div>

        <div class="col-md-6">
          <label class="form-label">Pick-up Time</label>
          <asp:TextBox ID="txtPickupTime" runat="server" CssClass="form-control" TextMode="Time" />
        </div>

        <div class="col-12">
          <label class="form-label">Address</label>
          <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter full address" />
        </div>

        <div class="col-12">
          <label class="form-label">Additional Notes (Optional)</label>
          <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control"
                       TextMode="MultiLine" Rows="3" placeholder="Enter any note" />
        </div>
      </div>
    </div>
  </div>

  <!-- RIGHT: IMAGE + SUBMIT -->
  <div class="col-md-4">
    <div class="form-panel mb-3">
      <h5>Food Image</h5>

      <label class="uploader" for="<%= fileImage.ClientID %>">
        <div class="icon-circle">🖼️</div>
        <div class="txt">Upload Image</div>
        <div class="hint">JPG, PNG up to 5MB</div>
        <asp:FileUpload ID="fileImage" runat="server" CssClass="d-none" />
      </label>

      <asp:Label ID="lblImageName" runat="server" CssClass="text-muted d-block text-center mt-2 small" />
    </div>

      <%-- Submit button - handled by btnSubmit_Click in code-behind --%>
    <asp:Button ID="btnSubmit" runat="server" Text="Submit Donation"
                CssClass="btn btn-success w-100 py-3" OnClick="btnSubmit_Click" />
  </div>
</div>

</asp:Content>