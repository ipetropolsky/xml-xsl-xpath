<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="../shared/label.xsl"/>
    <xsl:import href="../shared/datetime.xsl"/>

    <xsl:template match="pullRequest">
        <div class="row pull-request-list__row">
            <div class="col">
                <div class="pull-request-list__title">
                    <a href="pull/{@id}.xml">
                        <xsl:value-of select="title"/>
                    </a>
                    <span class="pull-request-list__checks">
                        <xsl:if test="@checks = 'ok'"><i class="fas fa-check"></i></xsl:if>
                        <xsl:if test="@checks = 'reject'"><i class="fas fa-times"></i></xsl:if>
                    </span>
                    <span class="pull-request-list__labels">
                        <xsl:apply-templates select="labels"/>
                    </span>
                </div>

                <div class="pull-request-list__info">
                    <span>
                        #<xsl:value-of select="@id"/> opened
                        <xsl:call-template name="formatdatetime">
                            <xsl:with-param name="datetime" select="@datetime"/>
                        </xsl:call-template>
                        by <xsl:value-of select="author/userName"/>
                    </span>
                </div>
            </div>

            <div class="col-2 text-right">
                <span class="pull-request-list__comments">
                    <i class="far fa-comment-alt"></i> <xsl:value-of select="@commentsCount"/>
                </span>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>
