window.onload = function () {
    // 全选
    $('#check_all').click(function () {
        var $select_all1 = $('#select_list tr.aa input.check_1');
        if ($(this).prop("checked")) {
            $select_all1.prop("checked", true)
        } else {
            $select_all1.prop("checked", false)
        }
    });

    // 取消
    $("#cancel").click(function () {
        var $select_all1 = $('#select_list tr.aa input.check_1');
        $select_all1.prop("checked", false);
    });

    // 反选
    $('#invert').click(function () {
        var $select_all1 = $('#select_list tr.aa input:checked');
        var $select_all2 = $('#select_list tr.aa input:not(:checked)');
        $select_all1.prop("checked", false)
        $select_all2.prop("checked", true)

    });
}

