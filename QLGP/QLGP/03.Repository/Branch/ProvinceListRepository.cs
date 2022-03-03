using ConnectDb;
using Dapper;
using System.Data;

namespace Repository
{
    public class ProvinceListRepository: Query
    {
        public List<dynamic> ExecuteQuery(IDbConnect conn)
        {
            using (var cmd = conn.Connection)
            {
                var procedure = "vnsp_Branch_getProvinceList";
                var data = cmd.Query(procedure, null, commandType: CommandType.StoredProcedure).ToList();
                return data;
            }
        }
    }
}
