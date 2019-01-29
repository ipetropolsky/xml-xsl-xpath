<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xst="http://www.w3.org/1999/XSL/Transform">

    <xsl:output indent="yes"
                encoding="utf-8"
                method="html"
                doctype-system="about:legacy-compat"/>


    <xsl:template match="pullRequestList">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <link rel="stylesheet" href="styles.css" type="text/css"/>
                <title>Pull requests</title>
            </head>
            <body>
                <div class="wrapper">
                    <xsl:apply-templates select="pullRequest">
                        <xsl:sort select="id" order="descending"/>
                    </xsl:apply-templates>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="pullRequest">
        <div class="frame">
            <xsl:apply-templates select="status"/>
            <div class="pullRequest">
                <div class="nameTags">
                    <a class="pullRequestName" href="{link}">
                        <xsl:value-of select="content"/>
                    </a>
                    <xsl:apply-templates select="checksOK"/>
                    <xsl:apply-templates select="tags/tag"/>
                </div>
                <div class="pullRequestInfo">
                    <span>
                        <xsl:text>#</xsl:text>
                        <xsl:value-of select="id"/>
                        <xst:text> opened </xst:text>
                        <xsl:value-of select="relativeTime"/>
                        <xst:text> by </xst:text>
                    </span>
                    <a class="authorName" href="{author/link}">
                        <xsl:value-of select="author/name"/>
                    </a>
                </div>
            </div>
            <xsl:if test="commentsCount > 0">
                <div class="comments">
                    <ico class="commentIco"/>
                    <span class="commentsCount">
                        <xsl:value-of select="commentsCount"/>
                    </span>
                </div>
            </xsl:if>
        </div>
    </xsl:template>

    <!--xsl:template match="tags">
        <xsl:apply-templates select="tag"/>
    </xsl:template-->

    <xsl:template match="tag">
        <div class="tag">
            tag:<xsl:value-of select="."/>
        </div>
    </xsl:template>

    <xsl:template match="checksOK[text() = 'true']">
        <div class="checksOkIco checksIco"/>
    </xsl:template>

    <xsl:template match="checksOK[text() = 'false']">
        <div class="checksNotOkIco checksIco"/>
    </xsl:template>

    <xsl:template match="status[text() = 'opened']">
        <div class="openedIco"/>
    </xsl:template>

    <xsl:template match="status[text() = 'merged']">
        <div class="mergedIco"/>
    </xsl:template>

    <xsl:template match="status[text() = 'closed']">
        <div class="closedIco"/>
    </xsl:template>






</xsl:stylesheet>

