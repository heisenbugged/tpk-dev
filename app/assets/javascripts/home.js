JSRouter['problem_requests'] = {
  new: function() {
    selected = [];
    $('.item').click(function() {
      id = $(this).data("id");
      if($(this).is('.selected')) {
        // remove id from selected array
        selected.splice(selected.indexOf(id), 1);
        $(this).removeClass("selected");
        $("#category_check_"+id).attr('checked', false);
      } else {
       // add id to selected array
       selected.push(id);
       $(this).addClass("selected");
       $("#category_check_"+id).attr('checked', true);
      }      
    });
  }
};