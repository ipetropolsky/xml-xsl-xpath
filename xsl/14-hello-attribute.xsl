<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Применение шаблона к атрибуту -->

    <xsl:output method="text"/>

    <xsl:template match="doc">
        <xsl:apply-templates select="hello/@name"/>
    </xsl:template>

    <xsl:template match="@name">
        <xsl:value-of select="."/>
    </xsl:template>

</xsl:stylesheet>
