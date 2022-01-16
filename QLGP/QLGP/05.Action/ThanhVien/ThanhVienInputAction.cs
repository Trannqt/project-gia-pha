using ConnectDb;
using Repository;

namespace Action
{
    public class ThanhVienInputAction
    {
        public int Id { get; set; }
        public List<dynamic> ExecuteQuery(IDbConnect conn)
        {
            using (var cmd = new ThanhVienGetByIdRepository())
            {
                cmd.Id = Id;
                return cmd.ExecuteQuery(conn);
            }
        }
    }
}
