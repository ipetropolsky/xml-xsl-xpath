<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Вывод текста определённых элементов -->

    <xsl:output method="text"/>

    <xsl:template match="*|@*">
        <xsl:apply-templates select="*|@*|text()"/>
    </xsl:template>

    <xsl:template match="text()"/>

    <xsl:template match="url">
        <xsl:value-of select="."/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

</xsl:stylesheet>
