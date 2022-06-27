using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Diagnostics;

namespace PTCSDL.Classes
{
    class DataProcess
    {
        //B1 : ChuOI KET NOI
        string ConnectString = "Data Source=DESKTOP-UDQ1S81\\MSSQLSERVER03;Initial Catalog=test1;Integrated Security=True";
        //B2: Mo ket noi
        SqlConnection sqlConnect = null;
        //Phuong thuc mo ket noi 
        void OpenConnect()
        {
            sqlConnect = new SqlConnection(ConnectString);
            if (sqlConnect.State != System.Data.ConnectionState.Open)
                sqlConnect.Open();
        }

        //Phuong thuc dong ket noi 
        void CloseConnect()
        {
            if (sqlConnect.State != ConnectionState.Closed)
                sqlConnect.Close();
            sqlConnect.Dispose();
        }

        //Phuong thuc thuc hien cau lenh sql Select và tra ve 1 datatable
        public DataTable SelectData(string sqlSelect)
        {
            DataTable dtResult = new DataTable();
            OpenConnect();
            SqlDataAdapter sqlData = new SqlDataAdapter(sqlSelect, sqlConnect);
            sqlData.Fill(dtResult); // do du lieu len dataTable
            CloseConnect();
            sqlData.Dispose();
            return dtResult;
        }
        //Insert , update , delete
        public void UpdateData(string sql)
        {
            OpenConnect();
            SqlCommand sqlComm = new SqlCommand();
            sqlComm.Connection = sqlConnect;
            sqlComm.CommandText = sql;
            sqlComm.ExecuteNonQuery(); // thuc thi lenh sql
            CloseConnect();
            sqlComm.Dispose();
        }

        //public void procDoanhThuThang(int x)
        //{
        //    SqlCommand pvCommand = new SqlCommand("DoanhThuThang", sqlConnect);
        //    pvCommand.CommandType = CommandType.StoredProcedure;
        //    pvCommand.Parameters.Add("@thang", SqlDbType.Int).Value = x;

        //    SqlParameter pvDoanhThu = new SqlParameter();
        //    pvDoanhThu.ParameterName = "@doanhthu";
        //    pvDoanhThu.DbType = DbType.Double;
        //    pvDoanhThu.Direction = ParameterDirection.Output;
        //    pvCommand.Parameters.Add(pvDoanhThu);
        //}
    }
}
