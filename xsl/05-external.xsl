<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Вызывающие конструкции, подключаемый шаблон -->

    <xsl:template match="accounts">
        <dog>
            Это не применится, потому что в основном файле
            нет apply-imports в шаблоне для accounts.
        </dog>
    </xsl:template>

    <xsl:template match="accounts/account">
        <curl>
            <xsl:value-of select="concat('curl ', url)"/>
        </curl>
    </xsl:template>

</xsl:stylesheet>
