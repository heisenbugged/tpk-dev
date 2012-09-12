JSRouter['affiliates'] = {
  new: function() {
    refreshAllAutoCompletes();
    $("#certifications").bind('insertion-callback', function() { refreshAutoComplete("#certifications")});    
    $("#services").bind('insertion-callback', function() { refreshAutoComplete("#services")});
    $("#skills").bind('insertion-callback', function() { refreshAutoComplete("#skills")});    
  }
};

JSRouter['affiliates']['create'] = JSRouter['affiliates']['new'];


function refreshAllAutoCompletes() {
  refreshAutoComplete("#certifications");
  refreshAutoComplete("#skills");
  refreshAutoComplete("#services");
}

function refreshAutoComplete(criteria) {
  inputCriteria = criteria + " input";
  $(inputCriteria).unbind("autocomplete").autocomplete({
    source: $(inputCriteria).data("autocomplete-source")
  });
  
  // if one of the textfields for certs, services, or skills are selected
  // prevent form from submitting and instead add a new row when enter is pressed.
  $(inputCriteria).unbind("keypress").keypress(function (e) {
    if(e.which == 13) {
      $(criteria + " .link a").click();
      // put focus on new input created
      $(inputCriteria).last().focus();
      e.preventDefault();
    }
  });
}