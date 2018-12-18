<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Пример сортировки -->

    <xsl:output indent="yes"/>

    <xsl:template match="user">
        <ul>
            <xsl:apply-templates select="accounts/account">
                <xsl:sort select="@name" order="ascending"/>
            </xsl:apply-templates>
        </ul>
    </xsl:template>

    <xsl:template match="account">
        <li>
            <xsl:value-of select="url"/>
        </li>
    </xsl:template>

</xsl:stylesheet>
