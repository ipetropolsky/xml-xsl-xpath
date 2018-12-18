<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Пример mode -->

    <xsl:output indent="yes"
                method="xml"
                omit-xml-declaration="yes"/>

    <!-- Не будем хардкодить урлы в шаблонах, вынесем в переменную -->
    <xsl:variable name="staticHost" select="'//i.example.com'"/>

    <xsl:template match="user">
        <html>
            <body>
                <header>
                    <!-- 1 -->
                    <xsl:apply-templates select="accounts/account"
                                         mode="account-link-header"/>
                </header>
                <article>
                    <xsl:text>Режимы однозначны и последовательны: </xsl:text>
                    <!-- 2 -->
                    <xsl:apply-templates select="accounts/account"/>
                </article>
                <footer>
                    <!-- 3 -->
                    <xsl:apply-templates select="accounts/account"
                                         mode="account-link-footer"/>
                </footer>
            </body>
        </html>
    </xsl:template>

    <!-- 1 -->
    <xsl:template match="account" mode="account-link-header">
        <a href="{url}">
            <img src="{$staticHost}/social-buttons/{@name}.png"
                 alt="{@name} icon"/>
        </a>
    </xsl:template>

    <!-- 2 -->
    <xsl:template match="account">
        <xsl:value-of select="@name"/>
        <xsl:text> </xsl:text>
    </xsl:template>

    <!-- 3 -->
    <xsl:template match="account" mode="account-link-footer">
        <a href="{url}">
            <xsl:value-of select="@name"/>
        </a>
    </xsl:template>

</xsl:stylesheet>
