	$(document).ready(function() {
		$("#accordion").accordion();
		$("#main_tabs").tabs();

		$("#dialog_entity_form").dialog({
			autoOpen : false,
			height : 600,
			width : 450,
			modal : true,
			close : function() {
// 				allFields.val("").removeClass("ui-state-error");
			}
		});

		$("#dialog_field_form").dialog({
			autoOpen : false,
			height : 600,
			width : 450,
			modal : true,
			close : function() {
// 				allFields.val("").removeClass("ui-state-error");
			}
		});

		$("#button_new_field").click(function(e) {
			$("#dialog_field_form").dialog("open");
		});

		$("#button_new_entity").button().click(function() {
			$("#dialog_entity_form").dialog("open");
		});

	});



$(function(){
    var tmpStr = RooGo.createEntityListHtml(entityArr);
    $("#entityListTable").append( tmpStr );
})

