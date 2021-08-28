from django.contrib import admin
from django.urls import path, re_path
from shopping_order import views


urlpatterns = [
    # path('order_detail/', views.order_detail),
    # 未付款订单信息展示
    path('not_pay_order/', views.not_pay_order),
    # 下单信息展示
    # path('order_pay/', views.order_pay),
    # re_path('order_pay1/(?P<dict>\d*)', views.order_pay1),
    # 确认并跳转支付
    # re_path(r'order_pay1', views.order_pay1),
    # path('order_pay1/', views.order_pay1),
    # 正式支付
    re_path(r'pay_money/(\d*)', views.pay_money),
    # 待支付续付
    re_path(r'pay_money_1/(\d*)/(\d*)', views.pay_money_1),
    # path("")
    # ajax
    re_path(r'pay_money_2/', views.pay_money_2),
    # 查看待收货，收货后跳转评价
    path('all_order/', views.all_order),
    # 查看购物历史
    path('order_record/', views.order_record),
    # 评价
    re_path('my_evaluate/(\d*)$', views.my_evaluate),
]