<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,dao.*,model.*" %>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Hotel</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="assets/css/help-center.css" />
    <link rel="stylesheet" type="text/css" href="css/dining.css" />
    <script>
        window.onload = function() {
            var aData = [{
                "imgUrl": "assets/img/Chart/03-car-01.png",
                "proName": " 宫保鸡丁 ",
                "proPrice": "29",
                "proComm": "1"
            },
                {
                    "imgUrl": "assets/img/Chart/03-car-02.png",
                    "proName": " 糖醋排骨 ",
                    "proPrice": "39",
                    "proComm": "9.7"
                },
                {
                    "imgUrl": "assets/img/Chart/03-car-03.png",
                    "proName": " 火山牛肉 ",
                    "proPrice": "65",
                    "proComm": "1.3"
                },
                {
                    "imgUrl": "assets/img/Chart/03-car-04.png",
                    "proName": " 泡椒牛蛙 ",
                    "proPrice": "149",
                    "proComm": "1.1"
                },
                {
                    "imgUrl": "assets/img/Chart/03-car-05.png",
                    "proName": "蔬菜沙拉  ",
                    "proPrice": "10",
                    "proComm": "0.3"
                },
                {
                    "imgUrl": "assets/img/Chart/03-car-06.png",
                    "proName": " 酸菜鱼  ",
                    "proPrice": "99",
                    "proComm": "3.3"
                },
                {
                    "imgUrl": "assets/img/Chart/03-car-07.png",
                    "proName": " 黄焖鸡",
                    "proPrice": "50",
                    "proComm": "1.2"
                },
                {
                    "imgUrl": "assets/img/Chart/03-car-08.png",
                    "proName": "  酸辣土豆丝 ",
                    "proPrice": "45",
                    "proComm": "0.6"
                },
                {
                    "imgUrl": "assets/img/Chart/03-car-09.png",
                    "proName": "  小米糕  ",
                    "proPrice": "7",
                    "proComm": "0.3"
                },
                {
                    "imgUrl": "assets/img/Chart/03-car-10.png",
                    "proName": " 长寿面 ",
                    "proPrice": "19",
                    "proComm": "7.2"
                }
            ];
            var oBox = document.getElementById("box");
            var oCar = document.getElementById("car");
            var oUl = document.getElementsByTagName("ul")[0];

            for (var i = 0; i < aData.length; i++) {
                var oLi = document.createElement("li");
                var data = aData[i];

                oLi.innerHTML += '<div class="pro_img"><img src="' + data["imgUrl"] + '" width="150" height="150"></div>';
                oLi.innerHTML += '<h3 class="pro_name"><a href="#">' + data["proName"] + '</a></h3>';
                oLi.innerHTML += '<p class="pro_price">' + data["proPrice"] + '元</p>';
                oLi.innerHTML += '<p class="pro_rank">' + data["proComm"] + '万人好评</p>';
                oLi.innerHTML += '<div class="add_btn">加入购物车</div>';
                oUl.appendChild(oLi);

            }
            var aBtn = getClass(oBox, "add_btn");//获取box下的所有添加购物车按钮
            var number = 0;//初始化商品数量
            for (var i = 0; i < aBtn.length; i++) {
                number++;
                aBtn[i].index = i;
                aBtn[i].onclick = function() {
                    var oDiv = document.createElement("div");
                    var data = aData[this.index];
                    oDiv.className = "row hid";
                    oDiv.innerHTML += '<div class="check left"> <i class="i_check" id="i_check" onclick="i_check()" >√</i></div>';
                    oDiv.innerHTML += '<div class="img left"><img src="' + data["imgUrl"] + '" width="80" height="80"></div>';
                    oDiv.innerHTML += '<div class="name left"><span>' + data["proName"] + '</span></div>';
                    oDiv.innerHTML += '<div class="price left"><span>' + data["proPrice"] + '元</span></div>';
                    oDiv.innerHTML +=' <div class="item_count_i"><div class="num_count"><div class="count_d">-</div><div class="c_num">1</div><div class="count_i">+</div></div> </div>'
                    oDiv.innerHTML += '<div class="subtotal left"><span>' + data["proPrice"] + '元</span></div>'
                    oDiv.innerHTML += '<div class="ctrl left"><a href="javascript:;">×</a></div>';
                    oCar.appendChild(oDiv);
                    var flag = true;
                    var check = oDiv.firstChild.getElementsByTagName("i")[0];
                    check.onclick = function() {
                        // console.log(check.className);
                        if (check.className == "i_check i_acity") {
                            check.classList.remove("i_acity");

                        } else {
                            check.classList.add("i_acity");
                        }
                        getAmount();
                    }
                    var delBtn = oDiv.lastChild.getElementsByTagName("a")[0];
                    delBtn.onclick = function() {
                        var result = confirm("确定删除吗?");
                        if (result) {
                            oCar.removeChild(oDiv);
                            number--;
                            getAmount();
                        }
                    }
                    var i_btn = document.getElementsByClassName("count_i");
                    for (var k = 0; k < i_btn.length; k++) {
                        i_btn[k].onclick = function() {
                            bt = this;
                            //获取小计节点
                            at = this.parentElement.parentElement.nextElementSibling;
                            //获取单价节点
                            pt = this.parentElement.parentElement.previousElementSibling;
                            //获取数量值
                            node = bt.parentNode.childNodes[1];
                            console.log(node);
                            num = node.innerText;
                            num = parseInt(num);
                            num++;
                            node.innerText = num;
                            //获取单价
                            price = pt.innerText;
                            price = price.substring(0, price.length - 1);
                            //计算小计值
                            at.innerText = price * num + "元";
                            //计算总计值
                            getAmount();
                        }
                    }
                    //获取所有的数量减号按钮
                    var d_btn = document.getElementsByClassName("count_d");
                    for (k = 0; k < i_btn.length; k++) {
                        d_btn[k].onclick = function() {
                            bt = this;
                            //获取小计节点
                            at = this.parentElement.parentElement.nextElementSibling;
                            //获取单价节点
                            pt = this.parentElement.parentElement.previousElementSibling;
                            //获取c_num节点
                            node = bt.parentNode.childNodes[1];
                            num = node.innerText;
                            num = parseInt(num);
                            if (num > 1) {
                                num--;
                            }
                            node.innerText = num;
                            //获取单价
                            price = pt.innerText;
                            price = price.substring(0, price.length - 1);
                            //计算小计值
                            at.innerText = price * num + "元";
                            //计算总计值
                            getAmount();
                        }
                    }

                    delBtn.onclick = function() {
                        var result = confirm("确定删除吗?");
                        if (result) {
                            oCar.removeChild(oDiv);
                            number--;
                            getAmount();
                        }
                    }

                }
            }

        }

        function getClass(oBox, tagname) {
            var aTag = oBox.getElementsByTagName("*");
            var aBox = [];
            for (var i = 0; i < aTag.length; i++) {
                if (aTag[i].className == tagname) {
                    aBox.push(aTag[i]);
                }
            }
            return aBox;
        }


        var index = false;
        function checkAll() {
            var choose = document.getElementById("car").getElementsByTagName("i");
            // console.log(choose);
            if (choose.length != 1) {
                for (i = 1; i < choose.length; i++) {
                    if (!index) {
                        choose[0].classList.add("i_acity2")
                        choose[i].classList.add("i_acity");
                    } else {
                        choose[i].classList.remove("i_acity");
                        choose[0].classList.remove("i_acity2")
                    }
                }
                index = !index;
            }
            getAmount();
        }

        //进行价格合计
        function getAmount() {
            // console.log(ys);
            ns = document.getElementsByClassName("i_acity");
            console.log(ns);
            sum = 0;
            //选中框
            document.getElementById("price_num").innerText = sum;
            for (y = 0; y < ns.length; y++) {
                //小计
                amount_info = ns[y].parentElement.parentElement.lastElementChild.previousElementSibling;
                num = parseInt(amount_info.innerText);
                sum += num;
                print(sum);
                document.getElementById("price_num").innerText = sum;
            }
        }
    </script>
