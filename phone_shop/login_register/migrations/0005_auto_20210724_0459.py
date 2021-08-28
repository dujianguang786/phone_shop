# Generated by Django 3.2.5 on 2021-07-23 20:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('login_register', '0004_auto_20210724_0213'),
    ]

    operations = [
        migrations.AlterField(
            model_name='address',
            name='is_default_address',
            field=models.IntegerField(choices=[(0, '非默认地址'), (1, '默认地址')], default=1, verbose_name='是否是默认地址0否，1是'),
        ),
        migrations.AlterField(
            model_name='userinfo',
            name='is_superuser',
            field=models.IntegerField(default=0, verbose_name='是否为管理员， 0普通用户， 1管理员'),
        ),
    ]