<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="FoodSaver.AdminDashboard" %>
<asp:Content ID="C1" ContentPlaceHolderID="MainContent" runat="server">

<div class="db-header">
  <h2>Admin Dashboard</h2>
</div>

<!-- STAT CARDS -->
<div class="stats-row">
  <div class="stat-card">
    <div class="icon icon-green">👥</div>
    <div>
      <h4><asp:Label ID="lblUsers" runat="server" Text="0" /></h4>
      <small>Total Users</small>
    </div>
  </div>
  <div class="stat-card">
    <div class="icon icon-green">🎁</div>
    <div>
      <h4><asp:Label ID="lblDonations" runat="server" Text="0" /></h4>
      <small>Total Donations</small>
    </div>
  </div>
  <div class="stat-card">
    <div class="icon icon-green">📥</div>
    <div>
      <h4><asp:Label ID="lblRequests" runat="server" Text="0" /></h4>
      <small>Total Requests</small>
    </div>
  </div>
  <div class="stat-card">
    <div class="icon icon-green">🤝</div>
    <div>
      <h4><asp:Label ID="lblNGOs" runat="server" Text="0" /></h4>
      <small>NGO Partners</small>
    </div>
  </div>
</div>

<div class="row g-3">
  <!-- RECENT DONATIONS -->
  <div class="col-md-6">
    <div class="panel h-100">
      <h5>Recent Donations</h5>

      <asp:Repeater ID="rptRecentDonations" runat="server">
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
                  <%# Eval("Quantity") %> • Donor: <%# Eval("DonorName") %>
                </div>
              </div>
            </div>
            <div class="right text-muted small">
              <%# Eval("CreatedAt","{0:dd MMM yyyy}") %>
            </div>
          </div>
        </ItemTemplate>
      </asp:Repeater>

      <a href="ManageDonations.aspx" class="view-all">View All Donations</a>
    </div>
  </div>

  <!-- RECENT REQUESTS -->
  <div class="col-md-6">
    <div class="panel h-100">
      <h5>Recent Requests</h5>

      <asp:Repeater ID="rptRecentRequests" runat="server">
        <ItemTemplate>
          <div class="list-row">
            <div class="d-flex align-items-center flex-grow-1">
              <div class="thumb" style="background:var(--fs-green-light);">📥</div>
              <div class="info">
                <div class="name"><%# Eval("FoodType") %></div>
                <div class="sub">
                  Requested by: <%# Eval("RequesterName") %>
                </div>
              </div>
            </div>
            <div class="right text-muted small">
              <%# Eval("CreatedAt","{0:dd MMM yyyy}") %>
            </div>
          </div>
        </ItemTemplate>
      </asp:Repeater>

      <a href="ManageRequests.aspx" class="view-all">View All Requests</a>
    </div>
  </div>
</div>

</asp:Content>