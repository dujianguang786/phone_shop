from django.shortcuts import render, redirect, HttpResponse
from django.http import JsonResponse
from login_register.models import UserInfo, Address, RecordTable
from shopping_cart.models import ShoppingCart
from shopping_order.models import ShoppingOrderInfo, ShoppingOrderDetail
from shopping_show.models import Goods, GoodsSpecies, GoodsCapacity, GoodsColorsPicture
import json
import re
# 分页模块
from django.core.paginator import Paginator
import time
from login_register.views import login_check

# Create your views here.

@login_check
def cart_show(request):
    """购物车信息展示"""
    username = request.session.get('user_name')
    # print(username)
    ret = UserInfo.objects.get(user_name=username, user_privilege=1)
    # 判断为True, 删除购物车相关信息
    if request.method == "POST":
        # print("_____________")
        id_list = json.loads(request.POST.get("id_list"))
        # print(id_list)
        # print("----------------")
        if len(id_list) > 0:
            for i in id_list:
                # print(22222222222)
                # print(i)
                # print(33333333333)
                ret.shoppingcart_set.filter(id=int(i)).update(is_default_address=1)
            return JsonResponse({"ret": 0})
        else:
            return JsonResponse({"ret": 1})

    ret1 = ret.shoppingcart_set.filter(is_default_address=0)
    return render(request, "shopping_cart/cart_show.html", {"ret1": ret1})


@login_check
def create_order(request):
    """把订单数据到数据库"""
    username = request.session.get('user_name')
    user_obj = UserInfo.objects.get(user_name=username, user_privilege=1)
    if request.method == "POST":
        # 订单信息展示, 确认后再进行支付

        # 准备支付的订单的详情id列表
        id_list = json.loads(request.POST.get("id_list"))
        # 被选取单个商品的不同数量
        num_list = json.loads(request.POST.get("num_list"))
        # 被选取单个商品不同数量对应的总价
        price_list = json.loads(request.POST.get("price_list"))
        # 准备支付的订单的支付方式
        pay_static = request.POST.get("pay_static")
        print(pay_static)
        # 准备支付的订单的订单总价
        money_sum = request.POST.get("money_sum")
        print(price_list)
        # print(")0000000000000000")

        # 2.把数据添加到数据库
        # 创建当前用户相关订单
        order_user_obj = user_obj.shoppingorderinfo_set.create(userinfo=user_obj, trade_money=int(money_sum))
        # 把数据添加到对应定单的详情表中
        if id_list:
            for i in range(len(id_list)):
                phone = ShoppingCart.objects.get(id=id_list[i])
                # 手机名
                phone_name = phone.goodsid
                # 手机图片地址
                phone_color_addr = phone.colorid
                # 手机颜色
                phone_color_name = phone.color_name
                # 手机价格
                phone_price = phone.price
                # 手机总价
                phone_price_all = price_list[i]
                # 该手机购买数量
                phone_buy_num = num_list[i]
                # 手机简介
                phone_intro = phone.intro
                # 手机id
                phone_name_id = phone.shop_id
                # 手机存储容量
                phone_capacityid = phone.capacityid
                # 添加到该用户下， 下单信息表下的订单信息商品详情表
                ShoppingOrderDetail.objects.create(goodsid=phone_name, colorid=phone_color_addr,
                                                   capacityid=phone_capacityid, buy_count=phone_buy_num,
                                                   color_name=phone_color_name, price=phone_price,
                                                   price_all=phone_price_all, intro=phone_intro,
                                                   shop_id=phone_name_id, shopping_order_info=order_user_obj)
                # 删除用户对应购物车数据
                user_obj.shoppingcart_set.filter(id=id_list[i]).update(is_default_address=1)

        dict1 = {
            '0': "余额",
            '1': "微信",
            '2': "支付宝",
        }

        """session不能传对象"""
        # 根据id把要付款的订单详情对象id添加到一个列表里
        orderdetail_id = [obj.id for obj in order_user_obj.shoppingorderdetail_set.filter()]
        print(orderdetail_id)

        # 传递展示数据id
        request.session['dict1'] = {"money_sum": money_sum,
                                    "pay_static": dict1[pay_static],
                                    'orderdetail_id': orderdetail_id}
        print("hello")

        return JsonResponse({"ret": 0})


@login_check
def order_pay_1(request):
    """展示订单数据, 再次确认,并跳转支付"""
    username = request.session.get('user_name')
    user_obj = UserInfo.objects.get(user_name=username, user_privilege=1)
    # 确认是否设置好默认地址，或地址详情是否完善
    addr = user_obj.address_set.filter(is_default_address=1)
    # 购物中下单时，还没添加地址或有地址没默认地址时
    if not addr:
        # print(request.path_info)
        return redirect("/login_register/addr_show")
    # 地址信息展示
    addr_detail = user_obj.address_set.get(is_default_address=1)
    # 购物中下单时，地址信息详情没有完善时
    if not (addr_detail.addressee_address and addr_detail.address_postcode and addr_detail.addressee_name and addr_detail.addressee_phone):
        return redirect("/login_register/addr_show")

    money_sum = request.session.get("dict1")['money_sum']
    pay_static = request.session.get("dict1")['pay_static']
    orderdetail_id = request.session.get("dict1")['orderdetail_id']
    # print(11111111111)
    orderdetail_list = []
    for i in orderdetail_id:
        orderdetail_list.append(ShoppingOrderDetail.objects.get(id=i))

    return render(request, "shopping_order/order_pay.html", {"money_sum": money_sum,
                                                            "pay_static": pay_static,
                                                            "orderdetail_list": orderdetail_list,
                                                            "addr_detail": addr_detail})




