$('.modal-edit').click(function(event) {
    console.log(event);
    Rails.ajax({
      url: $(this).children().attr('href'),
      type: "get",
      data: "",
      success: function(data) {
        console.log(data);
        $('#edit_business #name').val(data.name)
        $('#edit_business #ein').val(data.ein)
        $('#edit_business #date_purchased_or_sold').val(data.date_purchased_or_sold)
        $('#edit_business #address').val(data.address)
        $('#edit_business #city').val(data.city)
        $('#edit_business #state').val(data.state)
        $('#edit_business #zip').val(data.zip)
        $('#edit_business #does_company_have_employees').val(data.does_company_have_employees)
        $('#edit_business #qualified_plan_sponsored').val(data.qualified_plan_sponsored)
        $('#edit_business #entity_type').val(data.entity_type)
        $('#edit_business form').attr('action', '/businesses/'+data.id);
        $('#edit_business').modal("show");
      },
      error: function(data) {}
    })
  });
