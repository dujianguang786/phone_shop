$(function () {
    $("#create_order1").click(function () {
        var $check_1 = $('div div input.check_1:checked')
        if ($check_1.length === 0 || $("#pay_money").val() === 0) {
            alert("警告：您还没有选择要结算的商品订单或还没有结算，🙏请先选择再进行操作1!!")
        } else {
            if (confirm("你好，确定支付吗？") === true) {
                alert("确定支付")
                var $id_list = [];
                var $get_id = $check_1.parent().next();
                for (let i = 0; i < $get_id.length; i++) {
                    $id_list.push($get_id[i].textContent)
                }
                var $price_list = [];
                var $get_price = $check_1.parent().nextAll("#price").find("span");
                for (let i = 0; i < $get_price.length; i++) {
                    $price_list.push($get_price[i].textContent)
                }
                var $num_list = [];
                var $get_num = $check_1.parent().nextAll("#id123").find("span");
                for (let i = 0; i < $get_num.length; i++) {
                    $num_list.push($get_num[i].textContent)
                }
                $.ajax({
                    url: "/shopping_cart/create_order/",
                    type: "post",
                    dataType: "JSON",
                    // 获取用户数据
                    data: {
                        // 被选取商品的id
                        "id_list": JSON.stringify($id_list),
                        // 被选取单个商品不同数量对应的总价
                        "price_list": JSON.stringify($price_list),
                        // 被选取单个商品对应不同数量
                        "num_list": JSON.stringify($num_list),
                        // 被选取商品下单的支付方式
                        "pay_static": $("#select_1 option:selected").val(),
                        // 被选取商品总价
                        "money_sum": $("#pay_money").val(),
                        "csrfmiddlewaretoken": $("[name='csrfmiddlewaretoken']").val()
                    },
                    success: function (result) {
                        // alert("hello")
                        location.href = "/shopping_cart/order_pay_1"
                    },
                    error: function () {
                        alert("error")
                    }

                });
            } else {
                alert("稍后下单")
                location.href = ""
            }
        }
    })
    // alert("error")
})
//
// $(function () {
//     $("#affirm_order").click(function () {
//         if ($('div div input.check_1:checked').length === 0) {
//             alert("警告：您还没有选择要结算的的商品，🙏请先选择再进行操作1!!")
//         } else {
//             var $id_list = [];
//             var $get_id = $('div div input.check_1:checked').parent().next();
//             for (var i=0; i<$get_id.length; i++) {
//                 $id_list.push($get_id[i].textContent)
//             }
//             var $num_list = [];
//             var $get_num = $('div div input.check_1:checked').parent().nextAll("#id123").find("span");
//             for (var i=0; i<$get_num.length; i++) {
//                 $num_list.push($get_num[i].textContent)
//             }
//             var $price_list = [];
//             var $get_price = $('div div input.check_1:checked').parent().nextAll("#price").find("span");
//             for (var i=0; i<$get_price.length; i++) {
//                 $price_list.push($get_price[i].textContent)
//             }
//
//             $.ajax({
//                 url: "/shopping_cart/create_order/",
//                 type: "post",
//                 dataType: "JSON",
//                 // 获取用户数据
//                 data: {
//                     "dict": JSON.stringify({"id_list": $id_list, "num_list": $num_list, "price_list": $price_list}),
//                     // "num_list": JSON.stringify($num_list),
//                     // price_list: JSON.stringify($price_list),
//                     "csrfmiddlewaretoken": $("[name='csrfmiddlewaretoken']").val()
//                 },
//                 success: function (result) {
//                     if (confirm("请选择：点击确认跳转到订单界面，🙏点击取消：继续结算剩余部分！!!")) {
//                         location.href = "/shopping_order/order_show"
//                     } else {
//                         location.href = ''
//                     }
//
//
//                 },
//                 error: function () {
//                     alert("error")
//                 }
//             });
//         }
//
//
//     });
// })
