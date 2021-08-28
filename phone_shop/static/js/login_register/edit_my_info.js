$(function () {
    $("#ajax_btn").click(function () {
        $.ajax({
            url: "/login_register/edit_my_info/",
            type: "post",
            dataType: "JSON",
            // 获取用户数据
            data: {
                "user_name": $("#user_name").val(),
                "user_email": $("#user_email").val(),
                "user_phone": $("#user_phone").val(),
                "money": $("#money").val(),
                // "user_addr": $("#user_addr").val(),
                "csrfmiddlewaretoken": $("[name='csrfmiddlewaretoken']").val()
            },
            success: function (result) {
                if (result.msg1 === "" && result.msg2 === "" && result.msg3 === "") {
                    alert("修改成功")
                    if (result.res === 1) {
                        alert(1)
                        location.href = "/login_register/logout"
                    } else {
                        location.href = "/login_register/my_info"
                    }
                } else {
                    $("#msg1").text(result.msg1)
                    $("#msg2").text(result.msg2)
                    $("#msg3").text(result.msg3)
                }
            },
            error: function () {
                alert("error")
            }

        });
    });
})