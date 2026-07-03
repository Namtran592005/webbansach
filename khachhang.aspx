<%@ Page Title="Thông tin khách hàng - sachweb.vn" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Khachhang.aspx.cs" Inherits="bansach.Khachhang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" />
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-card" style="max-width:600px;">
        <asp:Label CssClass="form-title" Text="Thông tin khách hàng" runat="server" />

        <asp:Panel ID="pnlSearch" runat="server">
            <div class="d-flex gap-2 justify-content-center mb-4 flex-wrap">
                <asp:TextBox ID="txtSDT" runat="server" CssClass="form-control-custom" placeholder="Nhập số điện thoại" Style="max-width:280px;" />
                <asp:Button ID="btnTraCuu" runat="server" Text="TÌM" CssClass="btn-primary" OnClick="btnTraCuu_Click" />
            </div>
            <asp:Label ID="lbloi" runat="server" CssClass="form-error text-center mb-3" />
        </asp:Panel>

        <asp:Panel ID="pnlInfo" runat="server" Visible="false">
            <div style="background:#fafaf5;border:1px solid #d4d4d4;padding:20px;margin-bottom:16px;">
                <div style="font-size:14px;margin-bottom:6px;">
                    <strong>Họ tên:</strong> <asp:Label ID="lblTen" runat="server" />
                </div>
                <div style="font-size:14px;margin-bottom:6px;">
                    <strong>Số điện thoại:</strong> <asp:Label ID="lblSDT" runat="server" />
                </div>
                <div style="font-size:14px;">
                    <strong>Địa chỉ:</strong> <asp:Label ID="lblDiaChi" runat="server" />
                </div>
            </div>
            <asp:Label CssClass="section-title" Text="Lịch sử đơn hàng" runat="server" />
            <asp:GridView ID="gvDonHang" runat="server" AutoGenerateColumns="false" CssClass="data-table" DataKeyNames="MAHD" AllowPaging="true" PageSize="10">
                <Columns>
                    <asp:BoundField DataField="MAHD" HeaderText="Mã HD" />
                    <asp:BoundField DataField="TENKHACHHANG" HeaderText="Khách hàng" />
                    <asp:BoundField DataField="SDT" HeaderText="SĐT" />
                    <asp:BoundField DataField="TONGTIEN" HeaderText="Tổng tiền" DataFormatString="{0:N0} đ" HtmlEncode="false" />
                    <asp:BoundField DataField="NGAYDAT" HeaderText="Ngày đặt" DataFormatString="{0:yyyy-MM-dd HH:mm}" HtmlEncode="false" />
                    <asp:BoundField DataField="TINHTRANG" HeaderText="Tình trạng" />
                </Columns>
            </asp:GridView>
        </asp:Panel>
    </div>
</asp:Content>
