$(document).ready(function() {
  $('.handle-delete-user').click(function() {
    $.ajax({
      type: 'DELETE',
      url: "/users/"+$(this).data().id,
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      data: {
        id: $(this).data().id,
      },
      dataType: 'JSON'
    }).done(function (data) {
      alert(data.success);
      location.reload();
    }).fail(function (data) {
      alert(data.danger);
    });
  });
})
