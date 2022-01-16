using ConnectDb;
using Domain;
using Dapper;
using System.Data;

namespace Repository
{
    public class LyDoTonTaiSearchRepository: Query
    {
        public List<dynamic> ExecuteQuery(IDbConnect conn)
        {
            using (var cmd = conn.Connection)
            {
                var procedure = "vnsp_LyDoTonTai_getLyDoTonTaiList";
                //var values = new { Beginning_Date = "2017.1.1", Ending_Date = "2017.12.31" };
                var data = cmd.Query(procedure, null, commandType: CommandType.StoredProcedure).ToList();
                //var data = cmd.Query<LyDoTonTai>("Select * from LyDoTonTai").ToList<dynamic>();
                return data;
            }
        }
    }
}
