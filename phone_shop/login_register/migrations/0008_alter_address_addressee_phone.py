# Generated by Django 3.2.5 on 2021-07-24 17:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('login_register', '0007_alter_address_is_default_address'),
    ]

    operations = [
        migrations.AlterField(
            model_name='address',
            name='addressee_phone',
            field=models.BigIntegerField(verbose_name='收件人电话'),
        ),
    ]
