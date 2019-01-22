<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema">
<xsl:output method="html"/>

<xsl:variable name="closedPR" select="count(//closedAt[ . != '']) + count(//mergedAt[ . != ''])">
</xsl:variable>

<xsl:template match="/">
<html>
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.2/css/bulma.css"/>
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
                <xsl:apply-templates select="labels"/>
            </div>
            <div class="level-right">
                <i class="fa fa-comment"></i>
                <xsl:value-of select="comments"/>
            </div>
        </div>
        <div class="content">
            <xsl:value-of select="concat('#', @id)"/>
            <xsl:value-of select="concat(' by ', openerName)"/>
            <xsl:choose>
                <xsl:when test="mergedAt != ''">
                    <xsl:text> was merged at </xsl:text>
                    <xsl:value-of select="mergedAt"/>
                </xsl:when>
                <xsl:when test="closedAt != ''">
                    <xsl:text> was closed at </xsl:text>
                    <xsl:value-of select="closedAt"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> was opened at </xsl:text>
                    <xsl:value-of select="createdAt"/>
                </xsl:otherwise>
            </xsl:choose>
        </div>
    </div>
</xsl:template>

<xsl:template match="title">
    <a class="has-text-black has-text-weight-bold">
        <xsl:attribute name="href">
            <xsl:value-of select="concat('pull',../@id, '.xml')"/>
        </xsl:attribute>
        <xsl:value-of select="."/>
    </a>
</xsl:template>

<xsl:template match="checkPass">
    <span>
    <xsl:if test=".='true'">
        <i class="fa fa-check"></i>
    </xsl:if>
    <xsl:if test=".='false'">
        <i class="fa fa-close"></i>
    </xsl:if>
    </span>
    <xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="labels">
    <span>
        <xsl:apply-templates select="label"/>
    </span>
</xsl:template>

<xsl:template match="label">
    <span class="tag is-primary">
        <xsl:value-of select="."/>
    </span>
    <xsl:text> </xsl:text>
</xsl:template>

</xsl:stylesheet>
