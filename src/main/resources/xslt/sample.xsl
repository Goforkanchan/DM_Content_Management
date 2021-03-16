<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
               Admissions Template
                <script type = "text/javascript" >
                	
                    function fromToXml(form){
	                    console.log(form)
	                    var xmldata=['&lt;?xml version="1.0"?&gt;'];
	                    xmldata.push("&lt;form&gt;");
	                    var inputs=form.elements;
	                    for(var i=0;i&lt;inputs.length;i++){
		                    var el=document.createElement("ELEMENT");
		                    if (inputs[i].name){
			                    el.setAttribute("name",inputs[i].name);
			                    el.setAttribute("value",inputs[i].value);
			                    xmldata.push(el.outerHTML);
                    		}	
                    	}
	                    xmldata.push("&lt;/form&gt;");
	                    console.log(xmldata);
	                    return xmldata.join("\n");
                    }
                </script>
            </head>

            <body>
                <h2>Books</h2>
<!--                <script src="/js/toXml.js"></script>-->

                <form id="myform">
                    <xsl:for-each select="admission/element">
                        <xsl:variable name="eltID" select="@id" />
                        <label for="{$eltID}"><xsl:value-of select="$eltID"/></label><br></br>
                        <input type="text" id="{$eltID}" name="{$eltID}"/><br></br>

                    </xsl:for-each>
                    <button type="button" onclick="fromToXml(myform)">Create</button>
                </form>
                <p class="result-json-output"></p>
<!--                $('#myForm').formToJson('.result-json-output');-->

            </body>
        </html>

    </xsl:template>
</xsl:stylesheet>