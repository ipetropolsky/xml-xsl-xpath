<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes"
                 method="html"
                 encoding="utf-8"
                 doctype-system="about:legacy-compat"/>

    <xsl:template match="/pull-requests">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                <title>Pull Requests</title>
                <link rel="stylesheet" href="styles.css"/>
            </head>
            <body>
                <div class="modal-wrapper">
                    <div class="pull-requests">
                        <xsl:apply-templates select="pull-request"/>
                        <!--можно вставить внутрь<xsl:sort select="id" order="descending"/>-->
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="pull-request">
        <div class="pull-requests-row">
            <img class="pull-request-img" src="img/{@state}.png"/>
            <div class="pull-request">
                <div class="pull-request-title">
                    <a class="pull-request-name">
                        <xsl:attribute name="href">
                            <xsl:value-of select="/pull-requests/@url"/>/pull/<xsl:value-of select="@id"/>
                        </xsl:attribute>
                        <xsl:value-of select="title"/>
                    </a>
                    <img class="pull-request-img" src="img/checks-OK-{@checks-OK}.png"/>
                    <xsl:apply-templates select="tags"/>
                </div>
                <div class="pull-request-info">
                    <xsl:if test="@state='open'">
                        #<xsl:value-of select="@id"/> opened on <xsl:value-of select="date"/> by <xsl:value-of select="author"/>
                    </xsl:if>
                    <xsl:if test="@state='closed'">
                        #<xsl:value-of select="@id"/> by <xsl:value-of select="author"/> was closed on <xsl:value-of select="date"/>
                    </xsl:if>
                    <xsl:if test="@state='merged'">
                        #<xsl:value-of select="@id"/> by <xsl:value-of select="author"/> was merged on <xsl:value-of select="date"/>
                    </xsl:if>
                </div>
            </div>
            <a class="pull-request-comments">
                <xsl:attribute name="href">
                    <xsl:value-of select="/pull-requests/@url"/>/pull/<xsl:value-of select="@id"/>
                </xsl:attribute>
                 <img class="pull-request-img" src="img/comment.png"/>
                <xsl:value-of select="@comments"/>
            </a>
        </div>

    </xsl:template>

    <xsl:template match="tags">
        <div class="tags-container">
            <xsl:apply-templates select="tag"/>
        </div>
    </xsl:template>

    <xsl:template match="tag">
        <div class="tag">
            <xsl:value-of select="."/>
        </div>
    </xsl:template>
</xsl:stylesheet>

