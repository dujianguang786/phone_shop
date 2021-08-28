from django.db import models

# from login_register.models import Address, UserInfo


# Create your models here.


class ShoppingOrderDetail(models.Model):
    """订单具体详情表"""
    id = models.AutoField(primary_key=True)
    # 手机名
    goodsid = models.CharField(max_length=50, null=False, verbose_name="手机名")
    # 手机图片地址
    colorid = models.CharField(max_length=150, null=False, verbose_name="手机图片地址")
    # 手机存储容量
    capacityid = models.CharField(max_length=10, null=False, verbose_name="手机存储容量")
    # 购买件数
    buy_count = models.IntegerField(null=False, default=1, verbose_name="购买件数")
    # 手机颜色
    color_name = models.CharField(max_length=50, default="无", null=False, verbose_name="手机颜色")
    # 手机价格
    price = models.IntegerField(null=False, default=0, verbose_name="手机价格")
    # 单样手机总价
    price_all = models.IntegerField(null=False, default=0, verbose_name="单样手机总价")
    # 手机简介
    intro = models.CharField(max_length=300, default="手机", verbose_name="手机简介")
    # 手机id
    shop_id = models.IntegerField(null=False, default=0, verbose_name="手机id")
    # 该商品是否收货
    is_buy = (
        (0, "未接收"),
        (1, "已接收"),
    )
    is_trade = models.IntegerField(choices=is_buy, null=False, default=0, verbose_name="该商品是否收货, 0 未接收 1 已接收")
    # 是否删除订单具体商品信息，1 删除 ， 0不删除
    is_delete_shop = (
        (0, "不删除"),
        (1, "删除"),
    )
    delete_shop = models.IntegerField(choices=is_delete_shop, null=False, default=0, verbose_name="是否删除订单信息，1 删除 ， 0不删除")
    # 订单信息id
    shopping_order_info = models.ForeignKey(to="ShoppingOrderInfo", on_delete=models.CASCADE, verbose_name="订单信息id")

    def __str__(self):
        return '{}'.format(self.goodsid)

    class Meta():
        verbose_name_plural = "订单具体详情表"


class ShoppingOrderInfo(models.Model):
    """订单信息表"""
    id = models.AutoField(primary_key=True)
    # # 交易数量（个）
    # order_num = models.CharField(max_length=50, null=False, verbose_name="交易数量（个）")
    # 支付方式
    pay_way = (
        (0, '余额'),
        (1, '微信'),
        (2, '支付宝'),
    )
    payment = models.IntegerField(choices=pay_way, null=False, default=0, verbose_name="支付方式 0余额 1微信 2支付宝")
    # 支付状态
    pay_status = (
        (0, "待支付"),
        (1, "已支付"),
    )
    payment_static = models.IntegerField(choices=pay_status, default=0, null=False, verbose_name="支付状态 0待支付 1已支付")
    # 支付金额
    trade_money = models.IntegerField(null=False, default=0, verbose_name="支付金额")
    # 是否收到货, 1 已接收 2 未接收
    is_buy = (
        (0, "未接收"),
        (1, "已接收"),
    )
    is_trade = models.IntegerField(choices=is_buy, null=False, default=0, verbose_name="是否收到货, 0 未接收 1 已接收")
    # 是否删除订单信息，1 删除 ， 0不删除
    is_delete_order = (
        (0, "不删除"),
        (1, "删除"),
    )
    delete_order = models.IntegerField(choices=is_delete_order, null=False, default=0, verbose_name="是否删除订单信息，1 删除 ， 0不删除")
    # 用户id
    userinfo = models.ForeignKey(to="login_register.UserInfo", on_delete=models.CASCADE, verbose_name="用户id")
    # 地址id
    # address = models.ForeignKey(to="login_register.Address", on_delete=models.CASCADE, verbose_name="地址id")

    def __str__(self):
        return '支付方式{}， 支付状态{}'.format(self.payment, self.pay_status)

    class Meta():
        verbose_name_plural = "订单信息表"