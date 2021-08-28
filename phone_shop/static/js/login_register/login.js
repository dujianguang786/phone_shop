$(function () {
    $("#ajax_btn").click(function () {
        $.ajax({
            url: "/login_register/login/",
            type: "post",
            dataType: "JSON",
            // 获取用户数据
            data: {
                "username": $("#user_name").val(),
                "password": $("#user_pwd").val(),
                "csrfmiddlewaretoken": $("[name='csrfmiddlewaretoken']").val()
            },
            success: function (result) {
                if (result.res === 0) {
                    $("#msg2").text("用户名或密码错误或该账户已注销！！！")
                } else if (result.next === null){
                    alert("登陆成功")
                    location.href = "/shopping_show/index"
                } else {
                    alert("登陆成功")
                    location.href = result.next
                }
            },
            error: function () {
                alert("error")
            }
        });
    });
})