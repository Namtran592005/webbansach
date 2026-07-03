using System;
using System.Linq;

namespace bansach
{
    public partial class Khachhang : System.Web.UI.Page
    {
        DataClassesDataContext dc = DatabaseConfig.GetContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["TAIKHOAN"] != null)
                {
                    string tk = Session["TAIKHOAN"].ToString();
                    var user = dc.TBL_TAIKHOANs.FirstOrDefault(u => u.TAIKHOAN == tk);
                    if (user != null && !string.IsNullOrWhiteSpace(user.SDT))
                    {
                        txtSDT.Text = user.SDT;
                        LoadOrdersBySDT(user.SDT);
                    }
                }
            }
        }

        private void LoadOrdersBySDT(string sdt)
        {
            var list = (from h in dc.TBL_HOADONs
                        where h.SDT.Contains(sdt)
                        select new
                        {
                            MAHD = h.MAHD,
                            TENKHACHHANG = h.TENKHACHHANG,
                            SDT = h.SDT,
                            TONGTIEN = dc.TBL_CHITIET_HOADONs
                                .Where(ct => ct.MAHD == h.MAHD)
                                .Sum(ct => ct.THANHTIEN),
                            NGAYDAT = h.NGAYDAT,
                            TINHTRANG = h.TINHTRANG
                        })
                        .OrderByDescending(h => h.NGAYDAT)
                        .ToList();

            if (list.Count == 0)
            {
                lbloi.Text = "Chưa có đơn hàng nào!";
                pnlInfo.Visible = false;
                return;
            }

            lbloi.Text = "";
            var first = dc.TBL_HOADONs.FirstOrDefault(h => h.SDT == sdt);
            if (first != null)
            {
                lblTen.Text = first.TENKHACHHANG;
                lblSDT.Text = first.SDT;
                lblDiaChi.Text = first.DIACHIGIAOHANG;
            }

            gvDonHang.DataSource = list;
            gvDonHang.DataBind();
            pnlInfo.Visible = true;
        }

        protected void btnTraCuu_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtSDT.Text))
            {
                lbloi.Text = "Vui lòng nhập số điện thoại!";
                pnlInfo.Visible = false;
                return;
            }

            LoadOrdersBySDT(txtSDT.Text.Trim());
        }
    }
}