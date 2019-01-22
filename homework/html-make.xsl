<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output indent="yes"
                method="html"
                encoding="utf-8"/>
    <xsl:strip-space elements="*"/>

    <xsl:template name="root" match="pulls">
        <html>
            <head>
                <META http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <script src="resources/bootstrap/js/bootstrap.js"/>
                <link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css"/>
                <link rel="stylesheet" href="resources/css/main.css"/>
            </head>
            <boby>
                <div class="grid row">
                    <div class="col"/>
                    <div class="col-6">
                        <h3 class="page-title">Pull Requests</h3>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Date</th>
                                    <th scope="col">Author</th>
                                    <th scope="col">Tags</th>
                                    <th scope="col">Comments</th>
                                    <th scope="col">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:apply-templates select="pull"/>
                            </tbody>
                        </table>
                    </div>
                    <div class="col"/>
                </div>
            </boby>
        </html>
    </xsl:template>

    <xsl:template match="pull">
        <tr>
            <td>
                <xsl:value-of select="date"/>
            </td>
            <td>
                <xsl:value-of select="author"/>
            </td>
            <td>
                <xsl:apply-templates select="tags/tag"/>
            </td>
            <td>
                <xsl:apply-templates select="comments"/>
            </td>
            <td>
                <xsl:apply-templates select="status"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="comments[text()!='']">
        <svg class="svg-messages" viewBox="0 0 16 16" version="1.1" width="16"
             height="16" aria-hidden="true">
            <path fill-rule="evenodd"
                  d="M14 1H2c-.55 0-1 .45-1 1v8c0 .55.45 1 1 1h2v3.5L7.5 11H14c.55 0 1-.45 1-1V2c0-.55-.45-1-1-1zm0 9H7l-2 2v-2H2V2h12v8z"></path>
        </svg>
        <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="tags/tag">
        <span class="badge badge-secondary">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>

    <xsl:template match="passed[text() = 'true']">
        <svg xmlns="http://www.w3.org/2000/svg" width="8" height="8" viewBox="0 0 8 8">
            <path style="fill:#00FF00;"
                  d="M6.41 0l-.69.72-2.78 2.78-.81-.78-.72-.72-1.41 1.41.72.72 1.5 1.5.69.72.72-.72 3.5-3.5.72-.72-1.44-1.41z"
                  transform="translate(0 1)"/>
        </svg>
    </xsl:template>

    <xsl:template match="passed[text() != 'true']">
            <svg xmlns="http://www.w3.org/2000/svg" width="8" height="8" viewBox="0 0 8 8">
                <path style="fill:#FF0000;"
                      d="M1.41 0l-1.41 1.41.72.72 1.78 1.81-1.78 1.78-.72.69 1.41 1.44.72-.72 1.81-1.81 1.78 1.81.69.72 1.44-1.44-.72-.69-1.81-1.78 1.81-1.81.72-.72-1.44-1.41-.69.72-1.78 1.78-1.81-1.78-.72-.72z"/>
            </svg>
    </xsl:template>


</xsl:stylesheet>
