from django.contrib import admin
from shopping_cart import models

# Register your models here.

# 把数据库添加到后台管理系统

# 购物车
admin.site.register(models.ShoppingCart)
