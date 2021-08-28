$(function () {
    $("#ajax_btn").click(function () {
        $.ajax({
            url: "/login_register/register/",
            type: "post",
            dataType: "JSON",
            // 获取用户数据
            data: {
                "username": $("#user_name").val(),
                "password1": $("#user_pwd").val(),
                "password2": $("#user_pwd1").val(),
                "csrfmiddlewaretoken": $("[name='csrfmiddlewaretoken']").val()
            },
            success: function (result) {
                if (result.res === 0) {
                    alert("注册成功")
                    location.href = "/login_register/login"
                } else if (result.res === 2){
                    $("#msg2").text("密码不匹配，请重新输入！！！")
                } else {
                    $("#msg1").text("该用户已存在，请重新输入！！！")
                }
            },
            error: function () {
                alert("error")
            }
        });
    });
})