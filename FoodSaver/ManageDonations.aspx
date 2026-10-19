<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ManageDonations.aspx.cs" Inherits="FoodSaver.ManageDonations" %>
<asp:Content ID="C1" ContentPlaceHolderID="MainContent" runat="server">

<div class="db-header">
  <h2>Manage Donations</h2>
</div>

<div class="d-flex gap-2 mb-3 flex-wrap">
  <div class="search-bar">
    <i class="bi bi-search"></i>
    <asp:TextBox ID="txtSearch" runat="server" placeholder="Search donations..." />
  </div>

  <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select" style="width:160px;"
                    AutoPostBack="true" OnSelectedIndexChanged="Filter_Changed">
    <asp:ListItem Text="All Status" Value="" />
    <asp:ListItem Text="Pending" Value="Pending" />
    <asp:ListItem Text="Completed" Value="Completed" />
    <asp:ListItem Text="Cancelled" Value="Cancelled" />
  </asp:DropDownList>

  <asp:Button ID="btnSearch" runat="server" Text="Search"
              CssClass="btn btn-success px-4" OnClick="Filter_Changed" />
</div>

<div class="panel p-0">
  <asp:Repeater ID="rptDonations" runat="server">
    <HeaderTemplate>
      <table class="data-table">
        <thead>
          <tr>
            <th>Food Item</th>
            <th>Donor</th>
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
        <td><%# Eval("DonorName") %></td>
        <td><%# Eval("Quantity") %></td>
        <td><%# Eval("NGOName") == DBNull.Value ? "—" : Eval("NGOName") %></td>
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
             Text="No donations found." Visible="false" />

  <div class="pager">
    <span><asp:Label ID="lblShowing" runat="server" /></span>
  </div>
</div>

</asp:Content>