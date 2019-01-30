<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="PullRequest">
        <xsl:variable name="commentsCount" select="count(Comments/Comment)"/>
        <xsl:variable name="status" select="Status"/>

        <div class="columns">
            <div class="column">
                <div class="columns">
                    <div class="column">
                        <xsl:if test="$status = 'Open'">
                            <i class="fas fa-code-branch has-text-primary" title="{$status}"/>
                        </xsl:if>
                        <xsl:if test="$status = 'Closed'">
                            <i class="fas fa-code-branch has-text-danger" title="{$status}"/>
                        </xsl:if>

                        <a href="#">
                            #<xsl:value-of select="@Id"/>
                            <xsl:value-of select="Title"/>
                        </a>
                        <xsl:apply-templates select="CI" />
                        <div class="tags is-flex is-pulled-right">
                            <xsl:apply-templates select="Tags/Tag" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="column is-half is-vcentered has-text-right">
                <xsl:value-of select="DateCreateFormatted"/> by <xsl:value-of select="User/Name"/>
                <xsl:if test="$commentsCount > 0">
                    <a href="#">
                        <i
                            class="far fa-comments has-text-success"
                            title="{$commentsCount} comment(s)">
                        </i>
                    </a>
                </xsl:if>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="CI[ChecksNeed = ChecksActual]">
        <i class="fas is-size-7 fa-check has-text-success" title="{ChecksActual}/{ChecksNeed} check"/>
    </xsl:template>

    <xsl:template match="CI">
        <i class="fas is-size-7 fa-times has-text-danger" title="{ChecksActual}/{ChecksNeed} check"/>
    </xsl:template>

    <xsl:template match="Tag[Level = 'Warning']">
        <span class="tag is-warning">
            <xsl:value-of select="Value"/>
        </span>
    </xsl:template>

    <xsl:template match="Tag[Level = 'Danger']">
        <span class="tag is-danger">
            <xsl:value-of select="Value"/>
        </span>
    </xsl:template>

    <xsl:template match="Tag">
        <span class="tag is-primary">
            <xsl:value-of select="Value"/>
        </span>
    </xsl:template>
</xsl:stylesheet>
