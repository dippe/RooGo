
(function(namespace){

    function createFieldListHtml( fields ){

    }

    function createSwitchListHtml( switches ){
        var switchStr = "";
        for (var k=0; k<switches.length; k++ ){
            currSwitch = switches[k];
            var tmpStr = currSwitch.switchName + " " + currSwitch.switchValue;
            console.log("switch:" + tmpStr);
            switchStr += "<li id=\"rg_switch_" + currSwitch.id + "\">" + tmpStr + " <span id=\"rg_rm_switch_" + currSwitch.id + "\">remove</span></li>\n";
        }
        switchStr = "<ul>" + switchStr + "</ul>";

        return switchStr;
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
                fieldStr += "<div id=\"rg_field_" + currField.id + "\">";
                fieldStr += "Field name: " + currField.fieldName;
                fieldStr += " Roo Type: " + currField.rooType;
                fieldStr += " Java Type: " + currField.javaType;

                switchStr = createSwitchListHtml( currField.switches );

                fieldStr += switchStr + "</div>";
            }

            entityStr  = "<div>" + entityStr + fieldStr + "</div>";

            entityListStr   += "<div>" + entityStr + "</div>";
        }

        console.log(entityListStr);

        return entityListStr;
    }

    namespace.createEntityListHtml = createEntityListHtml;
    namespace.createFieldListHtml = createFieldListHtml;
    namespace.createSwitchListHtml = createSwitchListHtml;

})( RooGo || (RooGo = {}) )
var RooGo;