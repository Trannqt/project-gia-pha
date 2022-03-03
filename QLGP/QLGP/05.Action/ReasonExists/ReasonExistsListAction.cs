using ConnectDb;
using Dapper;
using Domain;
using Repository;

namespace Action
{
    public class ReasonExistsListAction
    {
        public List<dynamic> ExecuteQuery(IDbConnect conn)
        {
            using (var cmd = new ReasonExistsSearchRepository())
            {
                return cmd.ExecuteQuery(conn);
            }
        }
    }
}
