$(function () {
    // 清除
    $("#change_money2").focus(function () {
        var $clear_value = $(this).val()
        $clear_value = ""
        $("#change_money2").val($clear_value)
    });
    $("#change_money3").focus(function () {
        var $clear_value = $(this).val()
        $clear_value = ""
        $("#change_money3").val($clear_value)
    });
    // 充值计算
    $("#change_money2").blur(function () {
        var $change_money1 = parseFloat($("#change_money1").val())
        var $change_money2 = parseFloat($("#change_money2").val())
        var $change_money3 = $change_money1 - $change_money2
        $("#change_money3").val(parseFloat($change_money3))
    });
    // 充值
    $("#ajax_btn").click(function () {
        if ($("#change_money2").val() === parseFloat("")) {
            alert('请先输入充值额度？')
        } else {
            $.ajax({
                url: "/login_register/change_money/",
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
                    $("#change_money3").text(result.change_money3)
                    var $timer = setTimeout(function () {
                        alert("提现成功");
                        location.href = '/login_register/my_info';
                    }, 3000)

                },
                error: function () {
                    alert("error")
                }

            });
        }

    });
})