using ConnectDb;
using Dapper;
using System.Data;

namespace Repository
{
    public class PostSearchRepository: Query
    {
        public long pageSize { get; set; }
        public long pageSkip { get; set; }

        public string? txtSearchVN { get; set; }

        public string? txtSearchEn { get; set; }

        public List<dynamic> ExecuteQuery(IDbConnect conn)
        {
            using (var cmd = conn.Connection)
            {
                var procedure = "vnsp_Post_getPostList";
                var values = new
                {
                    pageSize = pageSize,
                    pageSkip = pageSkip,
                    txtSearchVN = txtSearchVN,
                    txtSearchEn = txtSearchEn,
                };
                var data = cmd.Query(procedure, values, commandType: CommandType.StoredProcedure).ToList();
                return data;
            }
        }
    }
}
