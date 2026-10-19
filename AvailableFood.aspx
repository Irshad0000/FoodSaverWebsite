<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="AvailableFood.aspx.cs" Inherits="FoodSaver.AvailableFood" %>
<asp:Content ID="C1" ContentPlaceHolderID="MainContent" runat="server">

<div class="db-crumbs"><a href="Dashboard.aspx">Dashboard</a> &rsaquo; Available Food</div>
<div class="db-header"><h2>Available Food Near You</h2></div>

<div class="panel">
  <asp:Repeater ID="rptFood" runat="server">
    <ItemTemplate>
      <div class="list-row">
        <div class="thumb">
          <%# string.IsNullOrEmpty(Eval("ImagePath").ToString())
                ? "🍲"
                : "<img src='" + Eval("ImagePath") + "' />" %>
        </div>
        <div class="info">
          <div class="name"><%# Eval("FoodName") %></div>
          <div class="sub">
            <%# Eval("Quantity") %> • <%# Eval("FoodType") %> • 📍 <%# Eval("Address") %>
          </div>
        </div>
        <div class="right">
          <asp:LinkButton runat="server"
                          CssClass="btn btn-sm btn-success"
                          CommandArgument='<%# Eval("Id") %>'
                          OnClick="Claim_Click"
                          Text="Claim" />
        </div>
      </div>
    </ItemTemplate>
  </asp:Repeater>

  <asp:Label ID="lblNone" runat="server" CssClass="text-muted d-block text-center py-4"
             Text="No food available right now." Visible="false" />
</div>

</asp:Content>