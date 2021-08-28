from django.shortcuts import render, redirect, HttpResponse
from django.http import JsonResponse
from login_register.models import UserInfo, Address, RecordTable
from shopping_cart.models import ShoppingCart
from shopping_order.models import ShoppingOrderInfo, ShoppingOrderDetail
from shopping_show.models import Goods, GoodsSpecies, GoodsCapacity, GoodsColorsPicture, Evaluate
import json
import re
# 分页模块
from django.core.paginator import Paginator
import time
from login_register.views import login_check


# Create your views here.


@login_check
def not_pay_order(request):
    """购物车新添加的订单信息展示表"""
    # 获取当前用户
    username = request.session.get('user_name')
    ret = UserInfo.objects.get(user_name=username, user_privilege=1)
    # 获取当前用户所有未支付，未被删除的所有订单
    ret1 = ret.shoppingorderinfo_set.filter(delete_order=0, payment_static=0)
    # 符合条件，删除当前用户所有未支付，未被删除的所有订单中的部分订单
    if request.method == "POST":
        # print("_____________")
        id_list = json.loads(request.POST.get("id_list"))
        # print(id_list)
        if len(id_list):
            for i in id_list:
                ShoppingOrderInfo.objects.filter(id=i).delete()

        return JsonResponse({"ret": 0})
    return render(request, "shopping_order/not_pay_order.html", {"ret1": ret1})

# @login_check
# def order_pay(request):
#     """准备付款的订单详情信息保存"""
#     if request.method == "POST":
#         # print("_____________")
#         # 准备支付的订单的详情id列表
#         id_list = json.loads(request.POST.get("id_list"))
#         # 准备支付的订单的支付方式
#         pay_static = json.loads(request.POST.get("pay_static"))
#         # 准备支付的订单的订单总价
#         money_sum = json.loads(request.POST.get("money_sum"))
#         request.session['id_list'] = id_list
#         request.session['pay_static'] = pay_static
#         request.session['money_sum'] = money_sum
#
#         return JsonResponse({"ret": 0, "money_sum": money_sum, "id_list": id_list})


@login_check
def pay_money(request, money):
    """正式支付"""
    username = request.session.get('user_name')
    ret = UserInfo.objects.get(user_name=username, user_privilege=1)
    # print(ret)
    # 符合判断条件：1、改变余额和添加流水记录 2、把订单支付状态改为支付 和 商品数量的对应去除
    if request.method == "POST":
        print("----------------------")
        change_money1 = request.POST.get("change_money1")
        change_money2 = request.POST.get("change_money2")
        change_money3 = request.POST.get("change_money3")
        # print("================")
        # 改变余额和添加流水记录
        UserInfo.objects.filter(user_name=username, user_privilege=1).update(my_money=change_money3)
        ret.recordtable_set.create(previous_money=int(change_money1), recharge_or_consume="-" + change_money2,
                                   next_money=change_money3)
        # print(username)
        # print(6666666666)
        #
        # 把订单支付状态改为支付 和 商品数量的对应去除
        orderdetail_id = request.session.get("dict1")['orderdetail_id']
        #

        if len(orderdetail_id):
            # 把订单支付状态改为支付, 订单下对应商品状态改为支付
            id_1 = ShoppingOrderDetail.objects.get(id=orderdetail_id[0]).shopping_order_info_id
            ShoppingOrderInfo.objects.filter(id=id_1).update(payment_static=1)
            for i in orderdetail_id:
                # 手机图片地址
                order_obj = ShoppingOrderDetail.objects.get(id=i)
                addr = order_obj.colorid
                num = GoodsColorsPicture.objects.get(phone_picture_addr=addr).goodsrepertory_set.first().goods_residue
                num1 = GoodsColorsPicture.objects.get(phone_picture_addr=addr).goodsrepertory_set.filter().update(goods_residue=int(num)-order_obj.buy_count)
                # print("==================")
                # print(num1)
                # print("==============")

        return JsonResponse({"change_money3": change_money3})
    username = request.session.get('user_name')
    ret = UserInfo.objects.get(user_name=username, user_privilege=1)

    return render(request, "shopping_order/pay_money.html", {"money": money,
                                                             "ret": ret})


@login_check
def pay_money_1(request, money, id):
    """支付"""
    # print("=================================================")
    # print(money)
    # print(id)
    # print("=================================================")

    username = request.session.get('user_name')
    ret = UserInfo.objects.get(user_name=username, user_privilege=1)

    username = request.session.get('user_name')
    ret = UserInfo.objects.get(user_name=username, user_privilege=1)
    request.session["id"] = id
    # request.session["money"] = money

    return render(request, "shopping_order/pay_money1.html", {"money": money,
                                                             "ret": ret})


