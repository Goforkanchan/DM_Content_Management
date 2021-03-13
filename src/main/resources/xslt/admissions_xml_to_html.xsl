<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/admission">
        <xsl:param name="name"/>
        <xsl:param name="email"/>
        <html>
            <body>

                <h2>Admissions Template</h2>
<!--&lt;!&ndash;                -->
                <form>
                    <xsl:for-each select="element">
                        <xsl:variable name="eltID" select="@id" />
<!--                        <xsl:value-of select="$UpdateRequires"/>-->
                        <xsl:value-of select="$eltID"/>
                        <p> <xsl:value-of select="$eltID"/> </p>
                        <label for="{$eltID}"><xsl:value-of select="$eltID"/></label><br></br>
                        <input type="text" id="{$eltID}" name="{$eltID}"/><br></br>

                    </xsl:for-each>

                </form>




                <form >
                    <xsl:for-each select="element">
                        <p> efeeswggregtgrdzgyrh <xsl:variable name="emailid" select="element/@id"/> </p>
                    <table>
                        <tr>vhbkbjbjbljb</tr>
                        <tr><td><xsl:value-of select="element/@id"/></td>
                            <td><input type="text" name="email" ></input></td></tr>
<!--                        <tr><td>Name:</td><td><input type="text" name="name" value="{$name}"/></td></tr>-->
<!--                        <tr><td>Mobile:</td><td><input type="text" name="mobile" value="{$mobile}"/></td></tr>-->
<!--                       -->
<!--                        <tr><td></td><td><input type="submit" value="Submit"/></td></tr>-->
                    </table>
                    </xsl:for-each>

                </form>
                <p>Note that the form itself is not visible.</p>

                <p>Also note that the default width of text input fields is 20 characters.</p>

            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>