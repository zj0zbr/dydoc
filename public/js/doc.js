$(document).ready(function() {
	
	$('code, pre').addClass('prettyprint1');
	prettyPrint();
	
	
	$.getJSON('/doc.json', {}, function(data) {
		var ul = $('#sliderbar > ul');
		var arr = [];
		$.each(data, function(i, n) {
			arr.push([
					'<li>',
					'<a href=\"', n.url, '\">', n.title, '</a>',
					'</li>'
				].join('')
			)
		});
		
		ul.append(arr.join('\n'));
	});

})