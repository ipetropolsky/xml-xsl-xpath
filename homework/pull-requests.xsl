<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output indent="yes"
                method="html"
                encoding="utf-8"
                doctype-system="about:legacy-compat"/>

    <xsl:template match="issues">
        <html>
            <head>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.2/css/bulma.min.css"/>
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous"/>
            </head>
            <body>
                <xsl:variable name="numberOfOpenIssues" select="count(issue/status[@open='true'])"/>
                <xsl:variable name="numberOfClosedIssues" select="count(issue/status[@open='false'])"/>
                
                <div class="box level">
                    <div class="level-item">
                        <span class="icon has-text-success"><i class="fas fa-check"></i></span>
                        <xsl:value-of select="concat($numberOfOpenIssues, ' Open')"/>
                    </div>
                    <div class="level-item">
                        <span class="icon has-text-danger"><i class="fas fa-times"></i></span>
                        <xsl:value-of select="concat($numberOfClosedIssues, ' Closed')"/>
                    </div>
                </div>

                <xsl:apply-templates select="issue"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="issue">
    <div class="box">
        <div class="level">
            <div class="level-left">
                <div class="level-item">
                    <xsl:apply-templates select="status" mode="icon"/>
                </div>
                <div class="level-item">
                    <xsl:apply-templates select="title"/>
                    <xsl:apply-templates select="checks"/>
                </div>
                <xsl:apply-templates select="labels/label"/>
            </div>
            <div class="level-right">
                <xsl:apply-templates select="comments"/>
            </div>
        </div>
        <div class="level">
            <xsl:apply-templates select="status">
                <xsl:with-param name="id"
                                select="@id"/>
            </xsl:apply-templates>
        </div>
    </div>
    </xsl:template>

    <!-- Icon -->
    <xsl:template match="status[@open='true']" mode="icon">
        <span class="icon has-text-success"><i class="fas fa-code-branch"></i></span>
    </xsl:template>
    <xsl:template match="status[@open='false']" mode="icon">
        <span class="icon has-text-danger"><i class="fas fa-code-branch"></i></span>
    </xsl:template>

    <!-- Title -->
    <xsl:template match="title">
        <a href="{url}">
            <xsl:value-of select="text"/>
        </a>
    </xsl:template>

    <!-- Checks -->
    <xsl:template match="checks[@passed='true']">
        <a title="{.}">
            <span class="icon has-text-success"><i class="fas fa-check"></i></span>
        </a>
    </xsl:template>
    <xsl:template match="checks[@passed='false']">
        <a title="{.}">
            <span class="icon has-text-danger"><i class="fas fa-times"></i></span>
        </a>
    </xsl:template>

    <!-- Labels -->
    <xsl:template match="label">
        <div class="level-item">
            <a>
                <xsl:attribute name="title">
                    <xsl:value-of select="."/>
                </xsl:attribute>
                <xsl:attribute name="style">
                    <xsl:value-of select="concat('background-color: ',@background,'; color: ',@color)"/>
                </xsl:attribute>
                <xsl:value-of select="."/>
            </a>
        </div>
    </xsl:template>

    <!-- Comments -->
    <xsl:template match="comments">
        <span class="icon"><i class="far fa-comment-alt"></i></span>
        <a href="{url}">
            <xsl:value-of select="total"/>
        </a>
    </xsl:template>

    <!-- Status -->
    <xsl:template match="status[@open='true']">
        <xsl:param name="id"/>
        <span>
            #<xsl:value-of select="$id"/>
            opened <xsl:value-of select="opened"/> by
            <a title="Open pull requests created by {author/name}" href="{author/url}">
                <xsl:value-of select="author/name"/>
            </a>
        </span>
    </xsl:template>
    <xsl:template match="status[@open='false']">
        <xsl:param name="id"/>
        <span>
            #<xsl:value-of select="$id"/>
            by
            <a title="Open pull requests created by {author/name}" href="{author/url}">
                <xsl:value-of select="author/name"/>
            </a>
            was closed <xsl:value-of select="closed"/>
        </span>
    </xsl:template>
</xsl:stylesheet>