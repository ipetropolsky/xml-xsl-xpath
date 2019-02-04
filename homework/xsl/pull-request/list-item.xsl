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
                        <xsl:apply-templates select="." mode="checks"/>
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
                        by <xsl:apply-templates select="author"/>
                    </span>
                </div>
            </div>

            <div class="col-2 text-right">
                <span class="pull-request-list__comments">
                    <i class="far fa-comment-alt"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="@commentsCount"/>
                </span>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="author">
        <a href="/user/{userName}">
            <xsl:value-of select="displayName"/>
        </a>
    </xsl:template>

    <xsl:template match="pullRequest" mode="checks">
        <xsl:if test="@checks = 'ok'"><i class="fas fa-check"/></xsl:if>
        <xsl:if test="@checks = 'reject'"><i class="fas fa-times"/></xsl:if>
    </xsl:template>

</xsl:stylesheet>
