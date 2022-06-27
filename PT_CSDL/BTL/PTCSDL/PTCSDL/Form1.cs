using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Excel = Microsoft.Office.Interop.Excel;

namespace PTCSDL
{
    public partial class Form1 : Form
    {

        Classes.DataProcess dtBase = new Classes.DataProcess();
        DataTable dtDoanhThu;

        public Form1()
        {
            InitializeComponent();
        }

        void LoadData()
        {
            dgvDoanhThu.DataSource = dtBase.SelectData("Select * from VeDoanhThu()");
        }

        private double tongTien()
        {
            double sum = 0;
            for (int i = 0; i < dgvDoanhThu.Rows.Count - 1; i++)
            {
                sum += double.Parse(dgvDoanhThu.Rows[i].Cells[3].Value.ToString());
            }
            return sum;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            LoadData();
            dgvDoanhThu.Columns[0].HeaderText = "Mã Phim";
            dgvDoanhThu.Columns[1].HeaderText = "Tên Phim";
            dgvDoanhThu.Columns[2].HeaderText = "Tổng Số Vé";
            dgvDoanhThu.Columns[3].HeaderText = "Doanh Thu";
            dgvDoanhThu.Columns[1].Width = 200;

            txtDoanhThu.Text = tongTien().ToString();
        }

        private void btnTim_Click(object sender, EventArgs e)
        {
            if (txtPhim.Text.Trim() != "")
            {
                dgvDoanhThu.DataSource = dtBase.SelectData("Select * from VeDoanhThuPhim('" + txtPhim.Text + "')");
                txtDoanhThu.Text = tongTien().ToString();
            }
            else
            {
                LoadData();
                txtDoanhThu.Text = tongTien().ToString();
            }
        }

        private void dgvDoanhThu_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                txtDoanhThu.Text = double.Parse(dgvDoanhThu.CurrentRow.Cells[3].Value.ToString()).ToString();
            }
            catch
            {

            }
        }

        private void btnIn_Click(object sender, EventArgs e)
        {
            dtDoanhThu = (DataTable)dgvDoanhThu.DataSource;
            if (dtDoanhThu.Rows.Count > 0)
            {
                //Khai báo và khởi tạo các đối tượng
                Excel.Application exApp = new Excel.Application();
                Excel.Workbook exBook = exApp.Workbooks.Add(Excel.XlWBATemplate.xlWBATWorksheet);
                Excel.Worksheet exSheet = (Excel.Worksheet)exBook.Worksheets[1];

                //Định dạng chung
                Excel.Range tieude = (Excel.Range)exSheet.Cells[1, 1];
                tieude.Font.Size = 12;
                tieude.Font.Bold = true;
                tieude.Font.Color = Color.Blue;
                tieude.Value = "DOANH THU THEO PHIM";

                exSheet.get_Range("A4:E4").Font.Bold = true;
                exSheet.get_Range("A4:E4").Font.Color = Color.Red;
                exSheet.get_Range("A4:E4").HorizontalAlignment = Microsoft.Office.Interop.Excel.XlHAlign.xlHAlignCenter;
                exSheet.get_Range("A4").Value = "STT";
                exSheet.get_Range("B4").Value = "Mã Phim";
                exSheet.get_Range("C4").Value = "Tên Phim";
                exSheet.get_Range("D4").Value = "Tổng Vé";
                exSheet.get_Range("E4").Value = "Doanh Thu";
                exSheet.get_Range("C4").ColumnWidth = 20;
                exSheet.get_Range("E4").ColumnWidth = 20;

                //In dữ liệu
                for (int i = 0; i < dtDoanhThu.Rows.Count; i++)
                {
                    exSheet.get_Range("A" + (i + 5).ToString() + ":E" + (i + 8).ToString()).Font.Bold = false;
                    exSheet.get_Range("A" + (i + 5).ToString() + ":E" + (i + 8).ToString()).HorizontalAlignment = Microsoft.Office.Interop.Excel.XlHAlign.xlHAlignCenter;
                    exSheet.get_Range("A" + (i + 5).ToString()).Value = (i + 1).ToString();
                    exSheet.get_Range("B" + (i + 5).ToString()).Value = dtDoanhThu.Rows[i][0].ToString();
                    exSheet.get_Range("C" + (i + 5).ToString()).Value = dtDoanhThu.Rows[i][1].ToString();

                    exSheet.get_Range("D" + (i + 5).ToString()).Value = dtDoanhThu.Rows[i][2].ToString();
                    exSheet.get_Range("E" + (i + 5).ToString()).Value = dtDoanhThu.Rows[i][3].ToString();
                }
                exSheet.get_Range("A" + (dtDoanhThu.Rows.Count + 7).ToString()).Value = "Tổng doanh thu ";
                exSheet.get_Range("A" + (dtDoanhThu.Rows.Count + 7).ToString() + ":B" + (dtDoanhThu.Rows.Count + 7).ToString()).Merge(true);
                exSheet.get_Range("C" + (dtDoanhThu.Rows.Count + 7).ToString()).HorizontalAlignment = Microsoft.Office.Interop.Excel.XlHAlign.xlHAlignCenter;
                exSheet.get_Range("C" + (dtDoanhThu.Rows.Count + 7).ToString()).Value = txtDoanhThu.Text;
                exSheet.Name = "Doanh Thu Theo Phim";
                exBook.Activate(); //Kích hoạt file Excel
                                   //Thiết lập các thuộc tính của SaveFileDialog
                dlgSave.Filter = "Excel Document(*.xls)|*.xls |Word Document(*.doc) | *.doc | All files(*.*) | *.* ";
                dlgSave.FilterIndex = 1;
                dlgSave.AddExtension = true;
                dlgSave.DefaultExt = ".xls";

                if (dlgSave.ShowDialog() == System.Windows.Forms.DialogResult.OK)
                    exBook.SaveAs(dlgSave.FileName.ToString());//Lưu file Excel
                exApp.Quit();//Thoát khỏi ứng dụng
            }
        }
    }
}
