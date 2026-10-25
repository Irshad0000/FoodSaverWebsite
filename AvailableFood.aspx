<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="AvailableFood.aspx.cs" Inherits="FoodSaver.AvailableFood" %>
<asp:Content ID="C1" ContentPlaceHolderID="MainContent" runat="server">
    <%-- Available Food listing page - shows all unclaimed food items to the logged-in user --%>

    <%-- Breadcrumb navigation back to the dashboard --%>
<div class="db-crumbs"><a href="Dashboard.aspx">Dashboard</a> &rsaquo; Available Food</div>
<div class="db-header"><h2>Available Food Near You</h2></div>

<div class="panel">
    <%-- Repeater binds to the list of available food items set in code-behind --%>
  <asp:Repeater ID="rptFood" runat="server">
    <ItemTemplate>
      <div class="list-row">
        <div class="thumb">
            <%-- Show uploaded image if present, otherwise fall back to a default food emoji --%>
          <%# string.IsNullOrEmpty(Eval("ImagePath").ToString())
                ? "🍲"
                : "<img src='" + Eval("ImagePath") + "' />" %>
        </div>
        <div class="info">
          <div class="name"><%# Eval("FoodName") %></div>
          <div class="sub">
              <%-- Quantity, food type and pickup address for each item --%>
            <%# Eval("Quantity") %> • <%# Eval("FoodType") %> • 📍 <%# Eval("Address") %>
          </div>
        </div>
        <div class="right">
            <%-- Claim button - passes the food item Id to the Claim_Click handler --%>
          <asp:LinkButton runat="server"
                          CssClass="btn btn-sm btn-success"
                          CommandArgument='<%# Eval("Id") %>'
                          OnClick="Claim_Click"
                          Text="Claim" />
        </div>
      </div>
    </ItemTemplate>
  </asp:Repeater>
    <%-- Shown only when there are no available items (controlled from code-behind) --%>

  <asp:Label ID="lblNone" runat="server" CssClass="text-muted d-block text-center py-4"
             Text="No food available right now." Visible="false" />
</div>

</asp:Content>