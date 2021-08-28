$(function () {
            var $div1 = $("#tbody")
            $div1.delegate('button', 'click', function () {
                $.ajax({
                    url: "/shopping_show/detail/",
                    type: "post",
                    dataType: "JSON",
                    // 获取用户数据
                    data: {
                        "color_text": $(this).text(),
                        "is_test": $(this).attr('id'),
                        "csrfmiddlewaretoken": $("[name='csrfmiddlewaretoken']").val()
                    },
                    success: function (result) {
                        $("#img11").attr('src', result.addr11)
                        $("#price11").text("￥" + String(result.phone_price11))
                        $("#evalute_num11").text(result.evalute_num11)
                        $("#phone_num11").text(result.phone_num11)
                    },
                    error: function () {
                        alert("error")
                    }
                });
            });

            var $div2 = $("#div2")
            $div2.delegate('button', 'click', function () {
                $.ajax({
                    url: "/shopping_show/detail/",
                    type: "post",
                    dataType: "JSON",
                    // 获取用户数据
                    data: {
                        "capacity_text": $(this).text(),
                        "phone_name1": $("h3").text(),
                        "is_test": $(this).attr('id'),
                        "csrfmiddlewaretoken": $("[name='csrfmiddlewaretoken']").val()
                    },
                    success: function (result) {
                        $("#img11").attr('src', result.addr11)
                        $("#price11").text("￥" + String(result.phone_price11))
                        $("#evalute_num11").text(result.evalute_num11)
                        $("#phone_num11").text(result.phone_num11)
                    },
                    error: function () {
                        alert("error")
                    }
                });
            });
        })