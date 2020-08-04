-- 获取请求方法 GET、POST 
local request_method = ngx.var.request_method
print(request_method)