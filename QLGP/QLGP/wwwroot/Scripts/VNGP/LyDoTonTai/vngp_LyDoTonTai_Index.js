$(document).ready(function () {
    LyDoTonTai.func.init();
});
var LyDoTonTai = {
    params: {

    },
    func: {
        init: function () {
            $.ajax({
                url: "/LyDoTonTai/init",
                type: "post",
                success: function (result) {
                    console.log(result[0].Reason);
                    var url = result[0].LinkYoutube;
                    var img = `/upload/giapha/${result[0].ImageThumbnail}`;
                    $("#reason_description").html(result[0].Description);
                    $("#reason_reason").html(result[0].Reason);
                    $('#reason_linkyoutube').attr('src', url);
                    $('#reason_imagethumbnail').attr('src', img);
                    //$("#reason_linkyoutube").html(result[0].Description);
                }
            });
        }
    }
}
