<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="label">
        <span class="badge badge-{type}">
            <xsl:value-of select="title"/>
        </span>
    </xsl:template>

</xsl:stylesheet>
