from django.contrib import admin
from shopping_show import models

# Register your models here.

# 商品种类表
admin.site.register(models.GoodsSpecies)
# 手机信息表
admin.site.register(models.Goods)
# 手机详情信息表
admin.site.register(models.GoodsDetails)
# 手机储存容量表
admin.site.register(models.GoodsCapacity)
# 各种颜色手机图片表
admin.site.register(models.GoodsColorsPicture)
# 手机库存价格表
admin.site.register(models.GoodsRepertory)
# 轮播图表
admin.site.register(models.SlideshowPicture)
# 用户评价
admin.site.register(models.Evaluate)