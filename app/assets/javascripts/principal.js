$('.modal-edit').click(function(event) {
    console.log(event);
    Rails.ajax({
      url: $(this).children().attr('href'),
      type: "get",
      data: "",
      success: function(data) {
        console.log(data);
        $('#edit_principal #name').val(data.name)
        $('#edit_principal #title').val(data.title)
        $('#edit_principal #officer').val(data.officer)
        $('#edit_principal #ownership').val(data.ownership)
        $('#edit_principal form').attr('action', '/principals/'+data.id);
        $('#edit_principal').modal("show");
      },
      error: function(data) {}
    })
  });
