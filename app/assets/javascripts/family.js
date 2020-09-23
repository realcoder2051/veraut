$('.modal-edit').click(function(event) {
  console.log(event);
  Rails.ajax({
    url: $(this).children().attr('href'),
    type: "get",
    fda,
    data: "",
    success: function(data) {
      $('#edit_family #name').val(data.name)
      $('#edit_family #relationship').val(data.relationship)
      $('#edit_family #related_to').val("dsa")
      $('#edit_family form').attr('action', '/families/'+data.id);
      $('#edit_family').modal("show");
    },
    error: function(data) {}
  })
});
