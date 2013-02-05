<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>

<html lang="en">
<head>
<meta charset="utf-8" />
<title>Roo Editor</title>
<link href="http://twitter.github.com/bootstrap/assets/css/bootstrap.css" rel="stylesheet">
<link href="http://twitter.github.com/bootstrap/assets/css/bootstrap-responsive.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://blueimp.github.com/JavaScript-Templates/tmpl.min.js"></script>
<script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-transition.js"></script>
<script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-alert.js"></script>
<script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-modal.js"></script>
<script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-dropdown.js"></script>
<script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-scrollspy.js"></script>
<script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-tab.js"></script>
<script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-tooltip.js"></script>
<script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-popover.js"></script>
<script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-button.js"></script>
<script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-collapse.js"></script>
<script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-carousel.js"></script>
<script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-typeahead.js"></script>
<script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-affix.js"></script>

<script type="text/javascript">
//dummy
window.users = [
                {
                	fieldName: 'userName',
                	rooType: 'String',
                	javaType: 'java.lang.String',
                	switches: ['--notNull', '--unique']
                },
                {
                	fieldName: 'password',
                	rooType: 'String',
                	javaType: 'java.lang.String',
                	switches: ['--notNull']
                },
                {
                	fieldName: 'role',
                	rooType: 'reference',
                	javaType: 'top.level.package.domain.Role',
                	switches: ['--cascade']
                },
 ];
 
window.roles = [
                {
                	fieldName: 'roleName',
                	rooType: 'String',
                	javaType: 'java.lang.String',
                	switches: ['--notNull']
                }
];

</script>

<script type="text/javascript">
//dummy
$(document).ready(function(){
	$('#userButton').click(function(){
		$('#rooeditor-entity-table').html(tmpl('table-template', window.users));
		
	});
	$('#roleButton').click(function(){
		$('#rooeditor-entity-table').html(tmpl('table-template', window.roles));
	});
});
</script>


<script type="text/javascript">

;(function($){
    $.fn.extend({
        rooeditor_show_entity_edit_dialog: function(options) {
            this.defaultOptions = {};
            
            
            return this.each(function() {
            	
                console.log(options);
                $('#rooeditor-edit-field-dialog').modal();
            	$('#rooeditor-edit-field-fieldName').val( options.entityName );
            	$('#rooeditor-edit-field-javaType').val( options.javaType );
                var $this = $(this);
                console.log($this);
                
            });
            
        }
    });
})(jQuery);

</script>


<script type="text/javascript">

!function ($) {
	$(function(){
		$('tr.rooeditor-field-edit').live('click', function(){
			
			var children = $(this).children();
			
			$(this).rooeditor_show_entity_edit_dialog(
					{
					    entityName : $(children[0]).text(),
					    rooType : $(children[1]).text(),
					    javaType : $(children[2]).text(),
					    switches : $(children[3]).text()
					}
			);
		});
	});
}(window.jQuery);

</script>

<script type="text/x-tmpl" id="table-template">

<table class="table table-hover rooeditor-table">
    <caption>User</caption>
      <thead>
        <tr>
            <td>Field</td>
            <td>Roo Type</td>
            <td>Java Type</td>
            <td>Switches</td>
            
        </tr>
      </thead>
      <tbody>
{% for (var i = 0; i < o.length; i++) { %}
        <tr class="rooeditor-field-edit">
            <td>{%=o[i].fieldName%}</td>
            <td>{%=o[i].rooType%}</td>
            <td>{%=o[i].javaType%}</td>
            <td>
            {% for (var j = 0; j < o[i].switches.length; j++) { %}
                {%=o[i].switches[j]%}&nbsp
            {% } %}
            </td>
        </tr>
{% } %}
      </tbody>
    </table>

</script>

</head>
<body>

  <!--  entity table editor modal -->
  <div id="rooeditor-edit-field-dialog" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="rooeditor-edit-field-dialog-title">User&nbsp;<em>entity</em></h3>
  </div>
  <div class="modal-body">
    <form action="#" method="post">
        <label>
            field name:
            <input id="rooeditor-edit-field-fieldName" name="fieldName" type="text" value="" required />
        </label>
        <label>
            roo type:
            <select>
                <option>string</option>
                <option>date</option>
                <option>reference</option>
            </select>
        </label>
        <label>
            java type:
            <input id="rooeditor-edit-field-javaType" name="javaType" type="text" value="" required />
        </label>
        <fieldset>
            <legend>switches:</legend>
            <label>
                --notNull
                <input type="checkbox" name="notNull" value="--notNull" />
            </label>
            <label>
                --unique
                <input type="checkbox" name="unique" value="--unique" />
            </label>
            <label>
                --cascade
                <input type="checkbox" name="cascade" value="--cascade" />
            </label>
        </fieldset>
        <fieldset>
            <legend>generate</legend>
            <label>
                json
                <input type="checkbox" name="json" value="json" />
            </label>
            <label>
                spring mvc 
                <input type="checkbox" name="mvc" value="mvc" />
            </label>
        </fieldset>
    </form>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
    <button class="btn btn-primary">Save changes</button>
  </div>
</div>
  <!--  entity table editor modal -->

<div class="container-fluid">
  <div class="row-fluid">
  
  
    <div class="span2"> <!-- navbar -->
        <ul class="rooeditor-navbar">
            <li>
                <a id="userButton" href="#">User</a>
            </li>
            <li>
                <a id="roleButton" href="#">Roles</a>
            </li>
        </ul>
      
    </div> <!-- /navbar -->
    
    <div class="span10"> <!-- content -->
    
    <div id='rooeditor-entity-table'>
    
    
    
    </div>
    
    </div> <!-- /content -->
    
  </div>
</div>

</body>
</html>