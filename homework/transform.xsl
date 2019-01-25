<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

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
                    <xsl:apply-templates select="pullReqquest">
                        <xsl:sort select="id" order="descending"/>
                    </xsl:apply-templates>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="pullReqquest">

        <div class="frame">
            <div class="mergeIco"></div>
            <div class="pullRequest">
                <div class="nameTags">
                    <a class="pullRequestName">
                        <xsl:attribute name="href">
                            <xsl:value-of select="link"/>
                        </xsl:attribute>
                        <xsl:value-of select="content"/>
                    </a>
                    <xsl:apply-templates select="checksOK"/>
                    <xsl:apply-templates select="tags"/>
                </div>
                <div class="pullRequestInfo">
                    <span>#
                        <xsl:value-of select="id"/>
                        <![CDATA[ opened ]]>
                    </span>
                    <span class="creationDate">
                        <xsl:value-of select="date"/>
                    </span>
                    <span>
                        <![CDATA[ by ]]>
                    </span>
                    <a class="authorName">
                        <xsl:attribute name="href">
                            <xsl:value-of select="author/link"/>
                        </xsl:attribute>
                        <xsl:value-of select="author/name"/>
                    </a>
                </div>
            </div>
            <xsl:if test="commentsCount>0">
                <div class="comments">
                    <ico class="commentIco"/>
                    <span class="commentsCount">
                        <xsl:value-of select="commentsCount"/>
                    </span>
                </div>
            </xsl:if>
        </div>
    </xsl:template>

    <xsl:template match="tags">
        <xsl:apply-templates select="tag"/>
    </xsl:template>

    <xsl:template match="tag">
        <div class="tag">
            tag:<xsl:value-of select="."/>
        </div>
    </xsl:template>

    <xsl:template match="checksOK">
        <xsl:if test=". = 'true'">
            <div class="checksOkIco checksIco"/>
        </xsl:if>
        <xsl:if test=". = 'false'">
            <div class="checksNotOkIco checksIco"/>
        </xsl:if>

    </xsl:template>


</xsl:stylesheet>

