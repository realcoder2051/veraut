$(".redirect_to_show").click(function (e) {
	if (e.target.tagName !== "I") {
		window.location = e.currentTarget.dataset.url;
	}
})

$(document).ready(function(){
	console.log("dfsafdsfsad")
});
