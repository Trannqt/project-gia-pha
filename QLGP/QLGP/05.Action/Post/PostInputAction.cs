using Repository;
using ConnectDb;

namespace Action
{
    public class PostInputAction
    {
        public int? Id { get; set; }
        public List<dynamic> ExecuteQuery(IDbConnect conn)
        {
            using (var cmd = new PostGetByIdRepository())
            {
                cmd.Id = Id;
                return cmd.ExecuteQuery(conn);
            }
        }
    }
}
