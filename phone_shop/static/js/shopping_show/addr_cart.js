$(function () {
    $("#btn_ajax").click(function () {
        $.ajax({
            url: "/shopping_show/addr_cart/",
            type: "post",
            dataType: "JSON",
            // 获取用户数据
            data: {
                "goodsid": $("#goodsid").text(),
                "colorid": $("#img11").attr("src"),
                // "capacityid": $("#capacityid").text(),
                "buy_count": $("#buy_count").val(),
                "csrfmiddlewaretoken": $("[name='csrfmiddlewaretoken']").val()
            },
            success: function (result) {
                if (result.ret === 0) {
                    alert("添加成功")
                }
            },
            error: function () {
                alert("error")
            }

        });
    });
})