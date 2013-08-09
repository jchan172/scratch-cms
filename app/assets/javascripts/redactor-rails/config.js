$(document).ready(
  function(){
  var csrf_token = $('meta[name=csrf-token]').attr('content');
  var csrf_param = $('meta[name=csrf-param]').attr('content');
  var params;
  if (csrf_param !== undefined && csrf_token !== undefined) {
    params = csrf_param + "=" + encodeURIComponent(csrf_token);
  }
  $('.redactor').redactor(
    { "imageUpload":"/redactor_rails/pictures?" + params,
      "imageGetJson":"/redactor_rails/pictures",
      "fileUpload":"/redactor_rails/documents?" + params,
      "fileGetJson":"/redactor_rails/documents",
      "path":"/assets/redactor-rails",
      "css":"style.css",
      "minHeight":"300",
      "linebreaks": "true", // use <br> when user presses enter instead of <p>
      // File button has been taken out because want to disable file upload for now
      "buttons":['html', '|', 'formatting', '|', 'bold', 'italic', 'deleted', '|',
                'unorderedlist', 'orderedlist', 'outdent', 'indent', '|',
                'image', 'video', 'table', 'link', '|', //'image', 'video', 'file', 'table', 'link', '|', 
                'fontcolor', 'backcolor', '|', 'alignment', '|', 'horizontalrule']
      // Look at the Redactor settings documentation, and then
      // add the "key":"value" param inside the {} braces just
      // like "minHeight" for example.
    }
  );
});