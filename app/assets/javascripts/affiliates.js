JSRouter['affiliates'] = {
  new: function() {
    refreshServiceAutoCompletes();
    refreshCertAutoCompletes();
    refreshSkillAutoCompletes();
    $("#certifications").bind('insertion-callback', refreshCertAutoCompletes);    
    $("#skills").bind('insertion-callback', refreshSkillAutoCompletes);
    $("#services").bind('insertion-callback', refreshServiceAutoCompletes);
  }
};

JSRouter['affiliates']['create'] = JSRouter['affiliates']['new'];

function refreshServiceAutoCompletes() {
  $("#services input").unbind("autocomplete").autocomplete({
    source: $("#services input").data("autocomplete-source")
  });
}

function refreshSkillAutoCompletes() {
  $("#skills input").unbind("autocomplete").autocomplete({
    source: $("#skills input").data("autocomplete-source")
  });
}

function refreshCertAutoCompletes() {
  $('#certifications input').unbind('autocomplete').autocomplete({
    source:  $('#certifications input').data('autocomplete-source')
  });
}