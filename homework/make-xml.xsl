<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output indent="yes"
                method="xml"
                encoding="utf-8"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="body">
        <pulls>
            <xsl:apply-templates select="div"/>
        </pulls>
    </xsl:template>

    <xsl:template match="div/div">
        <pull>
            <xsl:apply-templates select="div//span[@class='opened-by']"/>
            <type>
                <xsl:apply-templates select="div//span[@class='tooltipped tooltipped-e']"/>
            </type>
            <tags>
                <xsl:apply-templates select="div//span[@class='labels lh-default']/a"/>
            </tags>
            <status>
                <xsl:apply-templates select="div//div[@class='commit-build-statuses']"/>
            </status>
            <comments>
                <xsl:value-of select="div//div[@class='float-right col-2']"/>
            </comments>
        </pull>
    </xsl:template>

    <xsl:template match="span[@class='opened-by']">
        <author>
            <xsl:value-of select="./a"/>
        </author>
        <date>
            <xsl:value-of select="./relative-time/@datetime"/>
        </date>
    </xsl:template>

    <!--tag template-->
    <xsl:template match="span[@class='labels lh-default']/a">
        <tag>
            <xsl:value-of select="."/>
        </tag>
    </xsl:template>

    <!--checks (status) template-->
    <xsl:template match="div[@class='commit-build-statuses']">
        <passed>
            <xsl:apply-templates select="./a/svg"/>
        </passed>
    </xsl:template>

    <xsl:template match="span[@class='tooltipped tooltipped-e']">
        <xsl:value-of select="@aria-label"/>
    </xsl:template>

    <!--checks passed template-->
    <xsl:template match="svg[@class='octicon octicon-check']">true</xsl:template>

    <!--checks failed template-->
    <xsl:template match="svg[@class='octicon octicon-x']">false</xsl:template>

</xsl:stylesheet>
