using ConnectDb;
using Repository;

namespace Action
{
    public class PhaDoInputAction
    {
        public int Id { get; set; }
        public List<dynamic> ExecuteQuery(IDbConnect conn)
        {
            using (var cmd = new PhaDoByIdRepository())
            {
                cmd.Id = Id;
                return cmd.ExecuteQuery(conn);
            }
        }
    }
}
