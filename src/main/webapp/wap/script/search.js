String.prototype.replaceAll = function (reallyDo, replaceWith, ignoreCase) {
    if (!RegExp.prototype.isPrototypeOf(reallyDo)) {
        return this.replace(new RegExp(reallyDo, (ignoreCase ? "gi": "g")), replaceWith);
    } else {
        return this.replace(reallyDo, replaceWith);
    }
};
function getSearchInfos(keyword) {
	$
			.ajax({
				type : 'POST',
				// 每次获取最新的数据即可
				url : '/view/msearch.do',
				dataType : 'json',
				data : 'keyword=' + keyword,
				cache : false,
				success : function(data) {
					var articles = data.articles;
					var result = '';
					for ( var i = 0; i < articles.length; i++) {
						var title = articles[i].title;
						var tempStr = "<font color='red'>" + keyword + "</font>";
						title = title.replaceAll(keyword,tempStr);
						result += '<li>'
								+ '<a class="ablock" href="/view/marticle.do?articleId='
								+ articles[i].id
								+ '">'
								+ ' <div class="artile_box">'
								+ ' <div class="artilebox_right">'
								+ '<a href="/view/marticle.do?articleId='
								+ articles[i].id
								+ '" class="atitle">'
								+ title
								+ '</a>'
								+ '<p class="passages">'
								+ articles[i].bref
								+ '......</p>'
								+ '<span>'
								+ '时间：'
								+ articles[i].createdate
								+ '</span>'
								+ '</div>'
								+ '<div class="artilebox_left">'
								+ ' <a href="/view/marticle.do?articleId='
								+ articles[i].id
								+ '"><img src="'
								+ articles[i].pic
								+ '" class="artimg"/></a>'
								+ '</div>' + '</div>' + '</a>' + '</li>';

					}
					$('.lists').html(result);

				},
				// 加载出错
				error : function(xhr, type) {
				}
			});
}
$(function() {
	$("#searchbtn").click(function(){
		var keyword = $("#searchwd").val();
		if(keyword.length ==0){
			
		}else{
			getSearchInfos(keyword);
		}
		
	});
	
	$("#toTop").click(function() {
		$("html,body").animate({
			scrollTop : "0px"
		}, 200);
	});

});
