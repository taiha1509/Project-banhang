$(document).ready(function(){
	var page = parseInt($("#page").val());
	if(page == 1){
		$("#pre").attr('disabled', true);
		$("#pre").css('color', 'gray');
	}
	else{
		$('#pre').removeAttr('disabled');
	}
	var maxPage = parseInt($("#maxPage").val());
	if(page == maxPage){
		$("#next").attr('disabled', true);
		$("#next").css('color', 'gray');
	}else{
		$('#next').removeAttr('disabled');
	}
	
	$('#so_luong_header').html(Shop.add.count);
});
var Shop = {

	// paging

	next : function(formId) {
		var nextPage = parseInt($("#page").val()) + 1;
		$("#page").val(nextPage);
		$("#" + formId).submit(); // Submit the form
		
	},
	prev : function(formId) {
		var nextPage = parseInt($("#page").val()) - 1;
		$("#page").val(nextPage);
		$("#" + formId).submit(); // Submit the form
		
	},
	

	// ham add san pham
	add : function() {
		var data = {};
		var count = parseInt($('#so_luong_header').html());
		count += parseInt($("#number").html());
		data["name"] = $('.name').html();
		data["image"] = $("#image").attr("src");
		data["price"] = $("#price").html();
		data["number"] = $("#number").html();
		data["id"] = $("#proId").html();
		$.ajax({
			url : "/api/add",
			type : "post",
			data : JSON.stringify(data),
			dataType : "json",
			contentType : "application/json",
			success : function(result) {
				$(document).ready(function() {
					$('.toast').toast('show');
				});
				$('#so_luong_header').html(count);
			}
		})
	},

	// ham thay doi trang thai cua post
	postStatus : function(postid) {
		var data = {};
		var id = "#post" + postid;
		data["id"] = postid;
		var r = confirm("Bạn có chắc chắn muốn thực hiện thao tác này");
		if (r == true) {
			$.ajax({
				url : "/api/poststatus",
				type : "post",
				data : JSON.stringify(data), // object json -> string json
				contentType : "application/json",
				dataType : "json",
				success : function(jsonResult) {
					$(id).html(jsonResult.data);
				}
			})
		} else {
		}

	},
	// ham thay doi trang thai cua product
	productStatus : function(proid) {
		var data = {};
		var id = "#product" + proid;
		data["id"] = proid;
		var r = confirm("Bạn có chắc chắn muốn thực hiện thao tác này");
		if (r == true) {
			$.ajax({
				url : "/api/productstatus",
				type : "post",
				data : JSON.stringify(data), // object json -> string json
				contentType : "application/json",
				dataType : "json",
				success : function(jsonResult) {
					$(id).html(jsonResult.data);
				}
			})
		} else {
		}

	},
	// ham thay doi trang thai cua contact
	contactStatus : function(contactid) {
		var data = {};
		var id = "#contact" + contactid;
		data["id"] = contactid;
		var r = confirm("Bạn có chắc chắn muốn thực hiện thao tác này");
		if (r == true) {
			$.ajax({
				url : "/api/contactstatus",
				type : "post",
				data : JSON.stringify(data), // object json -> string json
				contentType : "application/json",
				dataType : "json",
				success : function(jsonResult) {
					$(id).html(jsonResult.data);
				}
			})
		} else {
		}

	},
	// ham thay doi trang thai cua bill
	billStatus : function(billid) {
		var data = {};
		var id = "#bill" + billid;
		data["id"] = billid;
		var r = confirm("Bạn có chắc chắn muốn thực hiện thao tác này");
		if (r == true) {
			$.ajax({
				url : "/api/billstatus",
				type : "post",
				data : JSON.stringify(data), // object json -> string json
				contentType : "application/json",
				dataType : "json",
				success : function(jsonResult) {
					$(id).html(jsonResult.data);
				}
			})
		} else {
		}

	},

	// ham xoa san pham
	deleteProduct : function(productId) {
		var data = {};
		var id = "#product" + productId;
		var soluong = parseInt($(this).closest("tr").find(".number").html());
		var slsau = parseInt($("#so_luong_header").html());
		var sl = soluong - slsau;
		var r = confirm("Bạn có chắc chắn muốn xóa bài sản phẩm này không");
		if (r == true) {
			data["id"] = productId;
			$.ajax({
				url : "/api/deleteProduct",
				type : "post",
				data : JSON.stringify(data), // object json -> string json
				contentType : "application/json",
				dataType : "json",
				success : function(jsonResult) {
					$(id).closest("tr").remove();
					$("#so_luong_header").html(jsonResult.data);
				}
			})
		} else {
		}

	}

}