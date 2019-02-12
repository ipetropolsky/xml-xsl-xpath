<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:import href="page_meta.xsl"/>
    <xsl:output method="html"/>
    <xsl:template match="pullRequest">
        <html>
            <head>
                <xsl:call-template name="common_header"/>
            </head>
            <body>
                <section class="section">
                  <div class="container">
                    <h1 class="title">
                        <xsl:text>Pull request # </xsl:text>
                        <xsl:value-of select="@id"/>
                        <xsl:value-of select="concat('. ', title)"/>
                    </h1>
                    <h2 class="subtitle">
                        <xsl:text>Opener: </xsl:text>
                        <a>
                            <xsl:attribute name="href">
                                <xsl:value-of select="opener/openerUrl"/>
                            </xsl:attribute>
                            <xsl:value-of select="opener/openerName"/>
                        </a>
                    </h2>
                    <div class="block">
                        <div class="notification is-info">
                            <xsl:value-of select="body"  disable-output-escaping="yes"/>
                        </div>
                    </div>
                    <a href="pull_requests.xml" class="button is-primary">Back</a>
                   </div>
                </section>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
