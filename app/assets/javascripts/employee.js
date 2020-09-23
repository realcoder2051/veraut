$('.modal-edit').click(function(event) {
  console.log(event);
  Rails.ajax({
    url: $(this).children().attr('href'),
    type: "get",
    data: "",
    success: function(data) {
      // debugger;
      $('#edit_employee #first_name').val(data.first_name)
      $('#edit_employee #last_name').val(data.last_name)
      $('#edit_employee #ssn').val(data.ssn)
      $('#edit_employee #gender').val(data.gender)
      $('#edit_employee #date_of_birth').val(data.date_of_birth)
      $('#edit_employee #original_date_of_hire').val(data.original_date_of_hire)
      $('#edit_employee #date_of_termination').val(data.date_of_termination)
      $('#edit_employee #date_of_retire').val(data.date_of_retire)
      $('#edit_employee #compensation').val(data.compensation)
      $('#edit_employee #hours').val(data.hours)
      $('#edit_employee #pre_tax_salary_deferal').val(data.pre_tax_salary_deferal)
      $('#edit_employee #roth_salary_deferal').val(data.roth_salary_deferal)
      $('#edit_employee #employee_match').val(data.employee_match)
      $('#edit_employee #company_division').val(data.company_division)
      $('#edit_employee #union_employee').val(data.union_employee)
      $('#edit_employee form').attr('action', '/employees/'+data.id);
      $('#edit_employee').modal("show");
    },
    error: function(data) {}
  })
});

$('#file').change(function() {
  $('#target').submit();
});


$('.import').click(function(){
  $('#file').click();   
return false;
});

$('#employee_ssn').keyup(function(){
  $(this).val($(this).val().replace(/(\d{3})\-?(\d{2})\-?(\d{4})/,'$1-$2-$3'))
});

$(".status:contains('pending')").css('color','red')
