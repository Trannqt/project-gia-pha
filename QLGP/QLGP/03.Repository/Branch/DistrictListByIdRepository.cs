using ConnectDb;
using Dapper;
using System.Data;

namespace Repository
{
    public class DistrictListByIdRepository: Query
    {
        public int provinceID { get; set; }
        public List<dynamic> ExecuteQuery(IDbConnect conn)
        {
            using (var cmd = conn.Connection)
            {
                var procedure = "vnsp_Branch_getDistrictListByIdList";
                var values = new { provinceID = provinceID };
                var data = cmd.Query(procedure, values, commandType: CommandType.StoredProcedure).ToList();
                return data;
            }
        }
    }
}
