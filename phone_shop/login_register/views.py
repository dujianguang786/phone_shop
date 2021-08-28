from django.shortcuts import render, redirect, HttpResponse
from django.http import JsonResponse
from login_register.models import UserInfo, Address, RecordTable
from shopping_show.models import Goods, GoodsSpecies, GoodsCapacity, GoodsColorsPicture
from login_register.models import UserInfo, Address
import json
import re
# 分页模块
from django.core.paginator import Paginator
import time


# Create your views here.

# 装饰器
def login_check(fn):
    def inner(request, *args, **kwargs):
        if not request.session.get('is_login') == '1':
            next = request.path_info
            # print("_____装饰器_______")
            # print(next)
            # 跳转登陆，并把跳转的路径存入session
            request.session['next'] = next
            return redirect('/login_register/login/?next={}'.format(next))
            # return redirect('/login/')
        ret = fn(request, *args, **kwargs)
        return ret

    return inner


def login(request):
    """登陆"""
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")
        # print(username, password)
        # 判断账号密码是否正确, 账户是否还在注册状态i
        if UserInfo.objects.filter(user_name=username, user_password=password, user_privilege=1).first():
            next = request.session.get('next')
            # print(next)
            request.session['user_name'] = username
            request.session.set_expiry(10000000)
            request.session['is_login'] = '1'
            return JsonResponse({"res": 1, "next": next})
        else:
            return JsonResponse({"res": 0})
    return render(request, 'login_register/login.html')


def register(request):
    """注册"""
    if request.method == "POST":
        username = request.POST.get("username")
        password1 = request.POST.get("password1")
        password2 = request.POST.get("password2")
        # print("名字", username)
        # 判断用户名是否已被使用: res: 1,已被使用，0未被使用且密码一致，2未被使用但密码不一致
        if UserInfo.objects.filter(user_name=username, user_privilege=1).first():
            return JsonResponse({"res": 1})
        else:
            if password1 == password2:
                UserInfo.objects.create(user_name=username, user_password=password1)
                return JsonResponse({"res": 0})
            else:
                return JsonResponse({"res": 2})
    return render(request, 'login_register/register.html')


@login_check
def logout(request):
    """退出"""
    # 退出，调用该函数当前请求的session信息会被全部清除
    request.session.flush()
    return redirect('/shopping_show/index/')


def delete_user(request):
    """注销"""
    username = request.session.get('user_name')
    UserInfo.objects.filter(user_name=username, user_privilege=1).update(user_privilege=0)
    # 注销，调用该函数当前请求的session信息会被全部清除
    request.session.flush()
    return redirect('/shopping_show/index/')


@login_check
def my_info(request):
    """个人信息展示"""
    # time.sleep(3)
    username = request.session.get('user_name')
    ret = UserInfo.objects.get(user_name=username, user_privilege=1)
    # print(ret)
    # 默认地址
    addr1 = ret.address_set.get(is_default_address=1)
    # 没有添加默认地址时容错
    if addr1 == None:
        addr1 = "暂无添加默认地址"
    else:
        addr1 = addr1.addressee_address
    # print(addr1)
    return render(request, "login_register/my_info.html", {"ret": ret,
                                                           "addr1": addr1})


