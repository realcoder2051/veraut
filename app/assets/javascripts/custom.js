var hash = {
	"/users/new": "new-user",
	"/users": "view-user",
	"/users/show ": "view-user",
	"/users/:id/edit": "view-user",
	"/feduciary_documents": "document",
	"/contact_numbers/:id": "view-general",
	"/contact_numbers/new": "view-general",
	"/contact_numbers": "view-general",
	"/addresses/new": "view-general",
	"/addresses": "view-general",
	"/addresses/:id/edit": "view-general",
	"/address/add": "view-general",
	"/generals": "view-general",
	"/contact_number/add": "view-general",
	"/contact_numbers/:id/edit": "view-general",
	"/companies": "view-company",
	"/companies/new": "view-company",
	"/principals": "view-principal",
	"/principals/new": "view-principal",
	"/principals/:id/edit": "view-principal",
	"/families": "view-family",
	"/contact_numbers/:id": "view-general",
	"/families/new": "view-family",
	"/families/:id/edit": "view-family",
	"/businesses": "view-business",
	"/businesses/new": "view-business",
	"/contacts": "view-contact",
	"/view_requests": "view-contact",
	"/contacts/new": "view-contact",
	"/plans": "view-plan",
	"/plans_new": "view-plan",
	"/5500": "view-5500",
	"/employees": "view-employee",
	"/employees/new": "view-employee",
	"/distribution": "distribution",
	"/my_active_task": "active-task",
	"/roles": "view-roles",
	"/roles/new": "add-role",
	"/rights": "view-rights",
	"/approvals": "view-approval",
	"/notes/new": "view-approval",
	"/notes": "view-approval",
	"/documents/new": "view-approval",
	"/tasks": "active-task",
	"/": "home",
	"/feduciary_documents": "view-document",
	"/project_templates": "view-project-template"
};

$(document).ready((function () {
	if (document.getElementById("home")) {
		sidebar(window.location.pathname);
	}

}));

function sidebar(url){
	console.log(url)
  // if(url.substring(0,5) == '/user')
  // {
  //   return;
	// }
	
	if (url.match(/5500/g))
	{
		url = url.substring(0,5)
	}
	else if (url.match(/\d/g)!= null)
  {
    search_index = url.search(/\d/g)
    url = url.substring(0,search_index-1)
  }

  if(url != "/welcome")
  {
		if(document.getElementById("dashboard_icon"))
    	document.getElementById("dashboard_icon").classList.remove("active");
    var item = document.getElementById(hash[url]);
		var li = $(item).parent().parent().toggleClass("open");
		if(item)
    	item.classList.add("active")
  }
  else
  {
    document.getElementById("dashboard_icon").classList.add("active");
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
			var address_id=response.data.id
			var add1 = response.data.address1
			var add2 = response.data.address2
			var city = response.data.city
			var state = response.data.state
			var zip = response.data.zip
			var address_type = response.data.address_type

			$("#address_id").val(address_id)
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

$(".fiscal_month").change(function (event) {
	var m = $(".fiscal_month").val();
	var d = $(".fiscal_date").val();
	var date = new Date().getFullYear()+'-'+ m+ '-' +d
	$("#company_fiscal_year_end").val(date)

});

$(".fiscal_date").change(function (event) {
	var m = $(".fiscal_month").val();
	var d = $(".fiscal_date").val();
	var date = new Date().getFullYear()+'-'+ m+ '-' +d
	$("#company_fiscal_year_end").val(date)

});

$(".submit-company").click(function(){        
	$("#company_form").submit(); 
});

$(".submit-plan").click(function(){        
	$("#plan_form").submit(); 
});


$(".submit-5500").click(function(){        
	$(".new_questionaire_answer").submit(); 
});

$(".submit-edit-5500").click(function(){        
	$(".edit_questionaire_answer").submit(); 
});


// $(".alert").delay(4000).slideUp(200);



	
function delete_note(){
	var del = confirm("Are you sure")
	if (del == true)
	{
		var note_id = event.currentTarget.dataset.id
		event.currentTarget.closest('tr').remove();
		$.ajax({
			url: `/note/delete_note/${note_id}`,
			type: "GET",
			dataType: "json",
			success: function (response) {
				console.log(response)
				$(".notes_count").text("Notes [" +response.note_count + "]") 
			}
		})
	}
	else {
		return false;
	}
}	

$('#add_note_popup').click(function(e)
{
	$('#description').val('');
	$('#myModal').modal('hide');
	$('#add_note').modal('show');
});

$("#save_note").click(function (event) {
	var des = $("#add_note #description").val();
	var step = $("#add_note #data_collection_step").val();
	$.ajax({
		url: `/note/create_note`,
		data: Parameters= { "note": {"description": des, "data_collection_step": step }},
		type: "POST",
		headers: {
			'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
		},
		dataType: "json",
		success: function (response) {
			console.log(response);
			$(".notes_count").text("Notes [" +response.note_count + "]") 
			$row = response.html;
			$('#myModal table > tbody:last').append($row);
			if ($(".result_found").length){
				$(".result_found").hide();
			}
		}
	})
	$("#add_note").modal('hide')
	$('#myModal').modal('show')
	event.preventDefault();
	return false;
});


$("#update_note_button").click(update_note);


function update_note()
{
	var des = $("#update_note #description").val();
	var step = $("#update_note #data_collection_step").val();
	var note_id = $("#update_note #id").val();
	$.ajax({
		url: `/note/update_note/${note_id}`,
		data:  Parameters= { "note": {"description": des, "data_collection_step": step }},
		type: "POST",
		headers: {
			'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
		},
		dataType: "json",
		success: function (response) {
			console.log(response)
			$row = $(response.html);
			$(`#note_${note_id}`).html($row.html());
		}
	})
	$("#update_note").modal('hide')
	$('#myModal').modal('show')
	event.preventDefault();
	return false;
}


$(".question_field2").change(function(e){
	var value = $( ".question_field2 option:selected" ).text();
	if (value == 'Yes'){
		$(".question_four3").addClass("required");
		$(".new_questionaire_answer").validate();
		$(".edit_questionaire_answer").validate();

	}
	else
		$(".question_four3").removeClass("required");

});

$(document).ready(function(){
	$('.datepicker').datepicker();

	$('#new_approval form').validate({ // initialize the plugin
		rules: {
				name: "required",
				email: "required"
			}
	});
});

$("#approval-submit").click(function (e) {
	if($('#new_approval form').valid()){
		$('#new_approval').modal('hide');
		$('#welcome_message').modal('show');
	}else{
		return false;
	}
})

$("#welcome_message_close").click(function (e) {
	window.location.href = 'tasks';
})

	$("#delete").click(function(e)
	{
		var employees= []
		$("input:checkbox[name=employee_id]:checked").each(function(){
			employees.push($(this).val());
		});
		$.ajax({
			url: '/employees/bulk_delete?employees='+(employees),
			dataType: 'get'
		})//.then((response) => {
    //   if (response.status == 200) {
		// 		debugger;
		// 		window.location.replace("localhost:3000/employees");
		// 	};
		// });
	});

	window.addEventListener("dirty", function (e) {
    var confirmationMessage = 'It looks like you have been editing something. '
                            + 'If you leave before saving, your changes will be lost.';

    (e || window.event).returnValue = confirmationMessage; //Gecko + IE
    return confirmationMessage; //Gecko + Webkit, Safari, Chrome etc.
});