# Generated by Django 3.2.5 on 2021-07-26 22:12

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('shopping_show', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Evaluate',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=30, verbose_name='评价用户名')),
                ('goods_name', models.CharField(max_length=40, verbose_name='手机名')),
                ('content1', models.CharField(max_length=500, verbose_name='评价内容')),
                ('goods', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shopping_show.goods', verbose_name='手机id(外键）')),
            ],
        ),
    ]