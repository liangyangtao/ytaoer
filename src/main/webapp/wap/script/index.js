var pageNo = 0;

function getArticleInfos() {
	if (pageNo <= 0) {
		pageNo = 1;
	}
	$
			.ajax({
				type : 'POST',
				// 每次获取最新的数据即可
				url : '/view/mindex.do',
				dataType : 'json',
				data : 'pageNo=' + pageNo + '&pageSize=10',
				cache : false,
				success : function(data) {
					var articles = data.articles;
					pageNo = data.pageNo;
					var result = '';
					for ( var i = 0; i < articles.length; i++) {
						result += '<li>'
								+ '<a class="ablock" href="/view/marticle.do?articleId='
								+ articles[i].id
								+ '">'
								+ ' <div class="artile_box">'
								+ ' <div class="artilebox_right">'
								+ '<a href="/view/marticle.do?articleId='
								+ articles[i].id
								+ '" class="atitle">'
								+ articles[i].title
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
					$('.lists').append(result);

				},
				// 加载出错
				error : function(xhr, type) {
				}
			});
}

$(function() {

	var mySwiper = new Swiper('.swiper-container', {
		direction : "horizontal",
		loop : true,
		autoplay : 3000,
		keyboardControl : true,
		// 如果需要分页器
		pagination : '.swiper-pagination'
	});
	getArticleInfos();
	// 滚动加载
	function lowEnough() {
		var pageHeight = Math.max(document.body.scrollHeight,
				document.body.offsetHeight);
		var viewportHeight = window.innerHeight
				|| document.documentElement.clientHeight
				|| document.body.clientHeight || 0;
		var scrollHeight = window.pageYOffset
				|| document.documentElement.scrollTop
				|| document.body.scrollTop || 0;
		return pageHeight - viewportHeight - scrollHeight < 10;
	}
	$(window).scroll(function() {
		if (lowEnough()) {
			pageNo++;
			getArticleInfos();
		}
	});
	
	/* 回到顶部 */
	/*$(window).scroll(
			function() {
				var scrollt = document.documentElement.scrollTop
						+ document.body.scrollTop;
				if (scrollt > 200) {
					$("#toTop").fadeIn(400);
				} else {
					$("#toTop").stop().fadeOut(400);
				}
			});*/
	$("#toTop").click(function() {
		$("html,body").animate({
			scrollTop : "0px"
		}, 200);
	});

	/* 回到顶部结束 */

});
