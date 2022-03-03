using ConnectDb;
using Dapper;
using Domain;
using System.Data;

namespace Repository
{
    public class BranchGetByIdRepository:Query
    {
        public int? Id { get; set; }
        public List<dynamic> ExecuteQuery(IDbConnect conn)
        {
            using (var cmd = conn.Connection)
            {
                if (Id == null)
                    Id = 0;

                List<dynamic> list = new List<dynamic>();
                var procGiaPha = "vnsp_Branch_getBranchById";
                var procBranchDetail = "vnsp_Branch_LoadBranchDetail";
                //var procSoDoi = "vnsp_Branch_getSoDoi";
                //var procLapGiaDinh = "vnsp_Branch_getSoLuongGiaDinh";
                //var procSoLuongTV= "vnsp_Branch_getSoLuongThanhVien";
                //var procAdmin = "vnsp_Person_getAdminById";

                var values = new { Id = Id };
                var valuesDetail = new { BranchId = Id };
                var giaPha = cmd.Query(procGiaPha, values, commandType: CommandType.StoredProcedure).ToList();
                var branchDetail = cmd.Query(procBranchDetail, valuesDetail, commandType: CommandType.StoredProcedure).ToList();
                //var soDoi = cmd.Query(procSoDoi, values, commandType: CommandType.StoredProcedure).ToList();
                //var lapGiaDinh = cmd.Query(procLapGiaDinh, values, commandType: CommandType.StoredProcedure).ToList();
                //var soLuongTV = cmd.Query(procSoLuongTV, values, commandType: CommandType.StoredProcedure).ToList();
                //var admin = cmd.Query(procAdmin, values, commandType: CommandType.StoredProcedure).ToList();

                List<dynamic> result = new List<dynamic>();
                result.Add(giaPha);
                result.Add(branchDetail);
                //result.Add(soDoi);
                //result.Add(lapGiaDinh);
                //result.Add(soLuongTV);
                //result.Add(admin);
                return result;
                ;
            }
        }
    }
}
