using ConnectDb;
using Repository;

namespace Action
{
    public class TocHoInputAction
    {
        public int Id { get; set; }
        public List<dynamic> ExecuteQuery(IDbConnect conn)
        {
            using (var cmd = new TocHoGetByIdRepository())
            {
                cmd.Id = Id;
                return cmd.ExecuteQuery(conn);
            }
        }
    }
}
