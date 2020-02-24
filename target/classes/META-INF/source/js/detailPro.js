var max_pro = parseInt($('.soluong').value);

function add(){
    var pro_now = parseInt($('#number').html());
    if(pro_now >= max_pro){
        alert("bạn không thể mua quá số lượng sản phẩm");
    }
    else{
        pro_now += 1;
        $('#number').html(pro_now);
    }
}

function sub(){
    var pro_now = parseInt($('#number').html());
    if(pro_now <=1){
    	  $('#number1').val(pro_now);
        alert("Số lượng sản phẩm không thể nhỏ hơn 1");
    }
    else{
        pro_now = pro_now -  1;
        $('#number').html(pro_now);
    }
}