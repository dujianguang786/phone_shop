$(function () {
    $(".btn1").click(function () {
        var $num = $(this).next().text(parseFloat($(this).next().text()) - 1)
        if ($(this).next().text() < 1) {
            $(this).next().text(1)
            $num = 1
        }
        var $num11 = parseFloat($(this).next().text())
        // alert($num11)

        var $price11 = parseFloat($(this).parent().parent().prev().prev().find("span").text())
        // alert($price11)
        var $res11 = $num11 * $price11
        // alert($res)
        $(this).parent().parent().next().find("span").text($res11)
    })
    $(".btn2").click(function () {
        $(this).prev().text(parseFloat($(this).prev().text()) + 1)
        var $num12 = parseFloat($(this).prev().text())
        var $price12 = parseFloat($(this).parent().parent().prev().prev().find("span").text())
        var $res12 = $num12 * $price12
        $(this).parent().parent().next().find("span").text($res12)
    })

    var $list2 = []
    for (let i = 0; i < $(".num2").length; i++) {
        $list2.push(parseFloat($(".num2")[i].textContent))
    }

    var $list1 = []
    for (let i = 0; i < $(".num1").length; i++) {
        $list1.push(parseFloat($(".num1")[i].textContent))
    }

    for (let i = 0; i < $list1.length; i++) {
        $(".price")[i].textContent = $list1[i] * $list2[i]
    }
})