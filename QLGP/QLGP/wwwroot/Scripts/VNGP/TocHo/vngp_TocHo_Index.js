$(document).ready(function () {
    var configs = {
        totalPages: 1,
        visiblePages: 1,
        startPage: 1,
    };
    $('#pagination').twbsPagination(configs);
    TocHo.func.init(configs);
});
var TocHo = {
    params: {
        totalPages: 50,
        visiblePages: 5,
        startPage: 1,
        pageSize: 3,
        currPage: 1,
        txtSearch: "",
        txtProvince: "",
        txtDistrict: "",
        txtWard: "",
    },
    func: {
        init: function (configs) {
            
            var url = TocHo.func.getUrl({
                    url: '/TocHo/getListTocHo',
                    param: {
                        pageSize: -1,
                        pageSkip: -1,
                        txtSearch: "",
                        txtProvince: "",
                        txtDistrict: "",
                        txtWard: "",
                        txtSearchVN: "",
                        txtProvinceVN: "",
                        txtDistrictVN: "",
                        txtWardVN: "",
                    }
                });
            TocHo.func.beforeLoad(configs,url);

            $("#btnSearch").click(function () {
                TocHo.params.txtSearch = $("#txtSearch").val();
                TocHo.params.txtProvince = $("#txtProvince").val();
                TocHo.params.txtDistrict = $("#txtDistrict").val();
                TocHo.params.txtWard = $("#txtWard").val();

                var txtSearchVN = TocHo.func.nonAccentVietnamese(TocHo.params.txtSearch);
                var txtProvinceVN = TocHo.func.nonAccentVietnamese(TocHo.params.txtProvince);
                var txtDistrictVN = TocHo.func.nonAccentVietnamese(TocHo.params.txtDistrict);
                var txtWardVN = TocHo.func.nonAccentVietnamese(TocHo.params.txtWard);

                var url = TocHo.func.getUrl({
                    url: '/TocHo/getListTocHo',
                    param: {
                        pageSize: -1,
                        pageSkip: -1,
                        txtSearch: TocHo.params.txtSearch,
                        txtProvince: TocHo.params.txtProvince,
                        txtDistrict: TocHo.params.txtDistrict,
                        txtWard: TocHo.params.txtWard,
                        txtSearchVN: txtSearchVN,
                        txtProvinceVN: txtProvinceVN,
                        txtDistrictVN: txtDistrictVN,
                        txtWardVN: txtWardVN,
                    }
                });
                TocHo.func.beforeLoad(configs,url);
            });
        },
        getUrl: function (
            {
                url = "",
                param
            }
        ) {
            var pa = url.indexOf("?") == -1 ? "?" : "";
            return url + pa + "&commandAction.pageSize=" + param.pageSize + "&commandAction.pageSkip=" + param.pageSkip + "&commandAction.txtSearch=" + param.txtSearch + "&commandAction.txtProvince=" + param.txtProvince + "&commandAction.txtDistrict=" + param.txtDistrict + "&commandAction.txtWard=" + param.txtWard + "&commandAction.txtSearchVN=" + param.txtSearchVN + "&commandAction.txtProvinceVN=" + param.txtProvinceVN + "&commandAction.txtDistrictVN=" + param.txtDistrictVN + "&commandAction.txtWardVN=" + param.txtWardVN
        },
        beforeLoad: function (configs,url) {
            $.ajax({
                url: url,
                success: function (result) {
                    debugger
                    if (result.length) {
                        TocHo.params.totalPages = result.length % TocHo.params.pageSize == 0 ? parseInt(result.length / TocHo.params.pageSize) : parseInt(result.length / TocHo.params.pageSize) + 1;
                        TocHo.params.startPage = 1;
                        TocHo.func.pagination(configs);
                    }
                    else {
                        TocHo.func.getListTocHo(url);
                    }
                }
            });
        },
        pagination: function (configs) {
            $('#pagination').twbsPagination('destroy');

            $('#pagination').twbsPagination($.extend({}, configs, {
                totalPages: TocHo.params.totalPages,
                visiblePages: TocHo.params.visiblePages,
                startPage: TocHo.params.startPage,
                first: '<<',
                last: '>>',
                next: '>',
                prev: '<',
                loop: false,
                initiateStartPageClick: true,
                onPageClick: function (event, page) {
                    TocHo.params.currPage = page;
                    TocHo.func.loadData(page);
                }
            }));
        },
        loadData: function (currPage) {
            var txtSearchVN = TocHo.func.nonAccentVietnamese(TocHo.params.txtSearch);
            var txtProvinceVN = TocHo.func.nonAccentVietnamese(TocHo.params.txtProvince);
            var txtDistrictVN = TocHo.func.nonAccentVietnamese(TocHo.params.txtDistrict);
            var txtWardVN = TocHo.func.nonAccentVietnamese(TocHo.params.txtWard);

            var url = TocHo.func.getUrl({
                url: '/TocHo/getListTocHo',
                param: {
                    pageSize: TocHo.params.pageSize,
                    pageSkip: (currPage - 1) * TocHo.params.pageSize,
                    txtSearch: TocHo.params.txtSearch,
                    txtProvince: TocHo.params.txtProvince,
                    txtDistrict: TocHo.params.txtDistrict,
                    txtWard: TocHo.params.txtWard,
                    txtSearchVN: txtSearchVN,
                    txtProvinceVN: txtProvinceVN,
                    txtDistrictVN: txtDistrictVN,
                    txtWardVN: txtWardVN,
                }
            });
            TocHo.func.getListTocHo(url);
        },
        getListTocHo: function (url) {
            $.ajax({
                url: url,
                success: function (result) {
                    var content = '';
                    console.log(result);
                    debugger
                    if (result.length) {
                        debugger
                        for (var i = 0; i < result.length; i++) {
                            content += `
                        <div class="col-lg-4 col-md-4 col-sm-6 col-6 m-b-30">
                            <div class ="list-bt"></div>
                            <div class ="list-lr"></div>
                            <div class ="list-it"></div>
                            <div class ="list-ib"></div>
                            <div class="latest__item product_list">
                                <img id="tocho_imagethumbnail" class="img-responsive" src="/upload/product/thumb/1-10-2021/${result[i].ImageThumbnail}" alt="VNGP" />
                                <div class="overlay overlay--invisible overlay--p-15">
                                    <div class="overlay--border">
                                    </div>
                                </div>
                                <div class="latest__item--content">
                                    <div class="latest__item--inner">
                                        <h3>
                                            <a id="tocho_subdetail" class="onclick_Detail" href="/TocHo/Detail/${result[i].Id}">Tộc ${result[i].Name} ở tại ${result[i].Address}, ngày cập nhật cuối cùng ${result[i].LastUpdate}</a>
                                        </h3>
                                        <div class="cat-name">
                                            <em><a id="menu1_rpt_news_HyperLink2_0" class="onclick_Detail" href="/TocHo/Detail/${result[i].Id}">Bấm để xem chi tiết</a></em>
                                        </div>
                                    </div>
                                </div>
                                <div class="blog-content text-center m-t-10">
                                    <h2 class="blog-title m-b-20">
                                        <a id="tocho_detail" class="onclick_Detail" href="/TocHo/Detail/${result[i].Id}">Tộc ${result[i].Name} ở tại ${result[i].Address}, ngày cập nhật cuối cùng ${result[i].LastUpdate}</a>
                                    </h2>
                                </div>
                            </div>
                        </div>
                    `
                        }
                        $("#tocho_listtocho").html(content);
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
                        $("#tocho_listtocho").html(html);
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
