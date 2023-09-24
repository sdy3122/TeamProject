		// 주민번호 앞자리 6자 다입력하면 바로 뒷자리입력하게 커서변경됨
		function moveNext(obj, length, nextObj) {
			if (obj.value.length == length) {
				nextObj.focus();
			}
		}
		function formCheck(obj) {
			if (obj.j1.value.trim().length !== 6) {
				alert('주민등록번호 앞자리는 6자리');
				obj.j1.value = "";
				obj.j1.focus();
				return false;
			}
			// NaN = Not a Number, Number()는 인수를 숫자로변경
			if (isNaN(Number(obj.j1.value))) {
				alert('주민등록번호 앞자리는 숫자만 입력');
				obj.j1.value = "";
				obj.j1.focus();
				return false;
			}
			if (obj.j2.value.trim().length !== 7) {
				alert('주민등록번호 뒷자리는 7자리');
				obj.j2.value = "";
				obj.j2.focus();
				return false;
			}
			if (isNaN(Number(obj.j2.value))) {
				alert('주민번호 뒷자리는 숫자만 입력');
				obj.j2.value = "";
				obj.j2.focus();
				return false;
			}

			// 주민번호 유효성검사
			rnCheck = obj.j1.value.trim() + obj.j2.value.trim();
			sum = 0;
			for (i = 0; i < 12; i++) {
				sum += rnCheck.charAt(i) * (i < 8 ? i + 2 : i - 6);
			}
			result = (11 - sum % 11);
			if (result != jumin.charAt(12)) {
				alert("주민등록 번호가 올바르지 않습니다");
				obj.j1.value = "";
				obj.j2.value = "";
				obj.j1.focus();
				return false;
			}
			return true;
		}

function hideMenu() {
	document.querySelector('#registToggle').style.display = "none";
	document.querySelector('#deleteToggle').style.display = "none";
	document.querySelector('#searchToggle').style.display = "none";
	document.querySelector('#editToggle').style.display = "none";
	document.querySelector('#listToggle').style.display = "none";
}

function checkPw() {
			var pw = document.getElementById('registPW').value;
			if (pw.length < 4) {
				window.alert('비밀번호는 4글자이상으로 작성해주세요');
				document.getElementById('registPW').value = '';
			}
			if (pw != '' && document.getElementById('checkPW').value != '') {
				if (pw == document.getElementById('checkPW').value) {
					window.alert('비밀번호 일치');
				} else {
					window.alert('비밀번호 불일치');
					document.getElementById('checkPW').value = '';
				}
			}
		}

