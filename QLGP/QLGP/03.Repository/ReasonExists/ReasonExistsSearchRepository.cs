using ConnectDb;
using Domain;
using Dapper;
using System.Data;

namespace Repository
{
    public class ReasonExistsSearchRepository: Query
    {
        public List<dynamic> ExecuteQuery(IDbConnect conn)
        {
            using (var cmd = conn.Connection)
            {
                var procedure = "vnsp_ReasonExists_getReasonExistsList";
                var data = cmd.Query(procedure, null, commandType: CommandType.StoredProcedure).ToList();
                return data;
            }
        }
    }
}
