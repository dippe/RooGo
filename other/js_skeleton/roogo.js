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









// dummy data
entityArr = Array();
entityArr[0] = {
    name:"users",
    id: 1,
    fields:
        [
            {
                fieldName: 'userName',
                rooType: 'String',
                javaType: 'java.lang.String',
                switches: [
                    {
                        id:1,
                        text: '--notNull'
                    },
                    {
                        id:2,
                        text: '--sizeMin 2'
                    }
                ]
            },
            {
                fieldName: 'password',
                rooType: 'String',
                javaType: 'java.lang.String',
                switches: [
                    {
                        id:3,
                        text: '--unique'
                    },
                    {
                        id:4,
                        text: '--sizeMax 10'
                    }
                ]
            }
     ]
};
entityArr[1] = {
    name:"kocsi",
    id: 2,
    fields:
        [
            {
                fieldName: 'szin',
                rooType: 'String',
                javaType: 'java.lang.String',
                switches: [
                    {
                        id:1,
                        text: '--notNull'
                    },
                    {
                        id:2,
                        text: '--sizeMin 2'
                    }
                ]
            },
            {
                fieldName: 'kerek',
                rooType: 'String',
                javaType: 'java.lang.String',
                switches: [
                    {
                        id:3,
                        text: '--unique'
                    },
                    {
                        id:4,
                        text: '--sizeMax 10'
                    }
                ]
            }
     ]
};

console.log( entityArr );

function createTableRow( tdArr ){
    var tmpStr = "<tr>";
    for( var i=0; i<tdArr.length; i++ ){
        tmpStr += "<td>" + tdArr[i] + "</td>";
    }
    tmpStr += "</tr>";
}


function createEntityListHtml( entityArr ){
    var entityListStr = "";
    for ( var i=0; i<entityArr.length; i++ ){
        currEntity = entityArr[i];
        console.log("entity:" + currEntity.name);
        var entityStr = "";
        entityStr += "<h2>Entity: " + currEntity.name + "</h2>\n";

        for (var j=0; j<currEntity.fields.length; j++){
            currField = currEntity.fields[j];
            console.log("field:" + currField.fieldName);
            var fieldStr = "";
            fieldStr += "<div>";
            fieldStr += "Field name: " + currField.fieldName;
            fieldStr += " Roo Type: " + currField.rooType;
            fieldStr += " Java Type: " + currField.javaType;

            var switchStr = "";
            for (var k=0; k<currField.switches.length; k++ ){
                currSwitch = currField.switches[k];
                console.log("switch:"+ currSwitch.text)
                switchStr += "<li>" + currSwitch.text + " <span onClick=\"removeSwitch(" + currSwitch.id + ")\">remove</span></li>\n";
            }
            switchStr = "<ul>" + switchStr + "</ul>";

            fieldStr += switchStr + "</div>";
        }

        entityStr  = "<div>" + entityStr + fieldStr + "</div>";

        entityListStr   += "<div>" + entityStr + "</div>";
    }

    console.log(entityListStr);

    return entityListStr;
}

function removeSwitch( id ){
    alert( "remove switch:" + id );
}

function removeEntity( id ){
    alert( "remove entity:" + id );
}

function removeField( id ){
    alert( "remove field:" + id );
}


$(function(){
    var tmpStr = createEntityListHtml(entityArr);
    $("#entityListTable").append( tmpStr );
})

