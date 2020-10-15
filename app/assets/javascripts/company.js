$('.modal-edit').click(function(event) {
    console.log(event);
    Rails.ajax({
      url: $(this).children().attr('href'),
      type: "get",
      data: "",
      success: function(data) {
        console.log(data);
        $('#edit_company #company_name').val(data.company_name)
        $('#edit_company #ein').val(data.ein)
        $('#edit_company #fiscal_year_end').val(data.fiscal_year_end)
        $('#edit_company #entity_type').val(data.entity_type)
        $('#edit_company #naic_code').val(data.naic_code)
        $('#edit_company #payroll_provider').val(data.payroll_provider)
        $('#edit_company #payroll_frequency').val(data.payroll_frequency)
        $('#edit_company form').attr('action', '/companies/'+data.id);
        $('#edit_company').modal("show");
      },
      error: function(data) {}
    })
	});
