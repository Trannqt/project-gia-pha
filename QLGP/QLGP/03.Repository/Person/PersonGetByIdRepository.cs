using ConnectDb;
using Dapper;
using System.Data;

namespace Repository
{
    public class PersonGetByIdRepository: Query
    {
        public int Id { get; set; }
        public List<dynamic> ExecuteQuery(IDbConnect conn)
        {
            using (var cmd = conn.Connection)
            {
                List<dynamic> list = new List<dynamic>();
                var procThanhVien = "vnsp_Person_getPersonById";
                var procVo = "vnsp_Person_getWifeById";
                var procCon = "vnsp_Person_getChildrenById";
                
                var values = new { Id = Id };
                var result1 = cmd.Query(procThanhVien, values, commandType: CommandType.StoredProcedure).ToList();
                var result2 = cmd.Query(procVo, values, commandType: CommandType.StoredProcedure).ToList();
                var result3 = cmd.Query(procCon, values, commandType: CommandType.StoredProcedure).ToList();
                
                list.Add(result1);
                list.Add(result2);
                list.Add(result3);
                return list;
            }
        }
    }
}
