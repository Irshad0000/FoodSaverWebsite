<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="FoodSaver.DashboardPage" %>
<asp:Content ID="C1" ContentPlaceHolderID="MainContent" runat="server">

<div class="db-header">
  <h2>Dashboard</h2>
  <div class="hello">Hello, <asp:Label ID="lblName" runat="server" /> 👋</div>
</div>

<!-- STAT CARDS -->
<div class="stats-row">
  <div class="stat-card">
    <div class="icon icon-orange">🎁</div>
    <div>
      <h4><asp:Label ID="lblDonations" runat="server" Text="0" /></h4>
      <small>Food Donated</small>
    </div>
  </div>
  <div class="stat-card">
    <div class="icon icon-gray">🤝</div>
    <div>
      <h4><asp:Label ID="lblRequests" runat="server" Text="0" /></h4>
      <small>Requests Made</small>
    </div>
  </div>
  <div class="stat-card">
    <div class="icon icon-green">✅</div>
    <div>
      <h4><asp:Label ID="lblMeals" runat="server" Text="0" /></h4>
      <small>Meals Received</small>
    </div>
  </div>
  <div class="stat-card">
    <div class="icon icon-pink">👥</div>
    <div>
      <h4><asp:Label ID="lblPeople" runat="server" Text="0" /></h4>
      <small>People Helped</small>
    </div>
  </div>
</div>

<!-- TWO PANELS -->
<div class="row g-3">
  <div class="col-md-7">
    <div class="panel h-100">
      <h5>Recent Donations</h5>
      <asp:Repeater ID="rptDonations" runat="server">
        <ItemTemplate>
          <div class="list-row">
            <div class="d-flex align-items-center flex-grow-1">
              <div class="thumb">
                <%# string.IsNullOrEmpty(Eval("ImagePath").ToString())
                     ? "🍽️"
                     : "<img src='" + Eval("ImagePath") + "' />" %>
              </div>
              <div class="info">
                <div class="name"><%# Eval("FoodName") %></div>
                <div class="sub">
                  <%# Eval("Quantity") %> •
                  <%# Eval("CreatedAt","{0:dd MMM yyyy}") %>
                </div>
              </div>
            </div>
            <div class="right">
              <span class='<%# "badge-pill-fs badge-" + Eval("Status").ToString().ToLower() %>'>
                <%# Eval("Status") %>
              </span>
            </div>
          </div>
        </ItemTemplate>
      </asp:Repeater>
      <asp:Label ID="lblNoDonations" runat="server" CssClass="text-muted d-block text-center mt-3"
                 Text="No donations yet." Visible="false" />
      <a href="MyDonations.aspx" class="view-all">View All</a>
    </div>
  </div>

  <div class="col-md-5">
    <div class="panel h-100">
      <h5>Available Food Near You</h5>
      <asp:Repeater ID="rptAvailable" runat="server">
        <ItemTemplate>
          <div class="list-row">
            <div class="thumb">🍲</div>
            <div class="info">
              <div class="name"><%# Eval("FoodName") %></div>
              <div class="sub">📍 <%# Eval("Address") %></div>
            </div>
            <div class="right">
              <a href="AvailableFood.aspx" class="btn btn-sm btn-outline-fs">View</a>
            </div>
          </div>
        </ItemTemplate>
      </asp:Repeater>
      <asp:Label ID="lblNoAvailable" runat="server" CssClass="text-muted d-block text-center mt-3"
                 Text="No food available right now." Visible="false" />
      <a href="AvailableFood.aspx" class="view-all">View All</a>
    </div>
  </div>
</div>

</asp:Content>