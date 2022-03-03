using ConnectDb;
using Repository;

namespace Action
{
    public class BranchSourceInputAction
    {
        public int BranchId { get; set; }
        public int PersonId { get; set; }
        public int Level { get; set; }
        public int MaxLevel { get; set; }

        public List<dynamic> ExecuteQuery(IDbConnect conn)
        {
            using (var cmd = new BranchSourceByIdRepository())
            {
                cmd.BranchId = BranchId;
                cmd.PersonId = PersonId;
                cmd.Level = Level;
                cmd.MaxLevel = MaxLevel;
                return cmd.ExecuteQuery(conn);
            }
        }
    }
}
