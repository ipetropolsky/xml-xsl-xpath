<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Управляющие конструкции -->

    <xsl:output indent="yes"
                method="html"
                encoding="utf-8"
                doctype-system="about:legacy-compat"/>

    <xsl:template match="user">
        <html>
            <body>
                <!-- В test произвольное xpath-выражение -->
                <xsl:if test="accounts/account[@name='github']">
                    <p>Это разработчик, Ватсон.</p>
                </xsl:if>
                <xsl:if test="accounts/account[@name='vk']">
                    <p>Похоже он из наших.</p>
                </xsl:if>

                <!-- Переменная только удобства работы внутри шаблона и чтобы не считать каждый раз -->
                <xsl:variable name="numberOfAccounts" select="count(accounts/account)"/>
                <p>
                    <xsl:value-of select="concat('У пользователя ', $numberOfAccounts, ' ')"/>
                    <xsl:choose>
                        <xsl:when test="$numberOfAccounts = 1">аккаунт</xsl:when>
                        <xsl:when test="$numberOfAccounts > 1 and $numberOfAccounts &lt; 5">аккаунта</xsl:when>
                        <xsl:otherwise>аккаунтов</xsl:otherwise>
                    </xsl:choose>
                    <xsl:text>:</xsl:text>
                </p>

                <ul>
                    <!-- Внутри for-each контекст меняется на account -->
                    <xsl:for-each select="accounts/account">
                        <xsl:sort select="@name" order="ascending"/>
                        <li>
                            <xsl:value-of select="url"/>
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
