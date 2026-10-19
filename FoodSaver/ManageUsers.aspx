<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="FoodSaver.ManageUsers" %>
<asp:Content ID="C1" ContentPlaceHolderID="MainContent" runat="server">

<div class="db-header">
  <div>
    <h2>Manage Users</h2>
    <p class="text-muted mb-0" style="font-size:.92rem;">
      View and manage all registered donors and NGOs in the FoodSaver network.
    </p>
  </div>
</div>

<asp:Label ID="lblMsg" runat="server" CssClass="d-block mb-3" />

<div class="d-flex gap-2 mb-3 flex-wrap">
  <div class="search-bar">
    <i class="bi bi-search"></i>
    <asp:TextBox ID="txtSearch" runat="server" placeholder="Search users by name or email..." />
  </div>

  <asp:DropDownList ID="ddlRoleFilter" runat="server" CssClass="form-select" style="width:160px;"
                    AutoPostBack="true" OnSelectedIndexChanged="Filter_Changed">
    <asp:ListItem Text="All Roles" Value="" />
    <asp:ListItem Text="Donor" Value="Donor" />
    <asp:ListItem Text="NGO" Value="NGO" />
    <asp:ListItem Text="Admin" Value="Admin" />
  </asp:DropDownList>

  <asp:Button ID="btnSearch" runat="server" Text="Search"
              CssClass="btn btn-success px-4" OnClick="Filter_Changed" />
</div>

<div class="panel p-0">
  <asp:Repeater ID="rptUsers" runat="server" OnItemCommand="rptUsers_ItemCommand">
    <HeaderTemplate>
      <table class="data-table">
        <thead>
          <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Role</th>
            <th>Status</th>
            <th>Joined On</th>
            <th style="width:100px;">Action</th>
          </tr>
        </thead>
        <tbody>
    </HeaderTemplate>

    <ItemTemplate>
      <tr>
        <td>
          <span class='<%# "avatar-dot" + (Convert.ToBoolean(Eval("IsActive")) ? "" : " gray") %>'></span>
          <strong style="margin-left:10px;"><%# Eval("FullName") %></strong>
        </td>
        <td><%# Eval("Email") %></td>
        <td>
          <span class='<%# "badge-role " + Eval("Role").ToString().ToLower() %>'>
            <%# Eval("Role") %>
          </span>
        </td>
        <td>
          <span class='<%# "badge-pill-fs " + (Convert.ToBoolean(Eval("IsActive")) ? "badge-active" : "badge-inactive") %>'>
            <%# Convert.ToBoolean(Eval("IsActive")) ? "● Active" : "● Inactive" %>
          </span>
        </td>
        <td><%# Eval("JoinedOn","{0:dd MMM yyyy}") %></td>
        <td>
          <asp:LinkButton runat="server" CommandName="Toggle"
                          CommandArgument='<%# Eval("Id") %>'
                          CssClass="btn btn-sm btn-outline-fs"
                          Text='<%# Convert.ToBoolean(Eval("IsActive")) ? "Disable" : "Enable" %>' />
        </td>
      </tr>
    </ItemTemplate>

    <FooterTemplate>
        </tbody>
      </table>
    </FooterTemplate>
  </asp:Repeater>

  <asp:Label ID="lblNone" runat="server" CssClass="text-muted d-block text-center py-4"
             Text="No users found." Visible="false" />

  <div class="pager">
    <span><asp:Label ID="lblShowing" runat="server" /></span>
  </div>
</div>

</asp:Content>