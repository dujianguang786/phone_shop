$(function () {
    // 消费计算
    alert("请先点击花费额度输入框，会帮你自动计算")
    $("#change_money2").blur(function () {
        var $change_money1 = parseFloat($("#change_money1").val())
        var $change_money2 = parseFloat($("#change_money2").val())
        var $change_money3 = $change_money1 - $change_money2
        if ($change_money3 < 0) {
            alert("余额不足，请先充值")
            location.href = '/login_register/change_money'
        }
        $("#change_money3").val($change_money3)
    });

    $("#ajax_btn_11").click(function () {
        if ($("#change_money3").val() === "") {
            alert("请按提示付费，否则操作无效")
        } else {
            $.ajax({
                url: "/shopping_order/pay_money_2/",
                type: "post",
                dataType: "JSON",
                // 获取用户数据
                data: {
                    "change_money1": $("#change_money1").val(),
                    "change_money2": $("#change_money2").val(),
                    "change_money3": $("#change_money3").val(),
                    "csrfmiddlewaretoken": $("[name='csrfmiddlewaretoken']").val()
                },
                success: function (result) {
                    // $("#change_money3").text(result.change_money3)
                    var $timer = setTimeout(function () {
                        alert("付费成功");
                        location.href = '/shopping_order/all_order';
                    }, 2000)

                },
                error: function () {
                    alert("error")
                }

            });
        }

    });
})