@login_check
def edit_my_info(request):
    """修改个人信息"""
    msg1, msg2, msg3, res = '', '', '', 0
    username = request.session.get('user_name')
    # print(username)
    ret = UserInfo.objects.filter(user_name=username, user_privilege=1)
    # print(ret)
    if request.method == "POST":
        print("+++++++++++++++++++++")
        new_name = request.POST.get("user_name")
        new_email = request.POST.get("user_email")
        new_phone = request.POST.get("user_phone")
        money = request.POST.get("money")
        # print(new_name, new_email, new_email, money)
        obj1 = UserInfo.objects.get(user_name=username, user_privilege=1)

        obj = UserInfo.objects.filter(user_privilege=1)
        name_lsit = [name.user_name for name in obj]
        email_lsit = [email.user_email for email in obj]
        phone_lsit = [phone.phone for phone in obj]
        if new_name not in name_lsit and new_name != None:
            if new_email not in email_lsit:
                if new_phone not in phone_lsit:
                    UserInfo.objects.filter(user_name=username, user_privilege=1).update(user_name=new_name,
                                                                                         user_email=new_email,
                                                                                         phone=new_phone,
                                                                                         )
                    if new_name != obj1.user_name:
                        # dict = json.dumps({"ret": 1})
                        request.session.flush()
                        res = 1
                    else:
                        res = 0
                        # dict = json.dumps({"ret": 0})
                    return JsonResponse({"msg1": msg1, "msg2": msg2, "msg3": msg3, "res": res})
                else:
                    msg3 = '该手机号已被使用或不能为空！！'
            else:
                msg2 = '该邮箱已被注册！！！'
        else:
            msg1 = '用户名不能为空或该用户名已存在！！！'


        return JsonResponse({"msg1": msg1, "msg2": msg2, "msg3": msg3, "dict": res})

    # 默认地址
    # addr1 = ret.first().address_set.filter(is_default_address=1).first().addressee_address
    # print(addr1)
    return render(request, "login_register/edit_my_info.html", {"ret": ret,
                                                                # "addr1": addr1,
                                                                "msg1": msg1,
                                                                "msg2": msg2,
                                                                "msg3": msg3,
                                                                })


@login_check
def edit_pwd(request):
    """修改个人密码"""
    msg1, msg2, msg3 = '', '', ''
    user = request.session.get('user_name')
    # print(user)
    ret = UserInfo.objects.filter(user_name=user, user_privilege=1)
    # print(ret)
    if request.method == "POST":
        # print("--------------")
        pwd1 = request.POST.get("pwd1")

        pwd2 = request.POST.get("pwd2")
        pwd3 = request.POST.get("pwd3")
        # print(pwd2, pwd3)
        # print(type(pwd2))
        if pwd1 == ret[0].user_password:
            # print("___________-")
            if not pwd2.isspace():
                if pwd2 == pwd3:
                    UserInfo.objects.filter(user_name=user, user_privilege=1).update(user_password=pwd3)
                    return redirect('/shopping_show/index')
                else:
                    # print(5555555555555555555)
                    msg2 = '输入的新密码不一致！！！'
            else:
                msg2 = "新密码不能为空！！！"
        else:
            # print("====================")
            msg1 = '旧密码输入错误'
    return render(request, 'login_register/edit_pwd.html', {'my_info': ret,
                                                            'msg1': msg1,
                                                            'msg2': msg2,
                                                            'msg3': msg3, })
    # return render(request, "")


@login_check
def change_money(request):
    """充值"""
    username = request.session.get('user_name')
    ret = UserInfo.objects.get(user_name=username, user_privilege=1)
    # print(ret)
    if request.method == "POST":
        # print("----------------------")
        change_money1 = request.POST.get("change_money1")
        change_money2 = request.POST.get("change_money2")
        change_money3 = request.POST.get("change_money3")
        # print("================")
        UserInfo.objects.filter(user_name=username, user_privilege=1).update(my_money=change_money3)
        ret.recordtable_set.create(previous_money=int(change_money1), recharge_or_consume="+" + change_money2,
                                   next_money=change_money3)
        # print(username)
        # print(6666666666)
        return JsonResponse({"change_money3": change_money3})

    return render(request, "login_register/change_money.html", {"ret": ret})

@login_check
def extract_money(request):
    """提现"""
    username = request.session.get('user_name')
    ret = UserInfo.objects.get(user_name=username, user_privilege=1)
    # print(ret)
    if request.method == "POST":
        # print("----------------------")
        change_money1 = request.POST.get("change_money1")
        change_money2 = request.POST.get("change_money2")
        change_money3 = request.POST.get("change_money3")
        if change_money3 < 0:
            change_money3 = 0
        # print("================")
        UserInfo.objects.filter(user_name=username, user_privilege=1).update(my_money=change_money3)
        ret.recordtable_set.create(previous_money=int(change_money1), recharge_or_consume="-" + change_money2,
                                   next_money=change_money3)

        return JsonResponse({"change_money3": change_money3})

    return render(request, "login_register/extract_money.html", {"ret": ret})


