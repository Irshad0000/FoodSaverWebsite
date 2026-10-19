<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="MyDonations.aspx.cs" Inherits="FoodSaver.MyDonations" %>
<asp:Content ID="C1" ContentPlaceHolderID="MainContent" runat="server">

<div class="db-crumbs">
  <a href="Dashboard.aspx">Dashboard</a> &rsaquo; My Donations
</div>

<div class="db-header">
  <h2>My Donations</h2>
</div>

<div class="panel">
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

  <asp:Label ID="lblNone" runat="server" CssClass="text-muted d-block text-center py-4"
             Text="You haven't made any donations yet." Visible="false" />

  <div class="pager">
    <span>Showing all entries</span>
  </div>
</div>

</asp:Content>