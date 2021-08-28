$(function () {
    $("#pay_money_sum").click(function () {
        var $check_1 = $('div div input.check_1:checked')
        if ($check_1.length === 0) {
            var $pay_money_sum1 = 0
            $("#pay_money").val($pay_money_sum1)
        } else {
            var $price_list = [];
            var $get_price = $check_1.parent().nextAll("#price").find("span");
            for (let i=0; i<$get_price.length; i++) {
                $price_list.push($get_price[i].textContent)
            }
            var $pay_money_sum = 0
            for (let i=0; i<$price_list.length; i++) {
                $pay_money_sum  = parseFloat($pay_money_sum) + parseFloat($price_list[i])
            }
            // alert($pay_money_sum)
            $("#pay_money").val($pay_money_sum)
        }
    })
})