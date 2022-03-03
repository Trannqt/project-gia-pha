using System.Data;
using System.Data.Common;

namespace ConnectDb
{
    public class ConnectDatabase : IDbConnect
    {
        private DbConnection _connection;

        public DbConnection Connection
        {
            get
            {
                if (_connection == null)
                {
                    //_connection = new System.Data.SqlClient.SqlConnection(@"workstation id=VietNamGiaPha.mssql.somee.com;packet size=4096;user id=trannqt_SQLLogin_1;pwd=9otaoqk6yk;data source=VietNamGiaPha.mssql.somee.com;persist security info=False;initial catalog=VietNamGiaPha");
                    _connection = new System.Data.SqlClient.SqlConnection(@"Data Source=.; Initial Catalog = VNGP; Integrated Security = True;");
                    _connection.Open();
                }
                else if (_connection.State != ConnectionState.Open)
                {
                    _connection.Open();
                }
                return _connection;
            }
        }

        public void SeedDatabase()
        {

        }
    }
}