(function($) {
	// 추가 
	$("#registHaksa").click(function() {
		hideMenu();
		$("#registToggle").fadeToggle();
	});
	$("#deleteHaksa").click(function() {
		hideMenu();
		$("#deleteToggle").fadeToggle();
	});
	$("#searchHaksa").click(function() {
		hideMenu();
		$("#searchToggle").fadeToggle();
	});
	$("#editHaksa").click(function() {
		hideMenu();
		$("#editToggle").fadeToggle();
	});
	$("#listHaksa").click(function() {
		hideMenu();
		$("#listToggle").fadeToggle();
	});
	// 기존
	var $window = $(window),
		$body = $('body'),
		$wrapper = $('#wrapper'),
		$header = $('#header'),
		$footer = $('#footer'),
		$main = $('#main'),
		$main_articles = $main.children('article');

	// Breakpoints.
	breakpoints({
		xlarge: ['1281px', '1680px'],
		large: ['981px', '1280px'],
		medium: ['737px', '980px'],
		small: ['481px', '736px'],
		xsmall: ['361px', '480px'],
		xxsmall: [null, '360px']
	});

	// Play initial animations on page load.
	$window.on('load', function() {
		window.setTimeout(function() {
			$body.removeClass('is-preload');
		}, 100);
	});

	// Fix: Flexbox min-height bug on IE.
	if (browser.name == 'ie') {

		var flexboxFixTimeoutId;

		$window.on('resize.flexbox-fix', function() {

			clearTimeout(flexboxFixTimeoutId);

			flexboxFixTimeoutId = setTimeout(function() {

				if ($wrapper.prop('scrollHeight') > $window.height())
					$wrapper.css('height', 'auto');
				else
					$wrapper.css('height', '100vh');

			}, 250);

		}).triggerHandler('resize.flexbox-fix');

	}

	// Nav.
	var $nav = $header.children('nav'),
		$nav_li = $nav.find('li');

	// Add "middle" alignment classes if we're dealing with an even number of items.
	if ($nav_li.length % 2 == 0) {

		$nav.addClass('use-middle');
		$nav_li.eq(($nav_li.length / 2)).addClass('is-middle');

	}

	// Main.
	var delay = 325,
		locked = false;

	// Methods.
	$main._show = function(id, initial) {

		var $article = $main_articles.filter('#' + id);

		// No such article? Bail.
		if ($article.length == 0)
			return;

		// Handle lock.

		// Already locked? Speed through "show" steps w/o delays.
		if (locked || (typeof initial != 'undefined' && initial === true)) {

			// Mark as switching.
			$body.addClass('is-switching');

			// Mark as visible.
			$body.addClass('is-article-visible');

			// Deactivate all articles (just in case one's already active).
			$main_articles.removeClass('active');

			// Hide header, footer.
			$header.hide();
			$footer.hide();

			// Show main, article.
			$main.show();
			$article.show();

			// Activate article.
			$article.addClass('active');

			// Unlock.
			locked = false;

			// Unmark as switching.
			setTimeout(function() {
				$body.removeClass('is-switching');
			}, (initial ? 1000 : 0));

			return;

		}

		// Lock.
		locked = true;

		// Article already visible? Just swap articles.
		if ($body.hasClass('is-article-visible')) {

			// Deactivate current article.
			var $currentArticle = $main_articles.filter('.active');

			$currentArticle.removeClass('active');

			// Show article.
			setTimeout(function() {

				// Hide current article.
				$currentArticle.hide();

				// Show article.
				$article.show();

				// Activate article.
				setTimeout(function() {

					$article.addClass('active');

					// Window stuff.
					$window
						.scrollTop(0)
						.triggerHandler('resize.flexbox-fix');

					// Unlock.
					setTimeout(function() {
						locked = false;
					}, delay);

				}, 25);

			}, delay);

		}

		// Otherwise, handle as normal.
		else {

			// Mark as visible.
			$body
				.addClass('is-article-visible');

			// Show article.
			setTimeout(function() {

				// Hide header, footer.
				$header.hide();
				$footer.hide();

				// Show main, article.
				$main.show();
				$article.show();

				// Activate article.
				setTimeout(function() {

					$article.addClass('active');

					// Window stuff.
					$window
						.scrollTop(0)
						.triggerHandler('resize.flexbox-fix');

					// Unlock.
					setTimeout(function() {
						locked = false;
					}, delay);

				}, 25);

			}, delay);

		}

	};

	$main._hide = function(addState) {

		var $article = $main_articles.filter('.active');

		// Article not visible? Bail.
		if (!$body.hasClass('is-article-visible'))
			return;

		// Add state?
		if (typeof addState != 'undefined'
			&& addState === true)
			history.pushState(null, null, '#');

		// Handle lock.

		// Already locked? Speed through "hide" steps w/o delays.
		if (locked) {

			// Mark as switching.
			$body.addClass('is-switching');

			// Deactivate article.
			$article.removeClass('active');

			// Hide article, main.
			$article.hide();
			$main.hide();

			// Show footer, header.
			$footer.show();
			$header.show();

			// Unmark as visible.
			$body.removeClass('is-article-visible');

			// Unlock.
			locked = false;

			// Unmark as switching.
			$body.removeClass('is-switching');

			// Window stuff.
			$window
				.scrollTop(0)
				.triggerHandler('resize.flexbox-fix');

			return;

		}

		// Lock.
		locked = true;

		// Deactivate article.
		$article.removeClass('active');

		// Hide article.
		setTimeout(function() {

			// Hide article, main.
			$article.hide();
			$main.hide();

			// Show footer, header.
			$footer.show();
			$header.show();

			// Unmark as visible.
			setTimeout(function() {

				$body.removeClass('is-article-visible');

				// Window stuff.
				$window
					.scrollTop(0)
					.triggerHandler('resize.flexbox-fix');

				// Unlock.
				setTimeout(function() {
					locked = false;
				}, delay);

			}, 25);

		}, delay);


	};

	// Articles.
	$main_articles.each(function() {

		var $this = $(this);

		// Close.
		$('<div class="close">Close</div>')
			.appendTo($this)
			.on('click', function() {
				location.hash = '';
				hideMenu();
			});

		// Prevent clicks from inside article from bubbling.
		$this.on('click', function(event) {
			event.stopPropagation();
		});

	});

	// Events.
	$body.on('click', function(event) {

		// Article visible? Hide.
		if ($body.hasClass('is-article-visible'))
			$main._hide(true);

	});

	$window.on('keyup', function(event) {

		switch (event.keyCode) {

			case 27:

				// Article visible? Hide.
				if ($body.hasClass('is-article-visible'))
					$main._hide(true);

				break;

			default:
				break;

		}

	});

	$window.on('hashchange', function(event) {

		// Empty hash?
		if (location.hash == ''
			|| location.hash == '#') {

			// Prevent default.
			event.preventDefault();
			event.stopPropagation();

			// Hide.
			$main._hide();

		}

		// Otherwise, check for a matching article.
		else if ($main_articles.filter(location.hash).length > 0) {

			// Prevent default.
			event.preventDefault();
			event.stopPropagation();

			// Show article.
			$main._show(location.hash.substr(1));

		}

	});

	// Scroll restoration.
	// This prevents the page from scrolling back to the top on a hashchange.
	if ('scrollRestoration' in history)
		history.scrollRestoration = 'manual';
	else {

		var oldScrollPos = 0,
			scrollPos = 0,
			$htmlbody = $('html,body');

		$window
			.on('scroll', function() {

				oldScrollPos = scrollPos;
				scrollPos = $htmlbody.scrollTop();

			})
			.on('hashchange', function() {
				$window.scrollTop(oldScrollPos);
			});

	}

	// Initialize.

	// Hide main, articles.
	$main.hide();
	$main_articles.hide();

	// Initial article.
	if (location.hash != ''
		&& location.hash != '#')
		$window.on('load', function() {
			$main._show(location.hash.substr(1), true);
		});

})(jQuery);