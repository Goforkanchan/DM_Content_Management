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
            </head>
            <body>
                <!-- <xsl:for-each select="form/element"> <xsl:value-of select="@name"
                    /> <xsl:value-of select="@value" /> </xsl:for-each> -->
                <form id="myform">
                    <xsl:for-each select="form/element">
                        <xsl:variable name="level1Count"
                                      select="position() - 1" />
                        <xsl:value-of select="@name" />
                        <br></br>
                        <textarea id="{$level1Count}" rows="10" cols="80" >
                            <xsl:value-of select="@value" />
                        </textarea>
                    </xsl:for-each>
                    <script type="text/javascript">
                        var colATotal=
                        <xsl:value-of select='count(form/element)' />;

                        function printA(){
                        z = parseInt(colATotal)
                        console.log(z);
                        for (let i = 0; i &lt; z; i++) {

                        CKEDITOR.replace(document.getElementById(i), {readOnly:true});
                        }
                        }

                        printA();

                    </script>

                </form>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
