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
                        <div class="title">
                            <h3 class="page-title">Pull Requests</h3>

                            <h5 style="margin-left:auto;">Open:
                                <xsl:value-of select="count(//pull/type[text()='Open pull request'])"/>
                            </h5>
                            <h5>Closed:
                                <xsl:value-of select="count(//pull/type[text()='Closed pull request'])"/>
                            </h5>
                            <h5>Merged:
                                <xsl:value-of select="count(//pull/type[text()='Merged pull request'])"/>
                            </h5>
                        </div>

                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Type</th>
                                    <th scope="col">Checks</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Author</th>
                                    <th scope="col">Tags</th>
                                    <th scope="col">Comments</th>
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
                <!--<xsl:value-of select="type"/>-->
                <xsl:apply-templates select="type"/>
            </td>
            <td>
                <xsl:apply-templates select="status"/>
            </td>
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
        </tr>
    </xsl:template>

    <xsl:template match="type[text()='Open pull request']">
        <span data-toggle="tooltip" data-placement="bottom" title="Open">
            <svg class="svg-type" viewBox="0 0 12 16" version="1.1" width="12" height="16"
                 aria-hidden="true">
                <path style="fill:#55BB55;" fill-rule="evenodd"
                      d="M11 11.28V5c-.03-.78-.34-1.47-.94-2.06C9.46 2.35 8.78 2.03 8 2H7V0L4 3l3 3V4h1c.27.02.48.11.69.31.21.2.3.42.31.69v6.28A1.993 1.993 0 0 0 10 15a1.993 1.993 0 0 0 1-3.72zm-1 2.92c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zM4 3c0-1.11-.89-2-2-2a1.993 1.993 0 0 0-1 3.72v6.56A1.993 1.993 0 0 0 2 15a1.993 1.993 0 0 0 1-3.72V4.72c.59-.34 1-.98 1-1.72zm-.8 10c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"></path>
            </svg>
        </span>
    </xsl:template>

    <xsl:template match="type[text()='Closed pull request']">
        <span data-toggle="tooltip" data-placement="bottom" title="Closed">
            <svg class="svg-type" viewBox="0 0 12 16" version="1.1" width="12" height="16"
                 aria-hidden="true">
                <path style="fill:#BB5555;" fill-rule="evenodd"
                      d="M11 11.28V5c-.03-.78-.34-1.47-.94-2.06C9.46 2.35 8.78 2.03 8 2H7V0L4 3l3 3V4h1c.27.02.48.11.69.31.21.2.3.42.31.69v6.28A1.993 1.993 0 0 0 10 15a1.993 1.993 0 0 0 1-3.72zm-1 2.92c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zM4 3c0-1.11-.89-2-2-2a1.993 1.993 0 0 0-1 3.72v6.56A1.993 1.993 0 0 0 2 15a1.993 1.993 0 0 0 1-3.72V4.72c.59-.34 1-.98 1-1.72zm-.8 10c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"></path>
            </svg>
        </span>
    </xsl:template>

    <xsl:template match="type[text()='Merged pull request']">
        <span data-toggle="tooltip" data-placement="bottom" title="Merged">
            <svg class="svg-type" viewBox="0 0 12 16" version="1.1" width="12" height="16"
                 aria-hidden="true">
                <path style="fill:#0000FF;" fill-rule="evenodd"
                      d="M10 7c-.73 0-1.38.41-1.73 1.02V8C7.22 7.98 6 7.64 5.14 6.98c-.75-.58-1.5-1.61-1.89-2.44A1.993 1.993 0 0 0 2 .99C.89.99 0 1.89 0 3a2 2 0 0 0 1 1.72v6.56c-.59.35-1 .99-1 1.72 0 1.11.89 2 2 2a1.993 1.993 0 0 0 1-3.72V7.67c.67.7 1.44 1.27 2.3 1.69.86.42 2.03.63 2.97.64v-.02c.36.61 1 1.02 1.73 1.02 1.11 0 2-.89 2-2 0-1.11-.89-2-2-2zm-6.8 6c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm8 6c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"></path>
            </svg>
        </span>
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
