using ConnectDb;
using Dapper;
using System.Data;

namespace Repository
{
    public class BranchSourceByIdRepository: Query
    {
        public int BranchId { get; set; }
        public int PersonId { get; set; }
        public int Level { get; set; }
        public int MaxLevel { get; set; }
        public List<dynamic> ExecuteQuery(IDbConnect conn)
        {
            using (var cmd = conn.Connection)
            {
                List<dynamic> list = new List<dynamic>();
                var pro = "vnsp_Person_getBranchSourceById";
                var values = new { BranchId = BranchId, PersonId = PersonId, Level = Level, MaxLevel = MaxLevel };
                var result1 = cmd.Query(pro, values, commandType: CommandType.StoredProcedure).ToList();

                list.Add(result1);
                return list;
            }
        }
    }
}
