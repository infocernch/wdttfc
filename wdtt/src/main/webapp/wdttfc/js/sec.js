	$(document).ready(
			function() {
				var delay = false;
				var currentPage = 1;
				var pageCount = $(".section").length;
				var swipe = document.getElementsByTagName('.section');

				$(document).on(
						'mousewheel DOMMouseScroll',
						function(event) {
							event.preventDefault();
							if (delay)
								return;
							delay = true;
							setTimeout(function() {
								delay = false
							}, 100)

							var wd = event.originalEvent.wheelDelta
									|| -event.originalEvent.detail;
							// 	        console.log(wd);

							if (wd < 0) {
								if (currentPage < pageCount) {
									currentPage++;
								}
							} else {
								if (1 < currentPage) {
									currentPage--;
								}
							}

							$('html,body').animate(
									{
										scrollTop : $('#sec' + currentPage)
												.offset().top
									}, 700);

							$('#tag' + currentPage).addClass('active');
							for (var i = 1; i <= pageCount; i++) {
								if (i != currentPage) {
									$('#tag' + i).removeClass('active');
								}
							}
						});
			});
