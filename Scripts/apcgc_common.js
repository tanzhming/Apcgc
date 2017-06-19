
function jsTimeToString(time) {
    var year = time.getFullYear();
    var month = time.getMonth() + 1;
    var day = time.getDate();
    var hour = time.getHours();
    var minute = time.getMinutes();
    var second = time.getSeconds();
    if (month < 10) {
        month = "0" + month;
    }
    if (day < 10) {
        day = "0" + day;
    }
    if (hour < 10) {
        hour = "0" + hour;
    }
    if (minute < 10) {
        minute = "0" + minute;
    }
    if (second < 10) {
        second = "0" + second;
    }
    var strTime = month + "/" + day + "/" + year + " " + hour + ":" + minute + ":" + second;
    return strTime;
}
function ncpEndtime() {
    $(".ncptime").each(function () {
        var nowtime = new Date($(this).attr("starttime")).getTime();
        var endtime = new Date($(this).attr("endtime")).getTime();
        var youtime = endtime - nowtime;
        var seconds = youtime / 1000;
        var minutes = Math.floor(seconds / 60);
        var hours = Math.floor(minutes / 60);
        var days = Math.floor(hours / 24);
        var CDay = days;
        var CHour = hours % 24;
        var CMinute = minutes % 60;
        var CSecond = Math.floor(seconds % 60);
        var now = new Date($(this).attr("starttime"))
        now.setTime(now.getTime() + 1000);
        $(this).attr("starttime", jsTimeToString(now));
        if (endtime <= nowtime) {
            $(this).html("0分0秒");
            window.location.reload();
        } else {
            if (days > 0) {
                $(this).html(days + "天" + CHour + "小时" + CMinute + "分");
            }
            else {
                if (CHour > 0) {
                    $(this).html(CHour + "小时" + CMinute + "分" + CSecond + "秒");
                }
                else {
                    if (CMinute > 0) {
                        $(this).html(CMinute + "分" + CSecond + "秒");
                    }
                    else {
                        $(this).html(CSecond + "秒");
                    }
                }
            }
        }
    });
    setTimeout("ncpEndtime()", 1000);
};

function ncp_nsbEndtime() {
    $(".ncp_nsbtime").each(function () {
        var nowtime = new Date($(this).attr("starttime")).getTime();
        var endtime = new Date($(this).attr("endtime")).getTime();
        var youtime = endtime - nowtime;
        var seconds = youtime / 1000;
        var minutes = Math.floor(seconds / 60);
        var hours = Math.floor(minutes / 60);
        var days = Math.floor(hours / 24);
        var CDay = days;
        var CHour = hours % 24;
        var CMinute = minutes % 60;
        var CSecond = Math.floor(seconds % 60);
        var now = new Date($(this).attr("starttime"))
        now.setTime(now.getTime() + 1000);
        $(this).attr("starttime", jsTimeToString(now));
        if (endtime <= nowtime) {
            $(this).html("<em>0</em>分<em>0</em>秒");
            window.location.reload();
        } else {
            if (days > 0) {
                $(this).html("<em>" + days + "</em>天<em>" + CHour + "</em>小时<em>" + CMinute + "</em>分<em>" + CSecond + "</em>秒");
            }
            else {
                if (CHour > 0) {
                    $(this).html("<em>" + CHour + "</em>小时<em>" + CMinute + "</em>分<em>" + CSecond + "</em>秒");
                }
                else {
                    if (CMinute > 0) {
                        $(this).html("<em>" + CMinute + "</em>分<em>" + CSecond + "</em>秒");
                    }
                    else {
                        $(this).html("<em>" + CSecond + "</em>秒");
                    }
                }
            }
        }
    });
    setTimeout("ncp_nsbEndtime()", 1000);
};

$(function () {
    ncpEndtime();
    ncp_nsbEndtime();
});