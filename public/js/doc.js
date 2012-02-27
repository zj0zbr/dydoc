$(document).ready(function() {
	
	$('code, pre').addClass('prettyprint1');
	prettyPrint();

	var pathname = window.location.pathname;

	$.getJSON('/doc.json', {}, function(data) {
		var ul = $('#sliderbar > ul');
		var arr = [];

		$.each(data, function(i, n) {
			var cls = pathname == n.url ? " class=active " : "";

			arr.push([
					'<li>',
					'<a href=\"', n.url, '\"', cls ,'>', n.title, '</a>',
					'</li>'
				].join('')
			)
		});
		
		ul.append(arr.join('\n'));
	});


})