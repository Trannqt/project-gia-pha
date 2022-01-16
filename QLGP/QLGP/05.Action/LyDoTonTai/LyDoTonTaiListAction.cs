using ConnectDb;
using Dapper;
using Domain;
using Repository;

namespace Action
{
    public class LyDoTonTaiListAction
    {
        public List<dynamic> ExecuteQuery(IDbConnect conn)
        {
            using (var cmd = new LyDoTonTaiSearchRepository())
            {
                return cmd.ExecuteQuery(conn);
            }
        }
    }
}
