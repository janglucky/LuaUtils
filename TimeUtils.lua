--[[ 字符串时间转成时间戳
@timeString: 字符串时间 ,时间格式必须为 2018-08-07 10:43:33
@return: 返回时间戳(int,单位：秒)
    例:  print (stringToTime('2020-08-4 9:55:00'))
--]]
stringToTime = function(timeString)
    if type(timeString) ~= 'string' then error('string2time: timeString is not a string') return 0 end
    local fun = string.gmatch( timeString, "%d+")
    local y = fun() or 0
    if y == 0 then error('timeString is a invalid time string') return 0 end
    local m = fun() or 0
    if m == 0 then error('timeString is a invalid time string') return 0 end
    local d = fun() or 0
    if d == 0 then error('timeString is a invalid time string') return 0 end
    local H = fun() or 0
    if H == 0 then error('timeString is a invalid time string') return 0 end
    local M = fun() or 0
    if M == 0 then error('timeString is a invalid time string') return 0 end
    local S = fun() or 0
    if S == 0 then error('timeString is a invalid time string') return 0 end
    return os.time({year=y, month=m, day=d, hour=H,min=M,sec=S})
end

stringToTime('2020-08-4 9:55:00')

--[[ 过去时间格式化
@timeStrap: 时间戳
@return: timeStrap与当前时间相隔多长时间
    例:  print (string2time('2018-08-07 10:43:33'))
--]]
formationPastTime = function(timeStrap)
    local seconds = os.time() - timeStrap

    local dataString = ""
    if seconds < 60 then
        dataString = "刚刚"
    elseif seconds < 60*60 then
        dataString = tostring(math.floor(seconds/60)) .. "分钟前"
    elseif seconds < 60*60*24 then
        dataString = tostring(math.floor(seconds/60/60)) .. "小时前"
    elseif  seconds < 60*60*24*30 then
        dataString = tostring(math.floor(seconds/60/60/24)) .. "天前"
    elseif  seconds < 60*60*24*30*12 then
        dataString = tostring(math.floor(seconds/60/60/24/30)) .. "个月前"
    elseif  seconds < 60*60*24*30*30*12 then
        dataString = os.date("%Y-%m-%d %H:%M:%S",timeStrap)
    end
    return dataString

end



print(formationPastTime(stringToTime('2018-03-01 10:10:33')))
