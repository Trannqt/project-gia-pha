using ConnectDb;
using Repository;

namespace Action
{
    public class ProvinceListAction
    {
        public List<dynamic> ExecuteQuery(IDbConnect conn)
        {
            using (var cmd = new ProvinceListRepository())
            {
                return cmd.ExecuteQuery(conn);
            }
        }
    }
}
