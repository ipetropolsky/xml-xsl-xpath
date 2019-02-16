<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output indent="yes"
                method="xml"
                encoding="utf-8"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/html/body">
        <pulls>
            <xsl:apply-templates select="div"/>
        </pulls>
    </xsl:template>

    <xsl:template match="div/div">
        <pull>
            <author>
                <xsl:value-of select="div//span[@class='opened-by']/a"/>
            </author>
            <date>
                <raw>
                    <xsl:value-of select="div//span[@class='opened-by']/relative-time/@datetime"/>
                </raw>
                <formatted>
                    <xsl:variable name="dtime" select="div//span[@class='opened-by']/relative-time/@datetime">
                    </xsl:variable>
                    <xsl:value-of select="concat(substring(substring-after($dtime,'T'),0,6),' ', div//span[@class='opened-by']/relative-time)"/>
                </formatted>
            </date>
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

    <xsl:template match="span[@class='tooltipped tooltipped-e' and contains(@aria-label, 'Open')]">open</xsl:template>

    <xsl:template match="span[@class='tooltipped tooltipped-e' and contains(@aria-label, 'Closed')]">closed</xsl:template>

    <xsl:template match="span[@class='tooltipped tooltipped-e' and contains(@aria-label, 'Merged')]">merged</xsl:template>


    <!--checks passed template-->
    <xsl:template match="svg[@class='octicon octicon-check']">true</xsl:template>

    <!--checks failed template-->
    <xsl:template match="svg[@class='octicon octicon-x']">false</xsl:template>

</xsl:stylesheet>
