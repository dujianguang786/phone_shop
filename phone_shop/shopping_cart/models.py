from django.db import models
# from login_register.models import Address, UserInfo

# Create your models here.

class ShoppingCart(models.Model):
    """购物车"""
    id = models.AutoField(primary_key=True)
    # 手机名
    goodsid = models.CharField(max_length=50, null=False, verbose_name="手机名")
    # 手机颜色图片地址
    colorid = models.CharField(max_length=200, null=False, verbose_name="手机颜色图片地址")
    # 手机颜色
    color_name = models.CharField(max_length=50, default="无", null=False, verbose_name="手机颜色")
    # 手机价格
    price = models.IntegerField(null=False, default=0, verbose_name="手机价格")
    # 手机简介
    intro = models.CharField(max_length=300, default="手机", verbose_name="手机简介")
    # 手机id
    shop_id = models.IntegerField(null=False, default=0, verbose_name="手机id")
    # 手机存储容量
    capacityid = models.CharField(max_length=10, null=False, verbose_name="手机存储容量")
    # 购买件数
    buy_count = models.IntegerField(null=False, default=1, verbose_name="购买件数")
    # 是否删除1 删除 ， 0不删除
    is_default_address = models.IntegerField(null=False, default=0, verbose_name="是否删除1 删除 ， 0不删除")
    # 用户id
    userinfo = models.ForeignKey(to="login_register.UserInfo", on_delete=models.CASCADE, verbose_name="用户id")

    def __str__(self):
        return '{}'.format(self.goodsid)

    class Meta():
        verbose_name_plural = "购物车"