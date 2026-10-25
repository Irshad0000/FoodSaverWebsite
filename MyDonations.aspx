<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="MyDonations.aspx.cs" Inherits="FoodSaver.MyDonations" %>
<asp:Content ID="C1" ContentPlaceHolderID="MainContent" runat="server">
    <%-- My Donations page - table listing all donations made by the logged-in donor --%>

<div class="db-crumbs">
  <a href="Dashboard.aspx">Dashboard</a> &rsaquo; My Donations
</div>

<div class="db-header">
  <h2>My Donations</h2>
</div>

    <%-- Repeater builds a table: header row, one row per donation, closing footer --%>
<div class="panel">

    <%-- Donations table - bound from code-behind with donation details and status --%>
  <asp:Repeater ID="rptMy" runat="server">
    <HeaderTemplate>
      <table class="data-table">
        <thead>
          <tr>
            <th>Food Item</th>
            <th>Quantity</th>
            <th>To (NGO)</th>
            <th>Date</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
    </HeaderTemplate>

    <ItemTemplate>
      <tr>

        <td><%# Eval("FoodName") %></td>
        <td><%# Eval("Quantity") %></td>
          <%-- Show a dash if the donation hasn't been claimed by any NGO yet --%>
        <td><%# Eval("NGOName") == DBNull.Value || Eval("NGOName") == null ? "—" : Eval("NGOName") %></td>
        <td><%# Eval("CreatedAt","{0:dd MMM yyyy}") %></td>
        <td>
          <span class='<%# "badge-pill-fs badge-" + Eval("Status").ToString().ToLower() %>'>
            <%# Eval("Status") %>
          </span>
        </td>
      </tr>
    </ItemTemplate>

    <FooterTemplate>
        </tbody>
      </table>
    </FooterTemplate>
  </asp:Repeater>

    <%-- Empty-state message shown when the donor has no donations --%>
  <asp:Label ID="lblNone" runat="server" CssClass="text-muted d-block text-center py-4"
             Text="You haven't made any donations yet." Visible="false" />

  <div class="pager">
    <span>Showing all entries</span>
  </div>
</div>

</asp:Content>