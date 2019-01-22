<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema">
<xsl:output method="html"/>

<xsl:template match="pullRequest">
<html>
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.2/css/bulma.css"/>
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
                Opener: <xsl:value-of select="openerName"/>
            </h2>
            <div class="block">
                <div class="notification is-info">
                    <xsl:value-of select="body"/>
                </div>
            </div>
            <a href="pull_requests.xml" class="button is-primary">Back</a>
        </div>
        </section>
    </body>
</html>
</xsl:template>
</xsl:stylesheet>
