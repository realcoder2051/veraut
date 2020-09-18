$('.modal-edit').click(function(event) {
    console.log(event);
    Rails.ajax({
      url: $(this).children().attr('href'),
      type: "get",
      data: "",
      success: function(data) {
        console.log(data);
        $('#edit_contact_number #contact_type').val(data.contact_type)
        $('#edit_contact_number #number').val(data.number)
        $('#edit_contact_number form').attr('action', '/contact_numbers/'+data.id);
        $('#edit_contact_number').modal("show");
      },
      error: function(data) {}
    })
  });
