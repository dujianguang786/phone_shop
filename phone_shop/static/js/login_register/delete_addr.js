$(function () {
    $("#delete").click(function () {

        var $id_list = [];
        var $get_id = $('tr.aa input:checked').parent().nextAll(".c1");
        for (var i=0; i<$get_id.length; i++) {
            $id_list.push($get_id[i].textContent)
        }
        // alert($id_list)

        $.ajax({
            url: "/login_register/delete_addr/",
            type: "post",
            dataType: "JSON",
            // 获取用户数据
            data: {
                "id_list": JSON.stringify($id_list),
                // "hello": parseInt($('tr.aa input:checked').parent().nextAll(".c1").text()),
                "csrfmiddlewaretoken": $("[name='csrfmiddlewaretoken']").val()
            },
            success: function (result) {
                if (result.res === 0) {
                    location.href = "/login_register/addr_show";
                }

            },
            error: function () {
                alert("error")
            }
        });
    });
})