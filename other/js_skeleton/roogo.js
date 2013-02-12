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

    // add event remove to all elements

    $("[id^='rg_rm_switch_']").click( function(e){ RooGo.removeSwitch( $(this).attr('id').replace('rg_rm_switch_', "") )} );

    $("[id^='rg_rm_field_']").click( function(e){ RooGo.removeField( $(this).attr('id').replace('rg_rm_field_', "") )} );

    $("[id^='rg_rm_entity_']").click( function(e){ RooGo.removeEntity( $(this).attr('id').replace('rg_rm_entity_', "") )} );

    $("[id^='rg_rm_project_']").click( function(e){ RooGo.removeProject( $(this).attr('id').replace('rg_rm_project_', "") )} );

})

