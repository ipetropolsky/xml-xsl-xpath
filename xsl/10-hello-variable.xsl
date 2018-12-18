<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Пример глобальной переменной -->

    <xsl:output indent="yes"/>

    <xsl:variable name="bang">
        <xsl:if test="//doBang">Это работает!</xsl:if>
    </xsl:variable>

    <xsl:template match="doc">
        <xsl:element name="{hello/@name}">
            <xsl:value-of select="$bang"/>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
