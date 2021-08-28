from django.contrib import admin
from django.urls import path, re_path
from shopping_cart import views

# app_name = 'shopping_cart'

urlpatterns = [
    # 购物车信息展示
    path('cart_show/', views.cart_show),
    # 生成订单
    path('create_order/', views.create_order),
    # 展示订单数据, 再次确认,并跳转支付
    path('order_pay_1/', views.order_pay_1),

]
