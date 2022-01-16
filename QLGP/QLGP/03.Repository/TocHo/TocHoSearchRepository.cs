using ConnectDb;
using Dapper;
using Domain;
using System.Data;

namespace Repository
{
    public class TocHoSearchRepository: Query
    {
        public int pageSize { get; set; }
        public int pageSkip { get; set; }

        public string? txtSearch { get; set; }

        public string? txtProvince { get; set; }
        public string? txtDistrict { get; set; }
        public string? txtWard { get; set; }
        public string? txtSearchVN { get; set; }

        public string? txtProvinceVN { get; set; }
        public string? txtDistrictVN { get; set; }
        public string? txtWardVN { get; set; }
        public List<dynamic> ExecuteQuery(IDbConnect conn)
        {
            using (var cmd = conn.Connection)
            {
                var procedure = "vnsp_TocHo_getTocHoList";
                var values = new { 
                    pageSize = pageSize,
                    pageSkip = pageSkip,
                    txtSearch = txtSearch,
                    txtProvince = txtProvince,
                    txtDistrict = txtDistrict,
                    txtWard = txtWard,
                    txtSearchVN = txtSearchVN,
                    txtProvinceVN = txtProvinceVN,
                    txtDistrictVN = txtDistrictVN,
                    txtWardVN = txtWardVN,
                };
                var data = cmd.Query(procedure, values, commandType: CommandType.StoredProcedure).ToList();

                //var data = cmd.Query<TocHo>(sql).ToList<dynamic>();
                return data;
            }
        }
    }
}
