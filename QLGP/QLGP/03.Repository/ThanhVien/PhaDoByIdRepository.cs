using ConnectDb;
using Dapper;
using System.Data;

namespace Repository
{
    public class PhaDoByIdRepository: Query
    {
        public int Id { get; set; }
        public List<dynamic> ExecuteQuery(IDbConnect conn)
        {
            using (var cmd = conn.Connection)
            {
                List<dynamic> list = new List<dynamic>();
                var pro = "vnsp_ThanhVien_getPhaDoById";
                var values = new { Id = Id };
                var result1 = cmd.Query(pro, values, commandType: CommandType.StoredProcedure).ToList();

                list.Add(result1);
                return list;
            }
        }
    }
}
