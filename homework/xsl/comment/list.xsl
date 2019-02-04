<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="item.xsl"/>

    <xsl:template match="comments">
        <div class="comments">
            <xsl:apply-templates select="comment"/>
        </div>
    </xsl:template>

</xsl:stylesheet>
