from django.db import models

# Create your models here.

class UserInfo(models.Model):
    """用户表"""
    id = models.AutoField(primary_key=True)
    # 用户名
    user_name = models.CharField(max_length=30, null=False, verbose_name="用户名")
    # 密码
    user_password = models.CharField(max_length=20, null=False, verbose_name="密码")

    # 余额(单位:￥)
    my_money = models.IntegerField(default=0, null=True, blank=True, verbose_name="余额(单位:￥)")
    # 邮箱
    user_email = models.EmailField(max_length=20,null=True, blank=True, unique=True, verbose_name="邮箱")
    # 手机号
    phone = models.CharField(max_length=11, null=True, blank=True, unique=True, verbose_name="手机号")
    # 是否为管理员， 0普通用户， 1管理员
    is_superuser = models.IntegerField(default=0, null=False, verbose_name="是否为管理员， 0普通用户， 1管理员")
    # 是否活着, 0注销， 1在册
    user_privilege = models.IntegerField(default=1, null=False, verbose_name="是否活着, 0注销， 1在册")

    def __str__(self):
        return '{}是否在册：{}'.format(self.user_name, self.user_privilege)

    class Meta():
        verbose_name_plural = "用户信息表"

class Address(models.Model):
    """地址类"""
    id = models.AutoField(primary_key=True)
    # 收件人地址
    addressee_address = models.CharField(max_length=20, null=False, verbose_name="收件人地址")
    # 地址邮编
    address_postcode = models.IntegerField(null=False, verbose_name="地址邮编")
    # 收件人姓名
    addressee_name = models.CharField(max_length=20,null=False, verbose_name="收件人姓名")
    # 收件人电话
    addressee_phone = models.BigIntegerField(null=False, verbose_name="收件人电话")
    # 是否是默认地址0否，1是
    addr_choice = (
        (0, '非默认地址'),
        (1, '默认地址'),
    )
    is_default_address = models.IntegerField(null=False, choices=addr_choice, default=0, verbose_name="是否是默认地址0否，1是")
    # 用户id
    userinfo = models.ForeignKey(to="UserInfo", on_delete=models.CASCADE, verbose_name="用户id")

    def __str__(self):
        return '{}'.format(self.addressee_address)

    class Meta():
        verbose_name_plural = "收件人地址信息表"


class RecordTable(models.Model):
    """流水表"""
    id = models.AutoField(primary_key=True)
    # 本次花费前的余额
    previous_money = models.IntegerField(null=False, verbose_name="本次花费前的余额")
    # +充值或-消费
    recharge_or_consume = models.CharField(max_length=20, null=False, verbose_name="+充值或-消费")
    # 本次花费后的余额
    next_money = models.IntegerField(null=False, verbose_name="本次花费后的余额")
    # 是否删除花费记录 0否，1是
    is_delete_record = models.IntegerField(null=False, default=0, verbose_name="是否删除花费记录 0否，1是")
    # 用户id
    userinfo = models.ForeignKey(to="UserInfo", on_delete=models.CASCADE, verbose_name="用户id")

    def __str__(self):
        return '{}'.format(self.recharge_or_consume)

    class Meta():
        verbose_name_plural = "流水表"