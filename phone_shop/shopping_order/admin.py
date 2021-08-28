from django.contrib import admin
from shopping_order import models

# Register your models here.

# 把数据库添加到后台管理系统

# 订单具体详情表
admin.site.register(models.ShoppingOrderDetail)
# 订单信息表
admin.site.register(models.ShoppingOrderInfo)


