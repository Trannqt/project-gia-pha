$(document).ready(function () {
    //TocHo.func.createControl();
    Post.func.getPostById();
});

var Post = {
    params: {

    },
    func: {
        createControl: function () {

        },
        getPostById: function () {
            var url = window.location.href;
            var tmp = url.split('/');
            var id = tmp[tmp.length - 1];
            var commandAction = {
                Id: id
            };
            $.ajax({
                url: "/Post/getPostDetailById",
                type: "post",
                data: {
                    commandAction: commandAction
                },
                success: function (result) {
                    if (result.length) {
                        debugger
                        $("#post_postTitle").text(result[0].Title);
                        $("#post_postDescription").html(result[0].Description);
                        var htmlFooter = `
                            <div class ="row">
                                <div class ="col-6">
                                    <span>
                                        <i class="fa fa-calendar-check-o" aria-hidden="true"></i> Ngày đăng : ${result[0].CreateDate}
                                    </span>
                                    <span>|</span>
                                    <span>
                                        <i class="fa fa-eye" aria-hidden="true"></i> Lượt xem : ${result[0].ViewCount}
                                    </span>
                                </div>
                                <div class ="col-6 text-right">
                                    <span>
                                        <i class="fa fa-share-alt-square" aria-hidden="true"></i> Chia sẻ :
                                    </span>
                                    <span>
                                        <a href="https://www.linkedin.com/sharing/share-offsite/?url=https://bietthuphap.com.vn/mau-thiet-ke-biet-thu-hien-dai-3-tang-tai-bac-giang---cdt-chi-kiem-tid-103" id="news1_instagram" class="i-share">
                                            <i class="fa fa-instagram" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                    <span>
                                        <a class ="p-share" href="https://www.pinterest.com/pin/create/button/" data-pin-do="buttonBookmark" data-pin-custom="true">
                                            <i class="fa fa-pinterest-p" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                    <span>
                                        <a href="https://twitter.com/intent/tweet?url=https://bietthuphap.com.vn/mau-thiet-ke-biet-thu-hien-dai-3-tang-tai-bac-giang---cdt-chi-kiem-tid-103" id="news1_twitter" class="tw-share">
                                            <i class="fa fa-twitter" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                    <span>
                                        <a href="https://www.facebook.com/sharer/sharer.php?u=https://bietthuphap.com.vn/mau-thiet-ke-biet-thu-hien-dai-3-tang-tai-bac-giang---cdt-chi-kiem-tid-103" id="news1_facebook" class="f-share">
                                            <i class="fa fa-facebook" aria-hidden="true"></i>
                                        </a>
                                    </span>
                                </div>
                            </div>
                        `;
                        $("#post_postFooter").html(htmlFooter);
                    }
                }
            });
        }
    }
}
