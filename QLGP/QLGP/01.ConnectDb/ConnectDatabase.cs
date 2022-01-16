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
                    _connection = new System.Data.SqlClient.SqlConnection(@"Data Source=.; Initial Catalog = QLGP; Integrated Security = True;");
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
