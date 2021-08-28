from django.contrib import admin
from login_register import models

# Register your models here.

# 把数据库添加到后台管理系统
admin.site.register(models.UserInfo)
admin.site.register(models.Address)
admin.site.register(models.RecordTable)
