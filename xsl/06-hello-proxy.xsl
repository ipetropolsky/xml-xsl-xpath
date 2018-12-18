<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Полное копирование с заменой <doBang/> на <doSomething/> -->

    <xsl:output indent="yes"/>

    <xsl:template match="*|@*|text()|comment()">
        <xsl:copy>
            <xsl:apply-templates select="*|@*|text()|comment()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="doBang">
        <doSomething/>
    </xsl:template>

</xsl:stylesheet>
