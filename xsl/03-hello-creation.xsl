<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Созидающие конструкции -->

    <xsl:output indent="yes"
                encoding="utf-8"/>

    <xsl:template match="doc">
        <results>
            <valueOf>
                <xsl:value-of select="12"/>
            </valueOf>
            <valueOf>
                <xsl:value-of select="'строка'"/>
            </valueOf>
            <valueOf>
                <xsl:value-of select="concat('строка ', 12)"/>
            </valueOf>
            <text>
                <xsl:text>&lt;1&gt;</xsl:text>
            </text>
            <text>
                <xsl:text><![CDATA[<2>]]></xsl:text>
            </text>
            <text>
                <xsl:text disable-output-escaping="yes"><![CDATA[&lt;3&gt;]]></xsl:text>
            </text>
            <text>
                <xsl:text disable-output-escaping="yes">&lt;4&gt;</xsl:text>
            </text>
            <text>
                <xsl:text disable-output-escaping="yes"><![CDATA[<5>]]></xsl:text>
            </text>
            <text>
                <xsl:text><![CDATA[&lt;6&gt;]]></xsl:text>
            </text>
            <element>
                <xsl:element name="{hello/@name}">
                    <xsl:attribute name="{concat(hello/@name, 'Attr')}">Новый атрибут</xsl:attribute>
                    <xsl:text><![CDATA[Текст в <xsl:text>]]></xsl:text>
                    Можно и так, но лезут лишние пробелы
                </xsl:element>
            </element>
            <comment>
                <xsl:comment>Новый комментарий</xsl:comment>
            </comment>
            <copy>
                <xsl:copy>
                    <xsl:text>Копируется контекстный узел, а мы сейчас в </xsl:text>
                    <xsl:value-of select="name()"/>
                </xsl:copy>
            </copy>
            <copyOf>
                <!-- Выбираем и родителя, и его дочерний элемент, второй скопируются дважды -->
                <xsl:copy-of select="hello | hello/doBang"/>
            </copyOf>
        </results>
    </xsl:template>

</xsl:stylesheet>
