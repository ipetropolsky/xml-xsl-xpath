<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="../shared/datetime.xsl"/>

    <xsl:template match="comment">
        <div class="comment">
            <div class="comment__title">
                <xsl:value-of select="author/userName"/>
                commented
                <xsl:call-template name="formatdatetime">
                    <xsl:with-param name="datetime" select="@datetime"/>
                </xsl:call-template>
            </div>
            <div class="comment__text">
                <xsl:value-of select="text"/>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>
