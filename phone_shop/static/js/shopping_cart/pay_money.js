$(function () {
    $("#create_order1").click(function () {
        var $check_1 = $('div div input.check_1:checked')
        if ($check_1.length === 0) {
            alert("警告：您还没有选择要结算的商品订单，🙏请先选择再进行操作1!!")
        } else {
            var $id_list = [];
            var $get_id = $check_1.parent().next();
            for (var i=0; i<$get_id.length; i++) {
                $id_list.push($get_id[i].textContent)
            }
            $.ajax({
                // url: "/shopping_order/create_order/",
                type: "post",
                dataType: "JSON",
                // 获取用户数据
                data: {
                    "id_list": JSON.stringify($id_list),
                    "pay_static": $("#select_1 option:selected").val(),
                    "money_sum": $("#pay_money").val(),

                    "csrfmiddlewaretoken": $("[name='csrfmiddlewaretoken']").val()
                },
                success: function (result) {

                    location.href = "/shopping_order/order_pay1"
                },
                error: function () {
                    alert("error")
                }

            });

        }

    })
    // alert("error")
})