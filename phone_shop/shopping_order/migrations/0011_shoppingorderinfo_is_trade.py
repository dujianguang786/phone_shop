# Generated by Django 3.2.5 on 2021-07-28 16:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shopping_order', '0010_auto_20210728_1522'),
    ]

    operations = [
        migrations.AddField(
            model_name='shoppingorderinfo',
            name='is_trade',
            field=models.IntegerField(choices=[(0, '未接收'), (1, '已接收')], default=0, verbose_name='是否收到货, 0 未接收 1 已接收'),
        ),
    ]
