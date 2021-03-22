<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <b>Admissions Template</b>

                <script
                        src="https://cdn.ckeditor.com/4.11.1/standard/ckeditor.js">



                    function fromToXml(form){
                    console.log(form)
                    var
                    xmldata=['&lt;?xml version="1.0"?&gt;'];
                    xmldata.push("&lt;form&gt;");
                    var inputs=form.elements;
                    for(var
                    i=0;i&lt;inputs.length;i++){
                    var
                    el=document.createElement("ELEMENT");
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

                <form id="myform">
                    <xsl:for-each select="admission/element">
                        <xsl:variable name="level1Count"
                                      select="position() - 1" />
                        <xsl:variable name="eltID" select="@name" />
                        <label for="{$level1Count}">
                            <xsl:value-of select="$eltID" />
                        </label>
                        <br></br>
                        <!-- <input type="text" id="{$eltID}" name="{$eltID}"/><br></br> -->
                        <textarea id="{$level1Count}" name="{$eltID}" rows="10"
                                  cols="80">
                            
                        </textarea>

                        <script type="text/javascript">

                            CKEDITOR.replace(document.getElementById();
                        </script>
                    </xsl:for-each>
                    <script type="text/javascript">
                        var colATotal=
                        <xsl:value-of select='count(admission/element)' />
                        ;

                        function printA(){
                        z = parseInt(colATotal)
                        console.log(z);
                        for (let i = 0; i &lt; z; i++) {
                        console.log(i);
                        CKEDITOR.replace(document.getElementById(i));
                        }
                        }

                        printA();

                    </script>
                    <button type="button" onclick="fromToXml(myform)">Create</button>
                </form>

            </body>
        </html>

    </xsl:template>
</xsl:stylesheet>
