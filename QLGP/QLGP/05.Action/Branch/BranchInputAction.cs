using ConnectDb;
using Repository;

namespace Action
{
    public class BranchInputAction
    {
        public int? Id { get; set; }
        public List<dynamic> ExecuteQuery(IDbConnect conn)
        {
            using (var cmd = new BranchGetByIdRepository())
            {
                cmd.Id = Id;
                return cmd.ExecuteQuery(conn);
            }
        }
    }
}
