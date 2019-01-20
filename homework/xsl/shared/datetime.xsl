<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="formatdatetime">
        <xsl:param name="datetime"/>

        <xsl:variable name="date">
            <xsl:value-of select="substring-before($datetime,'T')"/>
        </xsl:variable>
        <xsl:variable name="time">
            <xsl:value-of select="substring-after($datetime,'T')"/>
        </xsl:variable>

        <xsl:variable name="month">
            <xsl:value-of select="substring($date,6,2)"/>
        </xsl:variable>

        <xsl:variable name="day">
            <xsl:value-of select="substring($date,9,2)"/>
        </xsl:variable>

        <xsl:variable name="year">
            <xsl:value-of select="substring($date,1,4)"/>
        </xsl:variable>

        <xsl:variable name="hour">
            <xsl:value-of select="substring($time,1,2)"/>
        </xsl:variable>

        <xsl:variable name="minute">
            <xsl:value-of select="substring($time,4,2)"/>
        </xsl:variable>
        <xsl:value-of select="concat($day, '.', $month, '.', $year, ' ', $hour, ':', $minute)"/>
    </xsl:template>

</xsl:stylesheet>
