function getXml(){
    var elements = document.forms.myForm.elements;
    var xmlTemplate = '<?xml version="1.0"?> <formData>';
    for(var i =0; i< elements.length; i++){
        var element = elements[i];
        if(element.tagName=="INPUT"){
            xmlTemplate = xmlTemplate + '<'+element.name+'>' + element.value+'</'+element.name+'>';
        }


    }
    xmlTemplate = xmlTemplate +'</formData>';
    return xmlTemplate;
}
document.write(getXml());

getXml();

function fromToXml(form){
    var xmldata=['<?xml version="1.0"?>'];
    xmldata.push("<form>");
    var inputs=form.elements;
    for(var i=0;i<inputs.length;i++){
        var el=document.createElement("ELEMENT");
        if (inputs[i].name){
            el.setAttribute("name",inputs[i].name);
            el.setAttribute("value",inputs[i].value);
            xmldata.push(el.outerHTML);
        }

    }
    xmldata.push("</form>");
    return xmldata.join("\n");
}