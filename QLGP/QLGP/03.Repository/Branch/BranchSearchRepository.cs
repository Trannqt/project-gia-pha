using ConnectDb;
using Dapper;
using Domain;
using System.Data;

namespace Repository
{
    public class BranchSearchRepository: Query
    {
        public long pageSize { get; set; }
        public long pageSkip { get; set; }

        public string? txtSearchVN { get; set; }

        public long provinceID { get; set; }
        public long districtID { get; set; }
        public string? txtWardVN { get; set; }

        public string? txtSearchEn { get; set; }

        public string? txtWardEn { get; set; }
        public List<dynamic> ExecuteQuery(IDbConnect conn)
        {
            using (var cmd = conn.Connection)
            {
                var procedure = "vnsp_Branch_getBranchList";
                var values = new { 
                    pageSize = pageSize,
                    pageSkip = pageSkip,
                    txtSearchVN = txtSearchVN,
                    provinceID = provinceID,
                    districtID = districtID,
                    txtWardVN = txtWardVN,
                    txtSearchEn = txtSearchEn,
                    txtWardEn = txtWardEn,
                };
                var data = cmd.Query(procedure, values, commandType: CommandType.StoredProcedure).ToList();

                //var data = cmd.Query<TocHo>(sql).ToList<dynamic>();
                return data;
            }
        }
    }
}
