$(function () {
    // 删除未支付订单内容
    $("#delete").click(function () {
        var $check_1 = $('input.check_1:checked')
        if ($check_1.length === 0) {
            alert("警告：您还没有选择要删除的的商品订单，🙏请先选择再进行操作1!!")
        } else {
            var $id_list = [];
            var $get_id = $check_1.parent().nextAll(".span");
            for (var i=0; i<$get_id.length; i++) {
                $id_list.push($get_id[i].textContent)
            }
            $.ajax({
                url: "/shopping_order/not_pay_order/",
                type: "post",
                dataType: "JSON",
                // 获取用户数据
                data: {
                    "id_list": JSON.stringify($id_list),
                    // "cart_id": $("#id_1").text(),
                    // "colorid": $("#img11").attr("src"),
                    // "capacityid": $("#capacityid").text(),
                    // "buy_count": $("#buy_count").val(),
                    "csrfmiddlewaretoken": $("[name='csrfmiddlewaretoken']").val()
                },
                success: function (result) {
                    if (result.ret === 0) {
                        alert("删除成功")
                        location.href = "/shopping_order/not_pay_order"
                    }
                },
                error: function () {
                    alert("error")
                }

            });

        }

    })
    // alert("error")
})