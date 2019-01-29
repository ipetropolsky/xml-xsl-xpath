<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="PullRequest">
        <xsl:variable name="commentsCount" select="count(Comments/Comment)"/>
        <xsl:variable name="ci-result-icon-class">
            <xsl:choose>
                <xsl:when test="CI/ChecksNeed = CI/ChecksActual">
                    fa-check has-text-success
                </xsl:when>
                <xsl:otherwise>
                    fa-times has-text-danger
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <div class="columns">
            <div class="column">
                <div class="columns">
                    <div class="column">
                        <i class="fas fa-code-branch has-text-primary"></i>
                        <a href="">
                            #<xsl:value-of select="@Id"/>
                            <xsl:value-of select="Title"/>
                        </a>
                        <i
                            class="fas is-size-7 {$ci-result-icon-class}"
                            title="{CI/ChecksActual}/{CI/ChecksNeed} check">
                        </i>
                        <div class="tags is-flex is-pulled-right">
                            <xsl:apply-templates select="Tags/Tag" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="column is-half is-vcentered has-text-right">
                <xsl:value-of select="DateCreateFormatted"/> by <xsl:value-of select="User/Name"/>
                <xsl:if test="$commentsCount > 0">
                    <a href="">
                        <i
                            class="far fa-comments has-text-success"
                            title="{$commentsCount} comment(s)">
                        </i>
                    </a>
                </xsl:if>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="Tag">
        <xsl:variable name="tag-level" select="Level"/>
        <xsl:variable name="tag-class">
            <xsl:choose>
                <xsl:when test="$tag-level = 'Warning'">
                    is-warning
                </xsl:when>
                <xsl:when test="$tag-level = 'Danger'">
                    is-danger
                </xsl:when>
                <xsl:otherwise>
                    is-primary
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <span class="tag {$tag-class}">
            <xsl:value-of select="Value"/>
        </span>
    </xsl:template>
</xsl:stylesheet>
