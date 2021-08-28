from django.utils.deprecation import MiddlewareMixin


class MD1(MiddlewareMixin):
    def process_request(self, request):
        print('这是MD1中的process_request方法')


class MD2(MiddlewareMixin):
    def process_request(self, request):
        print('这是MD2中的process_request方法')