</head>
<body>
<div class="header">
    <div class="container">
        <div class="header-logo">
            <a class="logo ir" title="虹软官网">ArcsoftHotel</a>
        </div>
        <div class="header-title" id="J_miniHeaderTitle">
            <h2 style="font-size: 30px;">我的菜单</h2>
        </div>
         <div class="topbar-info" id="J_userInfo">
        <% 
        	User u = (User)session.getAttribute("user"); 
        	if(u==null||"".equals(u)){%>  
            <a class="link" href="User_Login.jsp">登录</a><span class="sep">|</span><a class="link" href="User_Register.jsp">注册</a>
        <% }else{ %>     
        	<p>欢迎您！<%=u.getUserId() %></p>
        <%} %>
        </div>
       </div>
</div>


<div id="car" class="car">

    <div class="head_row hid">
        <div class="check left"> <i onclick="checkAll()">√</i></div>
        <div class="img left">&nbsp;&nbsp;全选</div>
        <div class="name left">商品名称</div>
        <div class="price left">单价</div>
        <div class="number left">数量</div>
        <div class="subtotal left">小计</div>
        <div class="ctrl left">操作</div>
    </div>


</div>
<div id="sum_area">
    <div id="pay" onClick="alertTips()">去结算</div>
    <script>
        function alertTips(){
            alert('您是否确定结算？');
            var amount = document.getElementById("price_num").innerText;
            window.location.href="consume?amount="+amount;
        }
    </script>
    <div id="pay_amout">合计：<span id="price_num">0</span>元</div>
</div>



<div id="box">
    <h2 class="box_head"><span>买购物车中商品的人还买了</span></h2>
    <ul>
    </ul>
</div>
</body>
</html>
