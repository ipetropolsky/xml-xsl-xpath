<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Оставить только определённые элементы -->

    <xsl:output indent="yes"/>

    <xsl:template match="*|@*">
        <xsl:apply-templates select="*|@*|text()"/>
    </xsl:template>

    <xsl:template match="text()"/>

    <xsl:template match="doBang">
        <xsl:copy/>
    </xsl:template>

</xsl:stylesheet>
