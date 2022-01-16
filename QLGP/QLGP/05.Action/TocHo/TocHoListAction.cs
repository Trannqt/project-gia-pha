using ConnectDb;
using Repository;

namespace Action
{
    public class TocHoListAction
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
            using (var cmd = new TocHoSearchRepository())
            {
                cmd.pageSize = pageSize;
                cmd.pageSkip = pageSkip;
                cmd.txtSearch = txtSearch;
                cmd.txtProvince = txtProvince;
                cmd.txtDistrict = txtDistrict;
                cmd.txtWard = txtWard;
                cmd.txtSearchVN = txtSearchVN;
                cmd.txtProvinceVN = txtProvinceVN;
                cmd.txtDistrictVN = txtDistrictVN;
                cmd.txtWardVN = txtWardVN;
                return cmd.ExecuteQuery(conn);
            }
        }
    }
}
