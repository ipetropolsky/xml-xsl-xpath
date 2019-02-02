<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="prl-head.xsl"/>
    <xsl:import href="prl-item.xsl"/>

    <xsl:output indent="yes"
                method="html"
                encoding="utf-8"
                doctype-system="about:legacy-compat"/>

    <xsl:template match="/">
        <html>
            <head>
                <meta charset="utf-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <title>Pull requests</title>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.2/css/bulma.min.css"/>
                <script src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"/>
                <style>.svg-inline--fa {margin: 0 5px;}</style>
            </head>
            <body>
                <section class="section">
                    <div class="container">
                        <div class="columns is-centered">
                            <div class="column is-full is-two-thirds box">
                                <xsl:apply-templates select="/PullRequests/AdditionalInfo" />
                                <xsl:apply-templates select="/PullRequests/Elements/PullRequest" />
                            </div>
                        </div>
                    </div>
                </section>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
