<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="repository" mode="repository-name">
        <xsl:value-of select="author/displayName"/> / <xsl:value-of select="name"/>
    </xsl:template>

</xsl:stylesheet>
