using ConnectDb;
using Repository;

namespace Action
{
    public class PostListAction
    {
        public long pageSize { get; set; }
        public long pageSkip { get; set; }

        public string? txtSearchVN { get; set; }

        public string? txtSearchEn { get; set; }

        public List<dynamic> ExecuteQuery(IDbConnect conn)
        {
            using (var cmd = new PostSearchRepository())
            {
                cmd.pageSize = pageSize;
                cmd.pageSkip = pageSkip;
                cmd.txtSearchVN = txtSearchVN;
                cmd.txtSearchEn = txtSearchEn;
                return cmd.ExecuteQuery(conn);
            }
        }
    }
}
