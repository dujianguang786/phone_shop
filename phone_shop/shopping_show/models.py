from django.db import models


# Create your models here.

class GoodsSpecies(models.Model):
    """手机品牌种类表"""
    id = models.AutoField(primary_key=True)
    # 手机品牌种类名称
    species_name = models.CharField(max_length=50, null=False, verbose_name="手机品牌种类名称")

    # def __str__(self):
    #     return '{}'.format(self.species_name)

    class Meta():
        verbose_name_plural = "手机品牌种类表"


class Goods(models.Model):
    """品牌下各种手机信息表"""
    id = models.AutoField(primary_key=True)
    # 手机名
    goods_name= models.CharField(max_length=40, null=False, verbose_name="手机名")
    # 手机简介
    goods_intro = models.CharField(max_length=300, verbose_name="手机简介")
    # 手机累计评价
    evalute_num = models.IntegerField(default=0, null=False, verbose_name="手机评价累计")
    # 手机品牌外键
    goods_species = models.ForeignKey(to="GoodsSpecies", on_delete=models.CASCADE, verbose_name="手机品牌外键")

    def __str__(self):
        return '{}'.format(self.goods_name)

    class Meta():
        verbose_name_plural = "手机信息表"


class Evaluate(models.Model):
    """手机评价"""
    id = models.AutoField(primary_key=True)
    # 评价用户名
    name = models.CharField(max_length=30, null=False, verbose_name="评价用户名")
    # 手机名
    goods_name = models.CharField(max_length=40, null=False, verbose_name="手机名")
    # 评价内容
    content1 = models.CharField(max_length=500, verbose_name="评价内容")
    # 手机id(外键）
    goods = models.ForeignKey(to="Goods", on_delete=models.CASCADE, verbose_name="手机id(外键）")

class GoodsDetails(models.Model):
    """手机详情信息表"""
    id = models.AutoField(primary_key=True)
    # 详情地址
    goods_details_addr = models.CharField(max_length=200,null=False, verbose_name="详情地址")
    # 手机id(外键）
    goods = models.ForeignKey(to="Goods", on_delete=models.CASCADE, verbose_name="手机id(外键）")

    # def __str__(self):
    #     return '{}'.format(self.goods_details_addr)

    class Meta():
        verbose_name_plural = "手机详情信息表"


class GoodsCapacity(models.Model):
    """手机储存容量表"""
    id = models.AutoField(primary_key=True)
    # 手机容量
    phone_capacity = models.CharField(max_length=20,null=False, verbose_name="手机容量")

    def __str__(self):
        return '{}'.format(self.phone_capacity)

    class Meta():
        verbose_name_plural = "手机储存容量表"


class GoodsColorsPicture(models.Model):
    """各种颜色手机图片"""
    id = models.AutoField(primary_key=True)
    # 手机具体款式名称
    phone_color_name = models.CharField(max_length=50,null=False, verbose_name="手机具体款式名称")
    # 手机图片地址
    phone_picture_addr = models.CharField(max_length=200,null=False, verbose_name="手机图片地址")
    # 状态 2上架，1下架， 0待上架
    goods_status = models.IntegerField(default=2, verbose_name="状态 2上架，1下架， 0待上架")

    def __str__(self):
        return '{}'.format(self.phone_color_name)

    class Meta():
        verbose_name_plural = "各种手机的具体款式表"


class GoodsRepertory(models.Model):
    """手机库存价格表"""
    id = models.AutoField(primary_key=True)
    # 库存总数量
    goods_num_all = models.IntegerField(null=False, verbose_name="库存总数量")
    # 手机价格
    goods_price = models.IntegerField(null=False, verbose_name="手机价格")
    # 库存剩余量
    goods_residue = models.IntegerField(null=False, verbose_name="库存剩余量")
    # 手机id外键
    goods = models.ForeignKey(to="Goods", on_delete=models.CASCADE, verbose_name="手机id(外键）")
    # 手机容量id外键
    goods_capacity = models.ForeignKey(to="GoodsCapacity", on_delete=models.CASCADE, verbose_name="手机容量id(外键）")
    # 手机颜色id外键
    goods_colors_picture = models.ForeignKey(to='GoodsColorsPicture', on_delete=models.CASCADE, verbose_name="手机颜色id外键")

    def __str__(self):
        return '手机{}，剩余{}，价格￥{}，颜色{}'.format(self.goods.goods_name, self.goods_residue, self.goods_price, self.goods_colors_picture)

    class Meta():
        verbose_name_plural = "手机库存价格表"


class SlideshowPicture(models.Model):
    """轮播图表"""
    id = models.AutoField(primary_key=True)
    # 图片地址
    goods_picture_addr = models.CharField(max_length=200,null=False, verbose_name="图片地址")

    class Meta():
        verbose_name_plural = "轮播图表"







