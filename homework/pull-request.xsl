<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output indent="yes"
                method="html"
                encoding="utf-8"
                doctype-system="about:legacy-compat"/>

    <xsl:template match="issue">
        <html>
            <head>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.2/css/bulma.min.css"/>
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous"/>
            </head>
            <body>
                <xsl:apply-templates select="title"/>
                <xsl:apply-templates select="comments"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="title">
        <section class="hero">
            <div class="hero-body">
                <h1 class="title">
                    <xsl:value-of select="."/>
                </h1>
            </div>
        </section>
    </xsl:template>

    <xsl:template match="comment">
        <div class="box">
            <article class="media">
            <figure class="media-left">
                <p class="image is-64x64">
                    <img src="{author/icon}"/>
                </p>
            </figure>
            <div class="media-content">
                <div class="content">
                <p>
                    <strong><xsl:value-of select="author/name"/></strong>
                    <small> commented </small>
                    <small><xsl:value-of select="created"/></small>
                    <br/>
                    <xsl:value-of select="text"/>
                </p>
                </div>
            </div>
            </article>
        </div>
    </xsl:template>

</xsl:stylesheet>