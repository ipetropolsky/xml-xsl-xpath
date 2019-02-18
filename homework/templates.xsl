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
                    <xsl:value-of select="count(pullRequest/status[text() = 'opened'])"/>
                    <xsl:text> Open</xsl:text>
                </h2>
            </div>
            <div>
                <img class="header_icon" src="img/close.png"/>
                <h2 class="header_text">
                    <xsl:value-of select="count(pullRequest/status[text() = 'closed' or text() = 'merged'])"/>
                    <xsl:text> Closed</xsl:text>
                </h2>
            </div>          
        </div>
    </xsl:template>

    <xsl:template match="pullRequest" mode="pr">
        <li class="pr">
        	<xsl:apply-templates select="status[text() = 'opened']"/>
        	<xsl:apply-templates select="status[text() = 'closed']"/>
            <xsl:apply-templates select="status[text() = 'merged']"/>
            <div class="pr_content">
                <p class="pr_content_title">
                    <xsl:value-of select="title"/>
                </p>
                <xsl:apply-templates select="checked[text() = 'yes']"/>
                <xsl:apply-templates select="checked[text() = 'no']"/>
                <xsl:apply-templates select="CLA"/>
                <xsl:apply-templates select="tag[text() = 'documentation']"/>
                <xsl:apply-templates select="tag[text() = 'internal']"/>
                <xsl:apply-templates select="comments"/>
                <p class="pr_content_info">
                    #<xsl:value-of select="id"/>
                    by <a class="pr_content_info_ref" href="https://github.com/{author}">
                    	<xsl:value-of select="author"/>
                    </a>
                    was <xsl:value-of select="status"/> 
                    on <xsl:value-of select="date"/>
                </p>
            </div>
        </li>
    </xsl:template>

    <xsl:template match="status[text() = 'opened']">
    	<img class="pr_status_icon" src="img/opened.png"/>
    </xsl:template>

    <xsl:template match="status[text() = 'closed']">
    	<img class="pr_status_icon" src="img/closed.png"/>
    </xsl:template>

    <xsl:template match="status[text() = 'merged']">
    	<img class="pr_status_icon" src="img/merged.png"/>
    </xsl:template>

    <xsl:template match="checked[text() = 'yes']">
    	<img class="pr_content_icon" src="img/yes.png" />
    </xsl:template>
    
    <xsl:template match="checked[text() = 'no']">
    	<img class="pr_content_icon" src="img/no.png" />
    </xsl:template>
    
    <xsl:template match="CLA">
    	<p class="pr_content_tag__cla">CLA Signed</p>
    </xsl:template>

    <xsl:template match="tag[text() = 'documentation']">
    	<p class="pr_content_tag__documentation">
            <xsl:text>tag: documentation</xsl:text>
        </p>
    </xsl:template>

     <xsl:template match="tag[text() = 'internal']">
    	<p class="pr_content_tag__internal">
            <xsl:text>tag: internal</xsl:text>
        </p>
    </xsl:template>

    <xsl:template match="comments">
    	<p class="pr_content_comment_count">
            <xsl:value-of select="text()"/>
        </p>
        <img class="pr_content_icon" src="img/comments.png"/>
    </xsl:template>

</xsl:stylesheet>