@login_check
def addr_show(request):
    """查看收件地址"""
    username = request.session.get('user_name')
    ret = UserInfo.objects.get(user_name=username, user_privilege=1).address_set.all()
    # 地址类型
    # addr_type = ret.first().addr_choice[ret.first().is_default_address][1]
    return render(request, 'login_register/addr_show.html', {"ret": ret,})

@login_check
def add_addr(request):
    """添加新收件地址"""
    msg, msg2 = "", ""
    if request.method == "POST":
        username = request.session.get('user_name')
        ret = UserInfo.objects.get(user_name=username, user_privilege=1)
        # print(ret)
        user_addr = request.POST.get("user_addr")
        addr_code = request.POST.get("addr_code")
        user_name = request.POST.get("user_name")
        user_phone = request.POST.get("user_phone")
        if len(user_name) != 0 and len(addr_code) != 0 and len(user_name) != 0 and len(user_phone) != 0:
            if len(ret.address_set.filter(addressee_address=user_addr, address_postcode=int(addr_code), addressee_name=user_name, addressee_phone=int(user_phone))) == 0:
                ret.address_set.create(addressee_address=user_addr, address_postcode=int(addr_code), addressee_name=user_name, addressee_phone=int(user_phone))
                # print(username)
                # print(6666666666)
                return redirect("/login_register/addr_show")
            else:
                msg = "该地址信息已存在！！！"
        else:
            msg2 = "所有信息不能为空！！！"

    return render(request, "login_register/add_addr.html", {"msg": msg,
                                                            "msg2": msg2})


@login_check
def edit_addr(request):
    """地址修改"""
    msg, msg2 = "", ""
    if request.method == "POST":
        username = request.session.get('user_name')
        ret = UserInfo.objects.get(user_name=username, user_privilege=1)

        user_addr = request.POST.get("user_addr")
        addr_code = request.POST.get("addr_code")
        user_name = request.POST.get("user_name")
        user_phone = request.POST.get("user_phone")
        if len(user_name) != 0 and len(addr_code) != 0 and len(user_name) != 0 and len(user_phone) != 0:
            ret2 = ret.address_set.filter(addressee_address=user_addr, address_postcode=int(addr_code),
                                          addressee_name=user_name, addressee_phone=int(user_phone))
            if len(ret2) == 0:
                ret2.update(addressee_address=user_addr, address_postcode=int(addr_code),
                                          addressee_name=user_name, addressee_phone=int(user_phone))
                # print("================")
                return redirect("/login_register/addr_show")
            else:
                msg = "该地址信息已存在！！！"
        else:
            msg2 = "所有信息不能为空！！！"
    edit_id = request.GET.get("id")
    ret = Address.objects.get(id=edit_id)
    return render(request, "login_register/edit_addr.html", {"ret": ret,
                                                             "msg": msg,
                                                             "msg2": msg2})


@login_check
def delete_addr(request):
    """删除地址"""
    # print("======id_delete======")
    username = request.session.get('user_name')
    ret = UserInfo.objects.get(user_name=username, user_privilege=1)
    if request.method == "POST":
        id_list = json.loads(request.POST.get("id_list"))
        # ret1 = request.POST.getlist("hello")
        # print(id_list)
        # print(type(id_list))
        for i in id_list:
            # print(i)
            ret.address_set.filter(id=int(i)).delete()
        # print("===========")

        # print("=================")
        return JsonResponse({"res": 0})
    edit_id = request.GET.get("id")
    # print(edit_id)
    # print(type(edit_id))
    ret.address_set.filter(id=edit_id).delete()
    return redirect("/login_register/addr_show")


@login_check
def addr_set(request):
    """默认地址设置"""
    edit_id = request.GET.get("id")
    # print(edit_id)
    username = request.session.get('user_name')
    ret = UserInfo.objects.get(user_name=username, user_privilege=1)
    ret.address_set.filter(id=edit_id).update(is_default_address=1)
    ret.address_set.exclude(id=edit_id).update(is_default_address=0)
    return redirect("/login_register/addr_show")




