<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

     <xsl:output indent="yes"
        method="html"
        encoding="utf-8"
        doctype-system="about:legacy-compat"/>

    <xsl:template match="prList">
        <html>
            <head>
                <title>XML</title>
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            <body>
                <div class="modal">
                    <xsl:apply-templates 
                        select="../prList"
                        mode="header"/>
                    <ul class="pr-records">
                        <xsl:apply-templates 
                            select="pullRequest"
                            mode="pr"/>
                    </ul>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="prList" mode="header">
        <div class="header">
            <div>
                <img class="header_icon" src="img/open.png"/>
                <h2 class="header_text"> 
                    <xsl:value-of select="count(//status[. = 'opened'])"/>
                    <xsl:text> Open</xsl:text>
                </h2>
            </div>
            <div>
                <img class="header_icon" src="img/close.png"/>
                <h2 class="header_text">
                    <xsl:value-of select="count(//status[. = 'closed' or . = 'merged'])"/>
                    <xsl:text> Closed</xsl:text>
                </h2>
            </div>          
        </div>
    </xsl:template>

    <xsl:template match="pullRequest" mode="pr">
        <xsl:variable name="imgName" select="status"/>
        <li class="pr">
            <img class="pr_status_icon" src="img/{$imgName}.png"/>
            <div class="pr_content">
                <p class="pr_content_title">
                    <xsl:value-of select="name"/>
                </p>
                <img class="pr_content_icon" src="img/{checked}.png" />
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
                <xsl:if test="comments">
                    <p class="pr_content_comment_count">
                        <xsl:value-of select="comments"/>
                    </p>
                    <img class="pr_content_icon" src="img/comments.png"/>
                </xsl:if>
                <p class="pr_content_info">
                    #<xsl:value-of select="id"/>
                    by <xsl:value-of select="author"/>
                    was <xsl:value-of select="status"/> 
                    on <xsl:value-of select="date"/>
                </p>
            </div>
        </li>
    </xsl:template>

</xsl:stylesheet>
