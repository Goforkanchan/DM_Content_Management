<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <b>Admissions Template</b>

                <script
                        src="https://cdn.ckeditor.com/4.11.1/standard/ckeditor.js"/>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.js"/>
                    <script type="text/javascript">

                        function saveStaticDataToFile(data) {
                        data = data.join("\n");
                        var blob = new Blob([data],
                        { type: "text/plain;charset=utf-8" });
                        saveAs(blob, "static.xml");

                        console.log('here', data);

                        }

                    </script>

                <script type = "text/javascript" >
                    function fromToXml(form){
<!--                    console.log(form)-->
                    var xmldata=['&lt;?xml version="1.0"?&gt;'];
                    xmldata.push("&lt;form&gt;");
                    var inputs=form.elements;
                    for(var i=0;i&lt;inputs.length;i++){
                    var el=document.createElement("ELEMENT");

                    if (inputs[i].id){
<!--                    console.log(inputs[i]);-->
<!--                    console.log(CKEDITOR.instances[inputs[i].id].getData());-->

                    el.setAttribute("name",inputs[i].name);
<!--                    var valueData = -->
                    el.setAttribute("value",CKEDITOR.instances[inputs[i].id].getData());
                    xmldata.push(el.outerHTML);
                    }
                    }
                    xmldata.push("&lt;/form&gt;");
                    console.log(xmldata);
                    saveStaticDataToFile(xmldata);
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


                    </xsl:for-each>
                    <script type="text/javascript">
                        var colATotal=
                        <xsl:value-of select='count(admission/element)' />;

                        function printA(){
                        z = parseInt(colATotal)
                        console.log(z);
                        for (let i = 0; i &lt; z; i++) {
<!--                        console.log(document.getElementById(i));-->
                        CKEDITOR.replace(document.getElementById(i));
                        }
                        }

                        printA();

                    </script>
                    <button type="button" onclick="fromToXml(myform)">Create</button>
<!--                    <button type="button" onclick="saveStaticDataToFile()">Submit</button>-->

                </form>
            </body>
        </html>

    </xsl:template>
</xsl:stylesheet>
