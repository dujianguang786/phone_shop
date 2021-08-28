from django.contrib import admin
from django.urls import path, re_path
from shopping_show import views


urlpatterns = [
    # 商城主页面
    path('index/', views.index),
    # 具体手机种类商品展示
    re_path(r'(?P<goods_spdcies1>apple|huawei|meizu|oppo|vivo|xiaomi)/(?P<page_index>\d*)$', views.apple),
    # 查看商品详情
    path('detail/', views.detail),
    # 查找手机
    re_path(r'(?P<goods_spdcies1>search)/(?P<page_index>\d*)$', views.search),
    # 添加到购物车
    path("addr_cart/", views.addr_cart)
]