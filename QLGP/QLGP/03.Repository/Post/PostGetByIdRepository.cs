using ConnectDb;
using Dapper;
using System.Data;

namespace Repository
{
    public class PostGetByIdRepository:  Query
    {
        public int? Id { get; set; }
        public List<dynamic> ExecuteQuery(IDbConnect conn)
        {
            using (var cmd = conn.Connection)
            {
                if (Id == null)
                    Id = 0;
                List<dynamic> list = new List<dynamic>();
                var procedure = "vnsp_Post_getPostById";
                
                var values = new { Id = Id };
                var data = cmd.Query(procedure, values, commandType: CommandType.StoredProcedure).ToList();
                return data;
            }
        }
    }
}
