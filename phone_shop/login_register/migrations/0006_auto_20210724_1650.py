# Generated by Django 3.2.5 on 2021-07-24 08:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('login_register', '0005_auto_20210724_0459'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userinfo',
            name='phone',
            field=models.CharField(blank=True, max_length=11, null=True, unique=True, verbose_name='手机号'),
        ),
        migrations.AlterField(
            model_name='userinfo',
            name='user_email',
            field=models.EmailField(blank=True, max_length=20, null=True, unique=True, verbose_name='邮箱'),
        ),
        migrations.AlterField(
            model_name='userinfo',
            name='user_privilege',
            field=models.IntegerField(default=1, verbose_name='是否活着, 0注销， 1在册'),
        ),
    ]
