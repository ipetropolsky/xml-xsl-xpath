<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <selected>
            <xsl:value-of select="id('128')/title"/>
        </selected>
        <xsl:apply-templates select="//entry"/>
    </xsl:template>

    <xsl:template match="entry">
        <review>
            <xsl:copy-of select="author"/>
            <xsl:apply-templates select="id(@relates)"/>
            <text>
                <xsl:value-of select="review"/>
            </text>
        </review>
    </xsl:template>

    <xsl:template match="book">
        <relatedBook>
            <xsl:value-of select="title"/>
        </relatedBook>
    </xsl:template>

</xsl:stylesheet>
