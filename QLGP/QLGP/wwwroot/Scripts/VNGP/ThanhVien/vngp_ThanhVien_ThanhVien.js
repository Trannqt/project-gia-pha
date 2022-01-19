$(document).ready(function () {
    ThanhVien1.func.createControl();
    ThanhVien1.func.loadPhaDo();
});

var ThanhVien1 = {
    params: {

    },
    func: {
        getIdFromUrl: function (url) {
            var tmp = url.split('/');
            var id = tmp[tmp.length - 1];
            return id;
        },
        createControl: function () {
            var chart = new OrgChart(document.getElementById("tree"), {
                nodeBinding: {
                    field_0: "name",
                    field_1: "img",
                },
            });
            chart.on('init', function (sender) {
                setTimeout(function () {
                    document.querySelector('.loader').style.display = 'none';
                }, 200);
            });


            var id = ThanhVien1.func.getIdFromUrl(window.location.href);
            var commandAction = {
                Id: id
            };

            $.ajax({
                url: '/ThanhVien/phaDo',
                type: 'post',
                data: {
                    commandAction: commandAction
                },
                success: function (result) {
                    chart.load(result[0]);
                }
            });
        },
        loadPhaDo: function () {
            
        },
    }
}
