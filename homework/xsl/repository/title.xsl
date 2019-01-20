<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="repository">
        <span>
            <xsl:value-of select="author/userName"/>
        </span>
        /
        <span>
            <xsl:value-of select="name"/>
        </span>
    </xsl:template>

</xsl:stylesheet>
