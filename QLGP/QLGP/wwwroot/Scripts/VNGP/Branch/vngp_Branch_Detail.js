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
                success: function (data) {
                    if (data.length) {
                        var branchDetail = data[1];
                        var result = data[0];

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
                        `;
                        /*
                         <div class="title-name title-4">
                                <h3 class="cl-gold">
                                    UỐNG NƯỚC NHỚ NGUỒN
                                </h3>
                                <h4 class="cl-gold">Địa chỉ: ${result[0].Address}</h4>
                            </div>
                         */
                        $("#resultGiaPha").html(htmlGiaPha);
                        var length = branchDetail.length;
                        var htmlBranchDetail = "";
   
                        for (var i = 0; i < length; i++) {
                            var strMotherName = "", strPartner = "";
                            if (branchDetail[i].MotherName != "")
                                strMotherName = " - (" + branchDetail[i].MotherName + ")";
                         
                            if (branchDetail[i].Partner != "")
                                strPartner = " - (" + "<a href=\"javascript:;\" onclick=\"Person.func.createChart(" + branchDetail[i].PartnerBranchId + "," + branchDetail[i].PartnerPersonId + "," + branchDetail[i].PartnerLevel + "," + branchDetail[i].PartnerMaxLevel + ")\">" + branchDetail[i].Partner + ")";
                            
                            htmlBranchDetail += `
                                <tr>
                                    <td>${branchDetail[i].STT}</td>
                                    <td>${branchDetail[i].Level}</td>
                                    <td><a href="javascript:;" onclick="Person.func.createChart(${branchDetail[i].RootBranchId},${branchDetail[i].RootPersonId},${branchDetail[i].Level},${branchDetail[length - 1].maxLevel})">${branchDetail[i].Name}</a> ${strPartner}</td>
                                    <td>${branchDetail[i].FatherName} ${strMotherName}</td>
                                    <td>${branchDetail[i].Sex}</td>
                                    <td>${branchDetail[i].DateOfBirth}</td>
                                    <td>${branchDetail[i].Phone}</td>
                                    <td>${branchDetail[i].Address}</td>
                                    <td>${branchDetail[i].Death}</td>
                                </tr>
                            `;
                        }
                        $("#tblBranchDetail").html(htmlBranchDetail);
                    }
                    else { 
                        $("#headerBranch").html('');
                    }
                }
            });
        }
    }
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
        createChart: function (branchId,personId, level, maxlevel) {
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
            Person.func.createControl(chart, branchId, personId,level, maxlevel);
        },
        createControl: function (chart, branchId, personId, level, maxlevel) {
            var id = Person.func.getIdFromUrl(window.location.href);

            var commandAction = {
                BranchId: branchId,
                PersonId: personId,
                Level: level,
                MaxLevel: maxlevel
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
                        //ele.pid = 1;
                        // console.log(ele.pid);
                        //console.log(ele.tags);
                        //ele.tags == "1" ? ["partner"] : "";
                    });
                    chart.load(result[0]);
                }
            });
        },
        loadPhaDo: function () {

        },
    }
}