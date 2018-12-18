<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output indent="yes"/>

    <xsl:template match="doc">
        <xsl:apply-templates select="hello"/>
    </xsl:template>

    <xsl:template match="hello">
        <HELLO>
            <xsl:value-of select="@name"/>
            <xsl:if test="//doBang">!</xsl:if>
        </HELLO>
    </xsl:template>

</xsl:stylesheet>
