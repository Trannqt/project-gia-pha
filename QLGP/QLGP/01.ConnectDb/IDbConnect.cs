using System.Data.Common;

namespace ConnectDb
{
    public interface IDbConnect 
    {
        DbConnection Connection { get; }
        void SeedDatabase();
    }
}
