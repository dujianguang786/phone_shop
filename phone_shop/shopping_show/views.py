from django.shortcuts import render, redirect, HttpResponse
from django.http import JsonResponse
from shopping_show.models import Goods, GoodsSpecies, GoodsCapacity, GoodsColorsPicture, GoodsRepertory
from login_register.models import UserInfo
from shopping_cart.models import ShoppingCart
import json
from login_register.views import login_check
# 分页模块
from django.core.paginator import Paginator
import re

# Create your views here.


def index(request):
    return render(request, 'shopping_show/index.html')


def apple(request, goods_spdcies1, page_index):
    """商品种类内容"""
    # print(table)
    dict = {
        "apple": ["苹果", "isactive1"],
        "huawei": ["华为", "isactive2"],
        "xiaomi": ["小米", "isactive3"],
        "meizu": ["魅族", "isactive4"],
        "vivo": ["vivo", "isactive5"],
        "oppo": ["oppo", "isactive6"],
    }
    dict2 = {
        dict[goods_spdcies1][1]: "active"
    }
    # 找到对应品牌的手机
    ret = GoodsSpecies.objects.filter(species_name=dict[goods_spdcies1][0]).first().goods_set.all()
    # print(ret)
    # 手机名列表
    obj_list = [name for name in ret]
    # 具体手机list
    phone_all_list = []
    for phone in obj_list:
        for phone1 in phone.goodsrepertory_set.all():
            phone_all_list.append(phone1)
            # print(phone1.goods_colors_picture.phone_picture_addr)
            # print(type(phone1))
            # for addr in phone1.goods_colors_picture.all():
            #     print(addr)
    # print("=======================")
    # print(phone_all_list)
    # print("----------------------")

    # print(obj_list)
    # for i in obj_list:
    #     print(i.goodsrepertory_set.first().goods_price)
    # print(111111111)

    # 分页
    # page_obj = Paginator(ret, 3)  # 按每页10条数据进行分页
    page_obj = Paginator(phone_all_list, 8)  # 按每页10条数据进行分页
    # 显示第一条数据
    if page_index == "":
        page_index = 1
    else:
        page_index = int(page_index)
    # print(page_index)
    # 返回具体页实例对象
    page = page_obj.page(page_index)
    # print(page.object_list)
    # for i in page.object_list:
    #     ret = i.goodsrepertory_set.all().first().goods_colors_picture.phone_picture_addr
        # print(ret)
        # print(11111)
        # print(i.goodsrepertory_set.first()..first().phone_picture_addr)
        # print(i.goods_name)
    # print(page.object_list.id)

    return render(request, "shopping_show/apple.html", {"obj_list": obj_list,
                                                        "page": page,
                                                        "page_obj": page_obj,
                                                        "goods_spdcies1": goods_spdcies1,
                                                        dict[goods_spdcies1][1]:dict2[dict[goods_spdcies1][1]]})


def detail(request):
    """商品详情"""
    if request.method == "POST":
        # ajax
        res = request.POST.get("is_test")
        # print(res)
        if res[:5] == "color":
            print("--------------------")
            color_text = request.POST.get("color_text")
            # print("=========颜色ajax=========")
            # print("名字",color_text)
            # 图片地址
            addr11 = "../../" + GoodsColorsPicture.objects.filter(phone_color_name=color_text).first().phone_picture_addr
            # print(addr11)

            # 累积评价数量
            good_obj1 = GoodsColorsPicture.objects.filter(phone_color_name=color_text).first().goodsrepertory_set.all().first()
            # print(good_obj1.goods_price)
            evalute_num11 = good_obj1.goods.evalute_num
            # print(evalute_num11)

            # 剩余数量
            phone_num11 = good_obj1.goods_residue
            # print(phone_num11)

            # 手机价格
            phone_price11 = good_obj1.goods_price
            # print("￥" + str(phone_price11))

            return JsonResponse({"addr11": addr11,
                                 "evalute_num11": evalute_num11,
                                 "phone_num11": phone_num11,
                                 "phone_price11": phone_price11,})

        else:
            # print("============")
            capacity_text = request.POST.get("capacity_text")
            phone_name1 = request.POST.get("phone_name1")
            # print("=========容量ajax=========")
            # print("容量" + capacity_text)
            # print(phone_name1)
            # 图片地址
            addr11 = ""

            # 剩余数量
            phone_num11 = 0

            # 手机价格
            phone_price11 = 0

            capacity_1 = Goods.objects.get(goods_name=phone_name1).goodsrepertory_set
            for goodsrepertory1 in capacity_1.all():
                if goodsrepertory1.goods_capacity.phone_capacity == capacity_text:
                    addr11 = "../../" + goodsrepertory1.goods_colors_picture.phone_picture_addr
                    phone_num11 = goodsrepertory1.goods_residue
                    phone_price11 = goodsrepertory1.goods_price

            # capacity_1 = capacity_1.filter(capacity_1.all()).objects.filter(phone_capacity=capacity_text).first().goodsrepertory_set
            # addr11 = "../../" + capacity_1.get(goods_name=phone_name1).goods_colors_picture.phone_picture_addr
            # print(addr11)
            # print(phone_num11)
            # print(phone_price11)

            # 累积评价数量
            evalute_num11 = Goods.objects.get(goods_name=phone_name1).evalute_num
            # print(evalute_num11)


            return JsonResponse({"addr11": addr11,
                                 "evalute_num11": evalute_num11,
                                 "phone_num11": phone_num11,
                                 "phone_price11": phone_price11, })

    goods_obj = Goods.objects.get(id=request.GET.get("id"))
    # 用户评价
    evaluate = goods_obj.evaluate_set.filter()
    # 商品详情
    phone_detail1 = goods_obj.goodsdetails_set.filter()
    # 价格
    phone_price1 = goods_obj.goodsrepertory_set.all().first().goods_price
    # 累积评价数量
    # evalute_num= goods_obj.evalute_num
    evalute_num= len(evaluate)

    #剩余数量
    phone_num11 = goods_obj.goodsrepertory_set.all().first().goods_residue

    # 容量展示
    capacity_show_list = goods_obj.goodsrepertory_set.all()

    # 图片地址
    picture_addr1 = capacity_show_list.first().goods_colors_picture.phone_picture_addr
    # print(777777777)
    # print(picture_addr1)

    # 手机颜色展示
    phone_color_show_list = goods_obj.goodsrepertory_set.all()

    return render(request, "shopping_show/detail.html",{"picture_addr1": picture_addr1,
                                                        "goods_obj": goods_obj,
                                                        "phone_price1": phone_price1,
                                                        "phone_num11": phone_num11,
                                                        "evalute_num": evalute_num,
                                                        "phone_color_show_list": phone_color_show_list,
                                                        "capacity_show_list": capacity_show_list,
                                                        "evaluate": evaluate,
                                                        "phone_detail1":phone_detail1})


