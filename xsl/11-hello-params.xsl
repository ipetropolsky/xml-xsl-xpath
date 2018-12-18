<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Применение шаблона с параметрами -->

    <xsl:output indent="yes"/>

    <xsl:template match="doc">
        <result>
            <xsl:apply-templates select="hello"/>
            <xsl:apply-templates select="hello">
                <xsl:with-param name="person"
                                select="'HeadHunter'"/>
            </xsl:apply-templates>
        </result>
    </xsl:template>

    <xsl:template match="hello">
        <xsl:param name="person" select="@name"/>
        <HELLO>
            <xsl:value-of select="$person"/>
        </HELLO>
    </xsl:template>

</xsl:stylesheet>
