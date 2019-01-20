<?xml version="1.0" encoding="UTF-8"?>
<!--
количество открытых и закрытых реквестов;
атрибуты каждого реквеста: дата, автор, метки, галочки, количество комментов.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:import href="../xsl/output/html.xsl"/>
    <xsl:import href="../xsl/layout/html-layout.xsl"/>
    <xsl:import href="../xsl/repository/title.xsl"/>
    <xsl:import href="../xsl/pull-request/list.xsl"/>

    <xsl:template match="/">
        <xsl:apply-templates select="/doc" mode="layout"/>
    </xsl:template>

    <xsl:template match="/doc[@title]" mode="page-title">
        <xsl:value-of select="@title"/>
    </xsl:template>

    <xsl:template match="/doc" mode="page-content">
        <div class="container">
            <h1 class="title">
                <xsl:apply-templates select="repository"/>
            </h1>
            <xsl:apply-templates select="repository/pullRequests"/>
        </div>
    </xsl:template>

</xsl:stylesheet>