def search(request, goods_spdcies1, page_index):
    """搜索"""

    def page(phone_all_list, page_index):
        # 分页
        page_obj = Paginator(phone_all_list, 100)  # 按每页10条数据进行分页

        # print(5555555555555555)
        # print(page_obj.num_pages)
        # print(page_obj.page_range)
        # 显示第一条数据
        if page_index == "":
            page_index = 1
        else:
            page_index = int(page_index)

        # print(111111111111)
        # print(page_index)
        # 返回具体页实例对象
        page = page_obj.page(page_index)
        # print(page.object_list)

        return render(request, "shopping_show/search.html", {"page": page,
                                                              "page_obj": page_obj,
                                                              "goods_spdcies1": goods_spdcies1})

    msg = ""
    username = request.POST.get("name")
    # if username == "":
    #     username = request.POST.get("")
    regex = re.compile(r"{}".format(username))
    # print([username])
    # 所有手机名称list
    name_obj_list = Goods.objects.all()
    # print(name_obj)
    # 是否有数据能用来被检索
    if len(name_obj_list) > 0:
        # print("========================")
        search_list = []
        for name_obj1 in name_obj_list:
            # 是否检索到目标相关数据
            if len(regex.findall(name_obj1.goods_name)) > 0:
                search_list.append(name_obj1)
        # print(search_list)
        if len(search_list) > 0:

            # 具体手机list
            phone_all_list = []
            for phone in search_list:
                for phone1 in phone.goodsrepertory_set.all():
                    phone_all_list.append(phone1)
                    print(phone1.goods_colors_picture.phone_picture_addr)

            # print(phone_all_list)
            return page(phone_all_list, page_index)

    msg = "暂无数据"
    return render(request, "shopping_show/search.html", {"msg": msg})

@login_check
def addr_cart(request):
    """添加手机到购物车"""
    # 添加到 当前用户下 购物车中
    if request.method == "POST":
        # print("================")
        # 手机名goodsid
        goodsid = request.POST.get("goodsid")
        # print(goodsid)

        # 手机简介
        good_intro = Goods.objects.get(goods_name=goodsid).goods_intro
        # print(good_intro)

        # 手机id
        phone_id = Goods.objects.get(goods_name=goodsid).id

        # 手机颜色地址colorid
        colorid = request.POST.get("colorid").split("../../")[1]
        # print(colorid)


        # 手机颜色
        phone_color = request.POST.get("colorid").split("/")[5].split(".jpg")[0]
        # print(phone_color)
        # phone_color = phone_color
        # print(phone_color)

        # 手机价格
        shop_price = GoodsColorsPicture.objects.get(phone_color_name=phone_color).goodsrepertory_set.first().goods_price

        # 手机存储容量capacityid
        capacityid = GoodsColorsPicture.objects.get(phone_picture_addr=colorid).goodsrepertory_set.first().goods_capacity.phone_capacity
        # print(capacityid)

        # 购买件数buy_count
        buy_count = request.POST.get("buy_count")
        # print(buy_count)
        # print(type(buy_count))
        # 用户id userinfo
        username = request.session.get('user_name')
        userinfo_id = UserInfo.objects.get(user_name=username, user_privilege=1)
        # print(userinfo_id)
        # print("==================")
        # 判断是否已添加过该商品到购物车
        is_exist = userinfo_id.shoppingcart_set.filter(goodsid=goodsid, colorid=colorid, capacityid=capacityid, userinfo=userinfo_id, color_name=phone_color, price=shop_price, intro=good_intro, shop_id=phone_id, is_default_address=0).first()
        # print("==================")
        if is_exist:
            userinfo_id.shoppingcart_set.filter(goodsid=goodsid, colorid=colorid, capacityid=capacityid, userinfo=userinfo_id, color_name=phone_color, price=shop_price, intro=good_intro, shop_id=phone_id, is_default_address=0).update(buy_count=int(buy_count) + int(is_exist.buy_count))
        else:
            userinfo_id.shoppingcart_set.create(goodsid=goodsid, colorid=colorid, capacityid=capacityid, buy_count=buy_count, userinfo=userinfo_id, color_name=phone_color, price=shop_price, intro=good_intro, shop_id=phone_id)
        return JsonResponse({"ret": 0})