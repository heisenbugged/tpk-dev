JSRouter['affiliates'] = {
  new: function() {
    refreshCertAutoCompletes();
    refreshSkillAutoCompletes();
    $("#certifications").bind('insertion-callback', refreshCertAutoCompletes);    
    $("#skills").bind('insertion-callback', refreshSkillAutoCompletes);
  }
};

JSRouter['affiliates']['create'] = JSRouter['affiliates']['new'];

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