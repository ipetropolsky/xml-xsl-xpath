<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:regexp="http://exslt.org/regular-expressions"
                extension-element-prefixes="date regexp"
                xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:import href="exslt.github.io/date/date.xsl"/>
    <xsl:import href="exslt.github.io/regexp/regexp.xsl"/>
    <xsl:import href="page_meta.xsl"/>
    <xsl:output method="html"/>
    <xsl:variable name="closedPR" select="count(pullRequests/pullRequest[closedAt or mergedAt])" ></xsl:variable>

    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="common_header"/>
            </head>
            <body>
                <section class="section">
                  <div class="container">
                    <h1 class="title">Pull requests</h1>
                        <div class="box">
                            <span class="has-text-weight-semibold">
                                <xsl:value-of select="count(/pullRequests/pullRequest) - $closedPR"/>
                                <xsl:text> Open  </xsl:text>
                            </span>
                            <span>
                                <xsl:value-of select="$closedPR"/>
                                <xsl:text> Closed</xsl:text>
                            </span>
                        </div>
                    <xsl:apply-templates select="pullRequests/pullRequest"/>
                    </div>
                </section>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="pullRequests/pullRequest">
        <div class="box">
            <div class="level">
                <div class="level-left">
                    <xsl:apply-templates select="title"/>
                    <xsl:apply-templates select="checkPass"/>
                    <xsl:apply-templates select="labels" mode="pull_header"/>
                </div>
                <div class="level-right">
                    <i class="fa fa-comment"></i>
                    <xsl:value-of select="comments"/>
                </div>
            </div>
            <div class="content">
                <xsl:value-of select="concat('#', @id)"/>
                <xsl:text> by </xsl:text>
                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="opener/openerUrl"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:value-of select="opener/openerName"/>
                </a>

                <xsl:choose>
                    <xsl:when test="mergedAt">
                        <xsl:text> was merged </xsl:text>
                        <xsl:call-template name="get_term">
                            <xsl:with-param name="a_date" select="mergedAt"/>
                        </xsl:call-template>

                    </xsl:when>
                    <xsl:when test="closedAt">
                        <xsl:text> was closed </xsl:text>
                        <xsl:call-template name="get_term">
                            <xsl:with-param name="a_date" select="closedAt"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text> was opened </xsl:text>
                        <xsl:call-template name="get_term">
                            <xsl:with-param name="a_date" select="createdAt"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="title">
        <a class="has-text-black has-text-weight-bold">
            <xsl:attribute name="href">
                <xsl:value-of select="../url"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </a>
    </xsl:template>

    <xsl:template match="checkPass">
        <span>
        <xsl:if test="text()='true'">
            <i class="fa fa-check"></i>
        </xsl:if>
        <xsl:if test="text()='false'">
            <i class="fa fa-close"></i>
        </xsl:if>
        </span>
        <xsl:text> </xsl:text>
    </xsl:template>

    <xsl:template match="labels" mode="pull_header">
        <span>
            <xsl:apply-templates select="label"/>
        </span>
    </xsl:template>

    <xsl:template match="label">
        <span>
            <xsl:attribute name="class">
                <xsl:value-of select="concat('tag', ' ', @color)"></xsl:value-of>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </span>
        <xsl:text> </xsl:text>
    </xsl:template>
    <xsl:template name="get_term">
        <xsl:param name="a_date"/>
        <xsl:variable name="diff">
            <xsl:call-template name="date:difference">
                <xsl:with-param name="start" select="$a_date" />
                <xsl:with-param name="end" select="date:date-time()" />
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="days_dirty">
            <xsl:value-of select="regexp:match($diff, 'P(\d*)DT')"/>
        </xsl:variable>
        <xsl:variable name="days_clear">
            <xsl:value-of select="regexp:replace($days_dirty, '[A-Z]', 'g', '')"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$days_clear = ''">
                <xsl:text>today</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$days_clear"/>
                <xsl:text> day</xsl:text>
                <xsl:if test="$days_clear > 1">
                    <xsl:text>s</xsl:text>
                </xsl:if>
                <xsl:text> ago</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
