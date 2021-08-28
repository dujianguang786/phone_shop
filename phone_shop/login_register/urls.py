from django.contrib import admin
from django.urls import path, re_path
from login_register import views
import time


time.sleep(3)
urlpatterns = [
    # 登陆
    path('login/', views.login),
    # 注册
    path('register/', views.register),
    # 退出
    path('logout/', views.logout),
    # 注销
    path('delete_user/', views.delete_user),
    # 展示个人信息
    path('my_info/', views.my_info),
    # 编辑个人信息
    path('edit_my_info/', views.edit_my_info),
    # 修改个人密码
    path('edit_pwd/', views.edit_pwd),
    # 充值或提现
    path('change_money/', views.change_money),
    path('extract_money/', views.extract_money),
    # 收件地址展示
    path('addr_show/', views.addr_show),
    # 添加新收件地址
    path('add_addr/', views.add_addr),
    # 修改收件地址
    path('edit_addr/', views.edit_addr),
    # 删除收件地址
    path('delete_addr/', views.delete_addr),
    # 默认收件地址设置
    path('addr_set/', views.addr_set),


]