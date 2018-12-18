<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Вызывающие конструкции -->

    <!-- Импорт всегда стоит первым -->
    <xsl:import href="05-external.xsl"/>

    <xsl:output indent="yes"/>

    <xsl:template match="user">
        <xsl:apply-templates select="accounts"/>
    </xsl:template>

    <xsl:template match="accounts">
        <doc>
            <!-- 1 -->
            <xsl:apply-templates select="account"/>
            <!-- 2 -->
            <xsl:call-template name="copyright"/>
<!--
            <xsl:apply-imports/>
-->
        </doc>
    </xsl:template>

    <xsl:template match="accounts/account">
        <account>
            <url>
                <xsl:value-of select="url"/>
            </url>
            <!-- 3 -->
            <xsl:apply-imports/>
        </account>
    </xsl:template>

    <xsl:template name="copyright">
        <copyright>© 2017 HeadHunter</copyright>
    </xsl:template>

</xsl:stylesheet>
