using ConnectDb;
using Repository;

namespace Action
{
    public class BranchListAction
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
            using (var cmd = new BranchSearchRepository())
            {
                cmd.pageSize = pageSize;
                cmd.pageSkip = pageSkip;
                cmd.txtSearchVN = txtSearchVN;
                cmd.provinceID = provinceID;
                cmd.districtID = districtID;
                cmd.txtWardVN = txtWardVN;
                cmd.txtSearchEn = txtSearchEn;
                cmd.txtWardEn = txtWardEn;
                return cmd.ExecuteQuery(conn);
            }
        }
    }
}