@login_check
def pay_money_2(request):
    """支付"""
    # print("hello_________-world")
    username = request.session.get('user_name')
    ret = UserInfo.objects.get(user_name=username, user_privilege=1)
    # print(ret)
    # 符合判断条件：1、改变余额和添加流水记录 2、把订单支付状态改为支付 和 商品数量的对应去除
    if request.method == "POST":
        # print("----------------------")
        change_money1 = request.POST.get("change_money1")
        change_money2 = request.POST.get("change_money2")
        change_money3 = request.POST.get("change_money3")
        # print("================")
        # 改变余额和添加流水记录
        UserInfo.objects.filter(user_name=username, user_privilege=1).update(my_money=change_money3)
        ret.recordtable_set.create(previous_money=int(change_money1), recharge_or_consume="-" + change_money2,
                                   next_money=change_money3)
        # print(username)
        # print(6666666666)
        #
        # 把订单支付状态改为支付 和 商品数量的对应去除
        # orderdetail_id = request.session.get("dict1")['orderdetail_id']
        id = request.session.get("id")
        # print(id)
        # money = request.session.get("money")
        if len(id):
            obj_order = ret.shoppingorderinfo_set.filter(id=id)
            # print(obj_order)
            obj_order.update(payment_static=1)
            # print("=================================================")
            # print(ret.shoppingorderinfo_set.get(id=id))
            # print(obj_order.first().shoppingorderdetail_set.filter())

            for i in obj_order.first().shoppingorderdetail_set.filter():
                # 手机图片地址
                # order_obj = ShoppingOrderDetail.objects.get(id=i)
                addr = i.colorid
                num = GoodsColorsPicture.objects.get(phone_picture_addr=addr).goodsrepertory_set.first().goods_residue
                num1 = GoodsColorsPicture.objects.get(phone_picture_addr=addr).goodsrepertory_set.filter().update(
                    goods_residue=int(num) - i.buy_count)
                # print("==================")
                # print(num1)
                # print("==============")

        return JsonResponse({"ret": 0})




@login_check
def all_order(request):
    """查看待收货，收货后跳转评价"""
    username = request.session.get('user_name')
    ret = UserInfo.objects.get(user_name=username, user_privilege=1)
    ret = ret.shoppingorderinfo_set.filter(delete_order=0,payment_static=1)
    list = []
    for i in ret:
        for j in i.shoppingorderdetail_set.filter():
            if j.delete_shop == 0:
                list.append(j)


    # print("==============")
    return render(request, "shopping_order/all_order.html", {"list": list,})


@login_check
def my_evaluate(request, id):
    """评价"""
    # print("+================_____________")
    # print(id)
    username = request.session.get('user_name')
    ret = UserInfo.objects.get(user_name=username, user_privilege=1)
    if request.method == "POST":
        text_content = request.POST.get("memo")
        # print(text_content)
        # 把手机评价信息存储到数据库
        # 手机名
        phone_id = ShoppingOrderDetail.objects.get(id=id).shop_id
        phone_name = Goods.objects.get(id=phone_id).goods_name
        phone_obj = Goods.objects.get(id=phone_id)
        Evaluate.objects.create(name=username, goods_name=phone_name, content1=text_content, goods=phone_obj)

        # 把商品收货状态改为已收货,
        ShoppingOrderDetail.objects.filter(id=id).update(is_trade=1, delete_shop=1)
        # 判断订单下所有商品是否全部收货
        order_obj = ShoppingOrderDetail.objects.get(id=id).shopping_order_info.shoppingorderdetail_set.filter()
        # print("hell============")
        # print(order_obj)
        list = []
        for order_shop in order_obj:
            if order_shop.is_trade == 1:
                list.append(order_shop)
        if len(order_obj) == len(list) :
            id_order = ShoppingOrderDetail.objects.get(id=id).shopping_order_info_id
            # print("99999999999999999999999999")
            ShoppingOrderInfo.objects.filter(id=id_order).update(is_trade=1)
        print("==============")
        return redirect("/shopping_order/order_record")

    return render(request, "shopping_order/my_evaluate.html", {"ret": ret})

@login_check
def order_record(request):
    """查看购物历史"""
    if request.method == "POST":
        # print("_____________")
        id_list = json.loads(request.POST.get("id_list"))
        # print(444444444444)
        print(id_list)
        # print("----------------")
        if len(id_list):
            for i in id_list:
                ShoppingOrderDetail.objects.filter(id=i).delete()

        return JsonResponse({"ret": 0})

    username = request.session.get('user_name')
    ret = UserInfo.objects.get(user_name=username, user_privilege=1)

    # 查找到未被删除、已支付、已收货订单列表,
    order_list = [order for order in ret.shoppingorderinfo_set.filter(payment_static=1, delete_order=0)]
    # order_list = [order for order in ret.shoppingorderinfo_set.filter(payment_static=1, delete_order=0, is_trade=1)]
    # print(order_list)
    # 查找到被删除、已支付订单下已收货状态的商品列表
    phone_list = []
    for order in order_list:
        for phone in order.shoppingorderdetail_set.filter(is_trade=1, delete_shop=1):
            phone_list.append(phone)
    return render(request, "shopping_order/order_record.html", {"phone_list": phone_list})


