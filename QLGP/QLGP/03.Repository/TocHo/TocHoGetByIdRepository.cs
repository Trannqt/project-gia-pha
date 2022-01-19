using ConnectDb;
using Dapper;
using Domain;
using System.Data;

namespace Repository
{
    public class TocHoGetByIdRepository:Query
    {
        public int? Id { get; set; }
        public List<dynamic> ExecuteQuery(IDbConnect conn)
        {
            using (var cmd = conn.Connection)
            {
                if (Id == null)
                    Id = 0;

                List<dynamic> list = new List<dynamic>();
                var procGiaPha = "vnsp_TocHo_getTocHoById";
                var procLeGio = "vnsp_TocHo_getNgayLeGioById";
                var procSoDoi = "vnsp_TocHo_getSoDoi";
                var procLapGiaDinh = "vnsp_TocHo_getSoLuongGiaDinh";
                var procSoLuongTV= "vnsp_TocHo_getSoLuongThanhVien";
                var procAdmin = "vnsp_ThanhVien_getAdminById";

                var values = new { Id = Id };
                var giaPha = cmd.Query(procGiaPha, values, commandType: CommandType.StoredProcedure).ToList();
                var leGio = cmd.Query(procLeGio, values, commandType: CommandType.StoredProcedure).ToList();
                var soDoi = cmd.Query(procSoDoi, values, commandType: CommandType.StoredProcedure).ToList();
                var lapGiaDinh = cmd.Query(procLapGiaDinh, values, commandType: CommandType.StoredProcedure).ToList();
                var soLuongTV = cmd.Query(procSoLuongTV, values, commandType: CommandType.StoredProcedure).ToList();
                var admin = cmd.Query(procAdmin, values, commandType: CommandType.StoredProcedure).ToList();

                List<dynamic> result = new List<dynamic>();
                result.Add(giaPha);
                result.Add(leGio);
                result.Add(soDoi);
                result.Add(lapGiaDinh);
                result.Add(soLuongTV);
                result.Add(admin);
                return result;
                ;
            }
        }
    }
}
