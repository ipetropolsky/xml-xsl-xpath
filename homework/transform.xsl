<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output indent="yes"
                method="html"
                encoding="utf-8"
                doctype-system="about:legacy-compat"/>

    <xsl:template match="prList">
        <html>
            <head>
                <title>XSLT HW</title>
                <link rel="stylesheet" type="text/css" href="styles.css"/>
            </head>
            <body>
                <div class="wrapper">
                    <ul class="pr-container">
                        <xsl:apply-templates
                                select="pullRequest"
                                mode="pr"/>
                    </ul>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="pullRequest" mode="pr">
        <xsl:variable name="imgName" select="status"/>
        <li class="pr">
            <img class="pr_status_icon" src="img/{$imgName}.png"/>
            <div class="pr_content">

                <p class="pr_content_title">
                    <xsl:choose>
                        <xsl:when test="name">
                            <xsl:value-of select="name"/>
                        </xsl:when>
                        <xsl:otherwise>No title provided...</xsl:otherwise>
                    </xsl:choose>
                </p>
                <img class="pr_content_check_icon" src="img/{checked}.png" />
                <xsl:if test="CLA">
                    <p class="pr_content_tag__cla">CLA Signed</p>
                </xsl:if>
                <xsl:variable name="tagName" select="tag"/>
                <xsl:if test="tag">
                    <p class="pr_content_tag__{$tagName}">
                        <xsl:text>tag: </xsl:text>
                        <xsl:value-of select="$tagName"/>
                    </p>
                </xsl:if>
                <p class="pr_content_info">
                    #<xsl:value-of select="id"/>
                    by <xsl:value-of select="author"/>
                    was <xsl:value-of select="status"/>
                    on <xsl:value-of select="date"/>
                </p>
            </div>
            <xsl:if test="comments">
                <p class="pr_content_comment_count">
                    <xsl:value-of select="comments"/>
                </p>
                <img class="pr_content_comment_icon" src="img/comment.png"/>
            </xsl:if>
        </li>
    </xsl:template>

</xsl:stylesheet>
