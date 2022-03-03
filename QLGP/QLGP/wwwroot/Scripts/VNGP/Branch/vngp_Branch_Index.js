$(document).ready(function () {
    

    var configs = {
        totalPages: 1,
        visiblePages: 1,
        startPage: 1,
    };
    $('#pagination').twbsPagination(configs);
    Branch.func.init(configs);
});
var Branch = {
    params: {
        totalPages: 50,
        visiblePages: 5,
        startPage: 1,
        pageSize: 6,
        currPage: 1,
        txtSearch: "",
        txtProvince: "",
        txtDistrict: "",
        txtWard: "",
    },
    func: {
        init: function (configs) {
            Branch.func.getProvinceList();

            var url = Branch.func.getUrl({
                    url: '/Branch/getListBranch',
                    param: {
                        pageSize: -1,
                        pageSkip: -1,
                        txtSearchVN: "",
                        provinceID: "",
                        districtID: "",
                        txtWardVN: "",
                        txtSearchEn: "",
                        txtWardEn: "",
                    }
                });
            Branch.func.beforeLoad(configs,url);

            $("#btnSearch").click(function () {
                Branch.params.txtSearch = $("#txtSearch").val();
                Branch.params.provinceID = $("#provinceID").val();
                Branch.params.districtID = $("#districtID").val();
                Branch.params.txtWard = $("#txtWard").val();

                var txtSearchEn = Branch.func.nonAccentVietnamese(Branch.params.txtSearch);
                var txtWardEn = Branch.func.nonAccentVietnamese(Branch.params.txtWard);

                var url = Branch.func.getUrl({
                    url: '/Branch/getListBranch',
                    param: {
                        pageSize: -1,
                        pageSkip: -1,
                        txtSearchVN: Branch.params.txtSearch,
                        provinceID: Branch.params.provinceID,
                        districtID: Branch.params.districtID,
                        txtWardVN: Branch.params.txtWard,
                        txtSearchEn: txtSearchEn,
                        txtWardEn: txtWardEn,
                    }
                });
                debugger
                Branch.func.beforeLoad(configs,url);
            });
        },
        getProvinceList: function () {
            console.log('hello');
            $('.province').select2();
            $.ajax({
                url: '/Branch/getProvinceList',
                success: function (result) {
                    $("#provinceID").html('');
                    $("#provinceID").append('<option value="">Tỉnh/Thành phố</option>');

                    debugger
                    $.each(result, function (key, value) {
                        $("#provinceID").append(`<option value=${value.ProvinceId}>${value.ProvinceName}</option>`);
                    });
                }
            });

            $('#provinceID').on('change', function (e) {
                //var optionSelected = $("option:selected", this);
                var valueSelected = this.value;
                Branch.func.getDistrictList(valueSelected);
            });
        },
        getDistrictList: function (provinceID) {
            $('.district').select2();
            $.ajax({
                url: '/Branch/getDistrictList',
                data: {
                    provinceID: provinceID
                },
                success: function (result) {
                    $("#districtID").html('');
                    $("#districtID").append('<option value="">Quận/Huyện</option>');
                    debugger
                    $.each(result, function (key, value) {
                        $("#districtID").append(`<option value=${value.DistrictId}>${value.DistrictName}</option>`);
                    });
                }
            });
        },
        getUrl: function (
            {
                url = "",
                param
            }
        ) {
            var pa = url.indexOf("?") == -1 ? "?" : "";
            return url + pa + "&commandAction.pageSize=" + param.pageSize + "&commandAction.pageSkip=" + param.pageSkip + "&commandAction.txtSearchVN=" + param.txtSearchVN + "&commandAction.provinceID=" + param.provinceID + "&commandAction.districtID=" + param.districtID + "&commandAction.txtWardVN=" + param.txtWardVN + "&commandAction.txtSearchEn=" + param.txtSearchEn + "&commandAction.txtWardEn=" + param.txtWardEn
        },
        beforeLoad: function (configs,url) {
            $.ajax({
                url: url,
                success: function (result) {
                    debugger
                    if (result.length) {
                        Branch.params.totalPages = result.length % Branch.params.pageSize == 0 ? parseInt(result.length / Branch.params.pageSize) : parseInt(result.length / Branch.params.pageSize) + 1;
                        Branch.params.startPage = 1;
                        Branch.func.pagination(configs);
                    }
                    else {
                        Branch.func.getListBranch(url);
                    }
                }
            });
        },
        pagination: function (configs) {
            $('#pagination').twbsPagination('destroy');

            $('#pagination').twbsPagination($.extend({}, configs, {
                totalPages: Branch.params.totalPages,
                visiblePages: Branch.params.visiblePages,
                startPage: Branch.params.startPage,
                first: '<<',
                last: '>>',
                next: '>',
                prev: '<',
                loop: false,
                initiateStartPageClick: true,
                onPageClick: function (event, page) {
                    Branch.params.currPage = page;
                    Branch.func.loadData(page);
                }
            }));
        },
        loadData: function (currPage) {
            var txtSearchEn = Branch.func.nonAccentVietnamese(Branch.params.txtSearch);
            var txtWardEn = Branch.func.nonAccentVietnamese(Branch.params.txtWard);

            var url = Branch.func.getUrl({
                url: '/Branch/getListBranch',
                param: {
                    pageSize: Branch.params.pageSize,
                    pageSkip: (currPage - 1) * Branch.params.pageSize,
                    txtSearchVN: Branch.params.txtSearch,
                    provinceID: Branch.params.provinceID,
                    districtID: Branch.params.districtID,
                    txtWardVN: Branch.params.txtWard,
                    txtSearchEn: txtSearchEn,
                    txtWardEn: txtWardEn,
                }
            });
            Branch.func.getListBranch(url);
        },
        getListBranch: function (url) {
            $.ajax({
                url: url,
                success: function (result) {
                    var content = '';
                    console.log(result);
                    debugger
                    if (result.length) {
                        debugger
                        for (var i = 0; i < result.length; i++) {
                            var add = "";
                            if (result[i].Address != '') add += result[i].Address + ",";
                            if (result[i].DistrictName != '') add += result[i].DistrictName + ",";
                            if (result[i].ProvinceName != '') add += result[i].ProvinceName;

                            content += `
                        <div class="col-lg-4 col-md-4 col-sm-6 col-6 m-b-30">
                            <div class ="list-bt"></div>
                            <div class ="list-lr"></div>
                            <div class ="list-it"></div>
                            <div class ="list-ib"></div>
                            <div class="latest__item product_list">
                                <img id="Branch_imagethumbnail" class="img-responsive" src="/upload/branch/${result[i].ImageThumbnail}" alt="VNGP" style="height:296px;"/>
                                <div class="overlay overlay--invisible overlay--p-15">
                                    <div class="overlay--border">
                                    </div>
                                </div>
                                <div class="latest__item--content">
                                    <div class="latest__item--inner">
                                        <h3>
                                            <a id="Branch_subdetail" class="onclick_Detail" href="/Branch/Detail/${result[i].RootBranchId}">Tộc ${result[i].Name} ở tại ${add}</a>
                                        </h3>
                                        <div class="cat-name">
                                            <em><a id="menu1_rpt_news_HyperLink2_0" class="onclick_Detail" href="/Branch/Detail/${result[i].RootBranchId}">Bấm để xem chi tiết</a></em>
                                        </div>
                                    </div>
                                </div>
                                <div class="blog-content text-center m-t-10">
                                    <h2 class="blog-title m-b-20">
                                        <a id="Branch_detail" class="onclick_Detail" href="/Branch/Detail/${result[i].Id}">Tộc ${result[i].Name} ở tại ${add}</a>
                                    </h2>
                                </div>
                            </div>
                        </div>
                    `
                        }
                        $("#Branch_listBranch").html(content);
                        $("#pagination").show();
                    }
                    else {
                        debugger
                        var html = `
                            <div class="row" style="margin:0 auto;">
                                <div class="col-md-12">
                                    <h1 class="title title-2 cl-gold title-bor">
                                        <span class ="title-heading">
                                            Không có kết quả
                                        </span>
                                    </h1>
                                </div>
                            </div>
                        `
                        $("#Branch_listBranch").html(html);
                        $("#pagination").hide();
                    }
                }
            });
        },
        nonAccentVietnamese: function (str) {
            str = str.toLowerCase();
            str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
            str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
            str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
            str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
            str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
            str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
            str = str.replace(/đ/g, "d");
            // Some system encode vietnamese combining accent as individual utf-8 characters
            str = str.replace(/\u0300|\u0301|\u0303|\u0309|\u0323/g, ""); // Huyền sắc hỏi ngã nặng 
            str = str.replace(/\u02C6|\u0306|\u031B/g, ""); // Â, Ê, Ă, Ơ, Ư
            return str;
        }
    }
}
