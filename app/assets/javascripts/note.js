$(".modal-note-edit").click(get_note);

function get_note() {
	var note_id = event.currentTarget.dataset.id
  console.log(event);
  Rails.ajax({
    url: `/notes/get_note/${note_id}`,
    type: "get",
		data: "",
    success: function(data) {
			console.log(data)
      $('#update_note #description').val(data.data.description)
      $('#update_note #data_collection_step').val(data.data.data_collection_step)
      $('#update_note #id').val(data.data.id)
			$('#update_note').modal("show");
			$('#myModal').modal('hide');

    },
    error: function(data) {}
  })


}

 

