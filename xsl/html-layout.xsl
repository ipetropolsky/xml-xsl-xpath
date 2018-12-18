<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/doc" mode="layout">
        <html>
            <head>
                <link rel="stylesheet" href="../static/style.css"/>
                <title>
                    <xsl:apply-templates
                            select="/doc"
                            mode="page-title"/>
                </title>
            </head>
            <body>
                <xsl:apply-templates
                        select="/doc"
                        mode="page-content"/>
            </body>
        </html>
    </xsl:template>


</xsl:stylesheet>
