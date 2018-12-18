<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:import href="../xsl/output/html.xsl"/>
    <xsl:import href="../xsl/html-layout.xsl"/>

    <xsl:template match="/">
        <xsl:apply-templates select="/doc" mode="layout"/>
    </xsl:template>

    <xsl:template match="/doc" mode="page-title">
        <xsl:text>Default title</xsl:text>
    </xsl:template>

    <xsl:template match="/doc[@title]" mode="page-title">
        <xsl:value-of select="@title"/>
    </xsl:template>

    <xsl:template match="/doc" mode="page-content">
        <ul>
            <xsl:apply-templates select="url"/>
        </ul>
    </xsl:template>

    <xsl:template match="url">
        <li>
            <a href="{@href}">
                <xsl:if test="@external">
                    <xsl:attribute name="target">_blank</xsl:attribute>
                </xsl:if>
                <xsl:value-of select="."/>
            </a>
        </li>
    </xsl:template>

</xsl:stylesheet>
