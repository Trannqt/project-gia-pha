using ConnectDb;
using Repository;

namespace Action
{
    public class PersonInputAction
    {
        public int Id { get; set; }
        public List<dynamic> ExecuteQuery(IDbConnect conn)
        {
            using (var cmd = new PersonGetByIdRepository())
            {
                cmd.Id = Id;
                return cmd.ExecuteQuery(conn);
            }
        }
    }
}
