<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output indent="yes"
                method="html"
                encoding="utf-8"
                media-type="text/html;"
                doctype-system="about:legacy-compat"/>

    <xsl:template match="/">
        <ul>
            <xsl:apply-templates select="/library/books/book" mode="short-info">
                <xsl:sort select="@year" order="descending"/>
                <xsl:sort select="@pages" order="descending"/>
            </xsl:apply-templates>
        </ul>
    </xsl:template>

    <xsl:template match="book" mode="short-info">
        <li>
            <xsl:value-of select="@year"/>
            <xsl:text>: </xsl:text>
            <xsl:value-of select="title"/>
            <xsl:value-of select="concat(' (', @pages, ')')"/>
        </li>
    </xsl:template>

</xsl:stylesheet>
