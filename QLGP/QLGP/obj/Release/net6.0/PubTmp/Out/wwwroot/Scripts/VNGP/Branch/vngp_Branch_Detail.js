$(document).ready(function () {
    //Branch.func.createControl();
    Branch.func.getBranchById();
});

var Branch = {
    params: {

    },
    func: {
        createControl: function () {
            
        },
        getBranchById: function () {
            var url = window.location.href;
            var tmp = url.split('/');
            var id = tmp[tmp.length - 1];
            var commandAction = {
                Id: id
            };
            $.ajax({
                url: "/Branch/getBranchDetailById",
                type: "post",
                data: {
                    commandAction: commandAction
                },
                success: function (result) {
                    if (result.length) {
                        debugger
                        var add = "";
                        if (result[0].Address != '') add += result[0].Address + ",";
                        if (result[0].DistrictName != '') add += result[0].DistrictName + ",";
                        if (result[0].ProvinceName != '') add += result[0].ProvinceName;

                        var htmlGiaPha = `
                            <div class="col-md-12">
                                <h1 class="title title-2 cl-gold title-bor">
                                    <p style="font-size:65%;">Gia Phả</p>
                                    <span class="title-heading">
                                        Tộc ${result[0].Name} - ${add}
                                    </span>
                                    <span class="bot-title">
                                    </span>
                                </h1>
                            </div>
                            <div class="title-name title-4">
                                <h3 class="cl-gold">
                                    UỐNG NƯỚC NHỚ NGUỒN
                                </h3>
                                <h4 class="cl-gold">Địa chỉ: ${result[0].Address}</h4>
                            </div>
                        `;
                        $("#resultGiaPha").html(htmlGiaPha);
                        
                        //var htmlNLG = "";
                        //for (var i = 0; i < leGio.length; i++) {
                        //    htmlNLG += `
                        //        <tr>
                        //            <th scope="row">${leGio[i].Name}</th>
                        //            <td>${leGio[i].DateTime}</td>
                        //        </tr>
                        //    `;
                        //}
                        //$("#tblNgayLeGio").html(htmlNLG);
                        

                        //var htmlTongQuan = `
                        //    <tr>
                        //        <th scope="row">Số đời từ thuỷ tổ tới con cháu</th>
                        //        <td>${soDoi[0].SoDoi}</td>
                        //    </tr>
                        //    <tr>
                        //        <th scope="row">Số lượng gia đình</th>
                        //        <td>${lapGiaDinh[0].SoLuongGiaDinh}</td>
                        //    </tr>
                        //    <tr>
                        //        <th scope="row">Số người</th>
                        //        <td>${soLuongThanhVien[0].SoLuongThanhVien}</td>
                        //    </tr>
                        //`;
                        //$("#resultTongQuan").html(htmlTongQuan);
                        //debugger
                        //var htmlAdmin = `
                        //    <tr>
                        //        <th scope="row">Người làm</th>
                        //        <td>${Admin[0].GioiTinh} ${Admin[0].HoTen}</td>
                        //    </tr>
                        //    <tr>
                        //        <th scope="row">Địa chỉ</th>
                        //        <td>${Admin[0].DiaChi}</td>
                        //    </tr>
                        //    <tr>
                        //        <th scope="row">Điện thoại</th>
                        //        <td>${Admin[0].DienThoai}</td>
                        //    </tr>
                        //`;
                        //$("#resultAdmin").html(htmlAdmin);
                    }
                    else { 
                        $("#headerBranch").html('');
                    }
                }
            });
        }
    }
}
