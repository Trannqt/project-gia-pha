window.onload = function () {
    OrgChart.templates.myTemplate = Object.assign({}, OrgChart.templates.ana);
    OrgChart.templates.myTemplate.size = [350, 130];
    OrgChart.templates.myTemplate.node =
        '<rect x="0" y="0" height="{h}" width="{w}" fill="#f4f3f3" stroke-width="4" stroke="#089844" rx="1" ry="1"></rect><circle cx="45" cy="60" r="35" fill="#fff"></circle>';
    OrgChart.templates.myTemplate.field_0 = '<text width="230" style="font-size: 20px;" fill="#777777" x="110" y="55" text-anchor="start">{val}</text>';
    OrgChart.templates.myTemplate.field_1 = '<text width="230" text-overflow="ellipsis" style="font-size: 16px;" fill="#777777" x="110" y="78" text-anchor="start">{val}</text>';
    OrgChart.templates.myTemplate.field_2 = '<text width="230" text-overflow="ellipsis" style="font-size: 12px;" fill="#777777" x="110" y="97" text-anchor="start">{val}</text>';
    OrgChart.templates.myTemplate.field_3 = '<text width="230" text-overflow="ellipsis" style="font-size: 12px;" font-weight="bold" fill="#777777" x="340" y="20" text-anchor="end">{val}</text>';
    OrgChart.templates.myTemplate.img_0 = '<clipPath id="{randId}"><circle cx="50" cy="60" r="35"></circle></clipPath><image preserveAspectRatio="xMidYMid slice" clip-path="url(#{randId})" xlink:href="{val}" x="10" y="20"  width="80" height="80"></image>';
    OrgChart.templates.myTemplate.plus = '<circle cx="15" cy="15" r="17" fill="#595959" stroke="#fff" stroke-width="1"></circle>'
        + '<line x1="-2" y1="15" x2="32" y2="15" stroke-width="1" stroke="#fff"></line>'
        + '<line x1="15" y1="-2" x2="15" y2="32" stroke-width="1" stroke="#fff"></line>';
    OrgChart.templates.myTemplate.minus = '<circle cx="15" cy="15" r="17" fill="#595959" stroke="#fff" stroke-width="1"></circle>'
        + '<line x1="-2" y1="15" x2="32" y2="15" stroke-width="1" stroke="#fff"></line>';
    OrgChart.templates.myTemplate.link = '<path stroke-linejoin="round" stroke="#aeaeae" stroke-width="1px" fill="none" d="{edge}" />';
    var chart = new OrgChart(document.getElementById("tree"), {
        template: "myTemplate",
        nodeBinding: {
            field_0: "name",
            field_1: "title",
            field_2: "email",
            field_3: "country",
            img_0: "img",
        },

    });
    Person.func.createControl(chart);
}
var Person = {
    params: {

    },
    func: {
        getIdFromUrl: function (url) {
            var tmp = url.split('/');
            var id = tmp[tmp.length - 1];
            return id;
        },
        createControl: function (chart) {
            var id = Person.func.getIdFromUrl(window.location.href);
            var commandAction = {
                Id: id
            };

            $.ajax({
                url: '/Person/BranchSource',
                type: 'post',
                data: {
                    commandAction: commandAction
                },
                success: function (result) {
                    console.log(result);
                    result[0].forEach(function (ele, inx) {
                        debugger
                        ele.img = `/upload/branchsource/${ele.img}`;
                        console.log(ele.pid);
                        
                        ele.tags == "partner" ? ["partner"] : "";
                        console.log("partner" +ele.tags);
                    });
                    chart.load(result[0]);
                }
            });
        },
        loadPhaDo: function () {
            
        },
    }
}
