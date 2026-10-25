<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="RequestFood.aspx.cs" Inherits="FoodSaver.RequestFood" %>
<asp:Content ID="C1" ContentPlaceHolderID="MainContent" runat="server">
    <%-- Request Food page - form for NGOs to request food they need --%>

<div class="db-crumbs">
  <a href="Dashboard.aspx">Dashboard</a> &rsaquo; Request Food
</div>

<div class="db-header">
  <h2>Request Food</h2>
</div>

<asp:Label ID="lblMsg" runat="server" CssClass="d-block mb-3" />

    <%-- Left column: request form, right column: urgency level and submit button --%>
<div class="row g-3">
  <!-- LEFT: FORM -->
  <div class="col-md-8">
    <div class="form-panel">
        <%-- Food type, category, quantity, required date and address --%>
      <h5>Request Information</h5>

      <div class="row g-3">
        <div class="col-md-6">
          <label class="form-label">Food Type</label>
          <asp:DropDownList ID="ddlFoodType" runat="server" CssClass="form-select">
            <asp:ListItem Text="Select food type" Value="" />
            <asp:ListItem Text="Veg" Value="Veg" />
            <asp:ListItem Text="Non-Veg" Value="Non-Veg" />
            <asp:ListItem Text="Bakery" Value="Bakery" />
            <asp:ListItem Text="Packaged" Value="Packaged" />
            <asp:ListItem Text="Beverages" Value="Beverages" />
          </asp:DropDownList>
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
          <label class="form-label">Quantity Needed</label>
          <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" placeholder="Enter quantity" />
        </div>

        <div class="col-md-6">
          <label class="form-label">Required Date</label>
          <asp:TextBox ID="txtRequiredDate" runat="server" CssClass="form-control" TextMode="Date" />
        </div>

        <div class="col-12">
          <label class="form-label">Address</label>
          <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter your address" />
        </div>

        <div class="col-12">
          <label class="form-label">Additional Notes (Optional)</label>
          <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control"
                       TextMode="MultiLine" Rows="4" placeholder="Enter any note" />
        </div>
      </div>
    </div>
  </div>

  <!-- RIGHT: URGENCY + SUBMIT -->
  <div class="col-md-4">
    <div class="form-panel mb-3">
        <%-- Urgency radio buttons - High is selected by default --%>
      <h5>Urgency Level</h5>

      <div class="urgency-option">
        <asp:RadioButton ID="rbLow" runat="server" GroupName="urgency" />
        <label for="<%= rbLow.ClientID %>">
          <div class="title">Low</div>
          <div class="desc">I can wait</div>
        </label>
      </div>

      <div class="urgency-option">
        <asp:RadioButton ID="rbMedium" runat="server" GroupName="urgency" />
        <label for="<%= rbMedium.ClientID %>">
          <div class="title">Medium</div>
          <div class="desc">Within a few days</div>
        </label>
      </div>

      <div class="urgency-option">
        <asp:RadioButton ID="rbHigh" runat="server" GroupName="urgency" Checked="true" />
        <label for="<%= rbHigh.ClientID %>">
          <div class="title">High</div>
          <div class="desc">As soon as possible</div>
        </label>
      </div>
    </div>

      <%-- Submit button - handled by btnSubmit_Click in code-behind --%>
    <asp:Button ID="btnSubmit" runat="server" Text="Submit Request"
                CssClass="btn btn-success w-100 py-3" OnClick="btnSubmit_Click" />
  </div>
</div>

</asp:Content>