<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Пример key -->

    <xsl:output indent="yes"/>

    <xsl:key name="accountUrl"
             match="/user/accounts/account/url"
             use="ancestor::account/@name"/>

    <xsl:template match="user">
        <followTo>
            <xsl:value-of select="key('accountUrl', 'github')"/>
        </followTo>
    </xsl:template>

</xsl:stylesheet>
