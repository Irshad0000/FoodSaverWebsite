<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Notifications.aspx.cs" Inherits="FoodSaver.Notifications" %>
<asp:Content ID="C1" ContentPlaceHolderID="MainContent" runat="server">

<div class="db-header">
  <div>
    <h2>Notifications</h2>
    <div class="text-muted" style="font-size:.92rem;">Stay updated on your food rescue journey.</div>
  </div>
  <asp:LinkButton ID="lnkMarkAll" runat="server" CssClass="link-green"
                  Text="✓ Mark all as read" OnClick="lnkMarkAll_Click" />
</div>

<div class="panel p-0">
  <asp:Repeater ID="rptNotif" runat="server">
    <ItemTemplate>
      <div class='<%# "notif-row" + (Convert.ToBoolean(Eval("IsRead")) ? "" : " unread") %>'>
        <div class='<%# "notif-icon " + GetIconClass(Eval("Icon")) %>'>
          <%# Eval("Icon") %>
        </div>
        <div class="notif-body">
          <div class="t"><%# Eval("Title") %></div>
          <div class="m"><%# Eval("Message") %></div>
        </div>
        <div class="notif-time"><%# TimeAgo(Convert.ToDateTime(Eval("CreatedAt"))) %></div>
      </div>
    </ItemTemplate>
  </asp:Repeater>

  <asp:Label ID="lblNone" runat="server" CssClass="text-muted d-block text-center py-5"
             Text="No notifications yet." Visible="false" />
</div>

</asp:Content>