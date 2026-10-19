<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ManageRequests.aspx.cs" Inherits="FoodSaver.ManageRequests" %>

<asp:Content ID="C1" ContentPlaceHolderID="MainContent" runat="server">

<div class="db-header">
  <div>
    <h2>Manage Request</h2>
    <p class="text-muted mb-0" style="font-size:.92rem;">
      Monitor, filter, and process incoming food requests from registered NGOs and community centers.
    </p>
  </div>
</div>

<div class="search-bar mb-3" style="max-width:500px;">
  <i class="bi bi-search"></i>
  <asp:TextBox ID="txtSearch" runat="server" placeholder="Search by ID, NGO, or item..." />
</div>

<div class="tabs">
  <asp:LinkButton runat="server" ID="tabAll"       CommandArgument=""          OnClick="Tab_Click" CssClass='<%# TabClass("") %>'          Text="All Requests" />
  <asp:LinkButton runat="server" ID="tabPending"   CommandArgument="Pending"   OnClick="Tab_Click" CssClass='<%# TabClass("Pending") %>'   Text="Pending" />
  <asp:LinkButton runat="server" ID="tabCompleted" CommandArgument="Completed" OnClick="Tab_Click" CssClass='<%# TabClass("Completed") %>' Text="Completed" />
  <asp:LinkButton runat="server" ID="tabCancelled" CommandArgument="Cancelled" OnClick="Tab_Click" CssClass='<%# TabClass("Cancelled") %>' Text="Cancelled" />
</div>

<div class="panel p-0">
  <asp:Repeater ID="rptRequests" runat="server">
    <HeaderTemplate>
      <table class="data-table">
        <thead>
          <tr>
            <th>Request ID</th>
            <th>Requested By</th>
            <th>Item Requested</th>
            <th>Qty</th>
            <th>Urgency</th>
            <th>Date</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
    </HeaderTemplate>

    <ItemTemplate>
      <tr>
        <td style="color:var(--fs-green); font-weight:600;">#REQ-<%# Eval("Id") %></td>
        <td><%# Eval("RequesterName") %></td>
        <td>
          <%# Eval("FoodType") %>
          <%# string.IsNullOrEmpty(Eval("Category").ToString()) ? "" : " (" + Eval("Category") + ")" %>
        </td>
        <td><%# Eval("Quantity") %></td>
        <td>
          <span class='<%# "badge-pill-fs badge-" + Eval("Urgency").ToString().ToLower() %>'>
            <%# Eval("Urgency") %>
          </span>
        </td>
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
             Text="No requests found." Visible="false" />

  <div class="pager">
    <span><asp:Label ID="lblShowing" runat="server" /></span>
  </div>
</div>

</asp:Content>