
(function(namespace){

    function createSwitchListHtml( switchArr ){

    }

    function createFieldListHtml( switchArr ){

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
                    var tmpStr = currSwitch.switchName + " " + currSwitch.switchValue;
                    console.log("switch:" + tmpStr);
                    switchStr += "<li>" + tmpStr + " <span onClick=\"removeSwitch(" + currSwitch.id + ")\">remove</span></li>\n";
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



    namespace.createEntityListHtml = createEntityListHtml;
    namespace.createFieldListHtml = createFieldListHtml;
    namespace.createSwitchListHtml = createSwitchListHtml;

})( RooGo || (RooGo = {}) )
var RooGo;