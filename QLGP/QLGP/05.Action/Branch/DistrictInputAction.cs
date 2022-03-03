using ConnectDb;
using Repository;

namespace Action
{
    public class DistrictInputAction
    {
        public int provinceID { get; set; } 
        public List<dynamic> ExecuteQuery(IDbConnect conn)
        {
            using (var cmd = new DistrictListByIdRepository())
            {
                cmd.provinceID = provinceID;
                return cmd.ExecuteQuery(conn);
            }
        }
    }
}
