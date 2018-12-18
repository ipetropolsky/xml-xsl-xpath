<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:foo="http://example.com/foo">

    <!-- Приоритеты шаблонов, инструкция ниже -->

    <xsl:output method="text"/>

    <xsl:template match="/">
        <xsl:text>Run:&#10;</xsl:text>
        <xsl:text>xsltproc --verbose xsl/08-account-priority.xsl xml/account.xml&#10;</xsl:text>
        <xsl:text>xsltproc --verbose xsl/08-account-priority.xsl xml/account.xml 2>&amp;1 | grep 'default priority'</xsl:text>
        <xsl:apply-templates select="accounts/account"/>
    </xsl:template>

    <xsl:template match="*"/>
    <xsl:template match="*[@name]"/>
    <xsl:template match="*[@name='github']"/>
    <xsl:template match="*[@name='github'][url]"/>
    <xsl:template match="node()"/>
    <xsl:template match="node()[@name]"/>
    <xsl:template match="node()[@name='github']"/>
    <xsl:template match="node()[@name='github'][url]"/>
    <xsl:template match="account"/>
    <xsl:template match="account[@name]"/>
    <xsl:template match="account[@name='github']"/>
    <xsl:template match="account[@name='github'][url]"/>

    <xsl:template match="foo:*"/>
    <xsl:template match="foo:*[@name]"/>
    <xsl:template match="foo:*[@name='github']"/>
    <xsl:template match="foo:*[@name='github'][url]"/>
<!--
    Это не работает:
    > xsltCompilePattern : failed to compile 'foo:node()'

    <xsl:template match="foo:node()"/>
    <xsl:template match="foo:node()[@name]"/>
    <xsl:template match="foo:node()[@name='github']"/>
    <xsl:template match="foo:node()[@name='github'][url]"/>
-->
    <xsl:template match="foo:account"/>
    <xsl:template match="foo:account[@name]"/>
    <xsl:template match="foo:account[@name='github']"/>
    <xsl:template match="foo:account[@name='github'][url]"/>

    <xsl:template match="//*"/>
    <xsl:template match="//*[@name]"/>
    <xsl:template match="//*[@name='github']"/>
    <xsl:template match="//*[@name='github'][url]"/>
    <xsl:template match="//node()"/>
    <xsl:template match="//node()[@name]"/>
    <xsl:template match="//node()[@name='github']"/>
    <xsl:template match="//node()[@name='github'][url]"/>
    <xsl:template match="//account"/>
    <xsl:template match="//account[@name]"/>
    <xsl:template match="//account[@name='github']"/>
    <xsl:template match="//account[@name='github'][url]"/>

    <xsl:template match="accounts/*"/>
    <xsl:template match="accounts/*[@name]"/>
    <xsl:template match="accounts/*[@name='github']"/>
    <xsl:template match="accounts/*[@name='github'][url]"/>
    <xsl:template match="accounts/node()"/>
    <xsl:template match="accounts/node()[@name]"/>
    <xsl:template match="accounts/node()[@name='github']"/>
    <xsl:template match="accounts/node()[@name='github'][url]"/>
    <xsl:template match="accounts/account"/>
    <xsl:template match="accounts/account[@name]"/>
    <xsl:template match="accounts/account[@name='github']"/>
    <xsl:template match="accounts/account[@name='github'][url]"/>

</xsl:stylesheet>
