var hash = {
	"/users/new": "new-user",
	"/users": "view-user",
	"/users/show ": "view-user",
	"/users/:id/edit": "view-user",
	"/contact_numbers/:id": "view-general",
	"/contact_numbers/new": "view-general",
	"/addresses/:id": "view-general",
	"/addresses/new": "view-general",
	"/generals": "view-general",
	"/companies": "view-company",
	"/companies/new": "view-company",
	"/principals": "view-principal",
	"principals/new": "view-principal",
	"principals/:id/edit": "view-principal",
	"/families": "view-family",
	"/families/new": "view-family",
	"/families/:id/edit": "view-family",
	"/businesses": "view-business",
	"/businesses/new": "view-business",
	"/contacts": "view-contact",
	"/contacts/new": "view-contact",
	"/plans": "view-plan",
	"/plans/new": "view-plan",
	"/5500": "view-fiftyfive",
	"/5500/new": "view-fiftyfive",
	"/employees": "view-employee",
	"/employees/new": "view-employee",
	"/distribution": "distribution",
	"/my_active_task": "active-task",
	"/roles": "view-roles",
	"/roles/new": "add-role",
	"/rights": "view-rights",
	"/rights/new": "add-right",
	"/approvals": "view-approval",
	"/documents/new": "view-approval",
	"/documents": "view-approval",
	"/notes/new": "view-approval",
	"/notes": "view-approval",



};

$(document).ready((function () {
	if (document.getElementById("home")) {
		sidebar(window.location.pathname);
	}

}));

function sidebar(url) {
	if (url.match(/\d/g) != null && url != "/5500" && url != "/5500/new") {
		search_index = url.search(/\d/g)
		str = url.substring(0, search_index - 1)
		url = str;
	}

	if (url != "/") {
		document.getElementById("home").classList.remove("active")
		var item = document.getElementById(hash[url]);
		var li = $(item).parent().parent().addClass("open");
		item.classList.add("active")
	}
	else {
		document.getElementById("home").classList.add("active")

	}
}

$(".redirect_to_show").click(function (e) {
	if (e.target.tagName !== "I") {
		window.location = e.currentTarget.dataset.url;
	}

})


function address(id, value) {
	$.ajax({
		url: `/address/get_address/${value}`,
		type: "GET",
		dataType: "json",
		success: function (response) {
			var add1 = response.data.address1
			var add2 = response.data.address2
			var city = response.data.city
			var state = response.data.state
			var zip = response.data.zip
			var address_type = response.data.address_type

			$("#first_address").val(add1)
			$("#second_address").val(add2)
			$("#address_city").val(city)
			$("#address_state").val(state)
			$("#address_zip").val(zip)
			$("#address_address_type").val(address_type)
		}
	})



}
$("#number_dropdown").change(function (event) {
	var a = $("#number_dropdown option:selected").text();
	$("#contact_number_number").val(a)


});




	
function delete_note(){
	var note_id = event.currentTarget.dataset.id
	event.currentTarget.closest('tr').remove();
	$.ajax({
		url: `/note/delete_note/${note_id}`,
		type: "GET",
		dataType: "json",
		success: function (response) {
			console.log("success")

		}
	})
}	

$('#add_note_popup').click(function(e)
{
	$('#myModal').modal('hide');
	$('#add_note').modal('show');	
});



$('#cancel_note').click(function(e)
{
	$('#add_note').modal('hide');
	event.preventDefault();

});

$('#myModal').on('hidden.bs.modal', function (e) {
})


$("#save_note").click(function (event) {
	var des = $("#add_note #description").val();
	var step = $("#add_note #data_collection_step").val();
	$.ajax({
		url: `/note/create_note`,
		data: { 'des': des, 'step': step },
		type: "POST",
		headers: {
			'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
		},
		dataType: "json",
		success: function (response) {
			$row = response.html;
			$('#myModal table > tbody:last').append($row);

			
		}
	})
	$("#add_note").modal('hide')
	$('#myModal').modal('show')
	event.preventDefault();
	return false;
})


