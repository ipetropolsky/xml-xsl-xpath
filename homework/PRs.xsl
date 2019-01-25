<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output indent="yes"
                method="html"
                encoding="utf-8"
                doctype-system="about:legacy-compat"/>

    <xsl:template match="/pulls">
        <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
            <title>Pull Requests</title>
            <link rel="stylesheet" href="style.css"/>
        </head>
        <body>
            <div class="pulls_table">
                <div class="stats">
                    <div class="stats__item">
                        <svg class="octicon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true">
                            <path fill-rule="evenodd" d="M11 11.28V5c-.03-.78-.34-1.47-.94-2.06C9.46 2.35 8.78 2.03 8 2H7V0L4 3l3 3V4h1c.27.02.48.11.69.31.21.2.3.42.31.69v6.28A1.993 1.993 0 0 0 10 15a1.993 1.993 0 0 0 1-3.72zm-1 2.92c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zM4 3c0-1.11-.89-2-2-2a1.993 1.993 0 0 0-1 3.72v6.56A1.993 1.993 0 0 0 2 15a1.993 1.993 0 0 0 1-3.72V4.72c.59-.34 1-.98 1-1.72zm-.8 10c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"></path>
                        </svg>
                        <span><xsl:value-of select="count(/pulls/pull[@status='open'])"/> Open</span>
                    </div>
                    <div class="stats__item">
                        <svg class="octicon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true">
                            <path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"></path>
                        </svg>
                        <span><xsl:value-of select="count(/pulls/pull[@status='close'])+count(/pulls/pull[@status='merge'])"/> Closed</span>
                    </div>
                </div>
                <xsl:for-each select="/pulls/pull">
                    <div class="pull">
                        <div class="pull__col">
                            <xsl:if test="@status='open'">
                                <svg class="octicon open" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true">
                                    <path fill-rule="evenodd" d="M11 11.28V5c-.03-.78-.34-1.47-.94-2.06C9.46 2.35 8.78 2.03 8 2H7V0L4 3l3 3V4h1c.27.02.48.11.69.31.21.2.3.42.31.69v6.28A1.993 1.993 0 0 0 10 15a1.993 1.993 0 0 0 1-3.72zm-1 2.92c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zM4 3c0-1.11-.89-2-2-2a1.993 1.993 0 0 0-1 3.72v6.56A1.993 1.993 0 0 0 2 15a1.993 1.993 0 0 0 1-3.72V4.72c.59-.34 1-.98 1-1.72zm-.8 10c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"></path>
                                </svg>
                            </xsl:if>
                            <xsl:if test="@status='close'">
                                <svg class="octicon close" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true">
                                    <path fill-rule="evenodd" d="M11 11.28V5c-.03-.78-.34-1.47-.94-2.06C9.46 2.35 8.78 2.03 8 2H7V0L4 3l3 3V4h1c.27.02.48.11.69.31.21.2.3.42.31.69v6.28A1.993 1.993 0 0 0 10 15a1.993 1.993 0 0 0 1-3.72zm-1 2.92c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zM4 3c0-1.11-.89-2-2-2a1.993 1.993 0 0 0-1 3.72v6.56A1.993 1.993 0 0 0 2 15a1.993 1.993 0 0 0 1-3.72V4.72c.59-.34 1-.98 1-1.72zm-.8 10c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"></path>
                                </svg>
                            </xsl:if>
                            <xsl:if test="@status='merge'">
                                <svg class="octicon merge" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true">
                                    <path fill-rule="evenodd" d="M11 11.28V5c-.03-.78-.34-1.47-.94-2.06C9.46 2.35 8.78 2.03 8 2H7V0L4 3l3 3V4h1c.27.02.48.11.69.31.21.2.3.42.31.69v6.28A1.993 1.993 0 0 0 10 15a1.993 1.993 0 0 0 1-3.72zm-1 2.92c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zM4 3c0-1.11-.89-2-2-2a1.993 1.993 0 0 0-1 3.72v6.56A1.993 1.993 0 0 0 2 15a1.993 1.993 0 0 0 1-3.72V4.72c.59-.34 1-.98 1-1.72zm-.8 10c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"></path>
                                </svg>
                            </xsl:if>
                        </div>
                        <div class="pull__col pull__col_grow">
                            <span><xsl:value-of select="title"/></span>
                            <xsl:if test="check='OK'">
                                <span class="check-ok">
                                    <svg class="octicon octicon-check" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true">
                                        <path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"></path>
                                    </svg>
                                </span>
                            </xsl:if>
                            <xsl:if test="check='X'">
                                <span class="check-X">
                                    <svg class="octicon octicon-x" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true">
                                        <path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"></path>
                                    </svg>
                                </span>
                            </xsl:if>
                            <xsl:for-each select="tags/tag">
                                <xsl:if test="@color='green'">
                                    <span class="tag" style="background-color:#009900; color:#fff;"><xsl:value-of select="@title"/></span>
                                </xsl:if>
                                <xsl:if test="@color='blue'">
                                    <span class="tag" style="background-color:#1d76db; color:#fff;"><xsl:value-of select="@title"/></span>
                                </xsl:if>
                                <xsl:if test="@color='red'">
                                    <span class="tag" style="background-color:#e11d21; color:#fff;"><xsl:value-of select="@title"/></span>
                                </xsl:if>
                                <xsl:if test="@color='yellow'">
                                    <span class="tag" style="background-color:#fbca04; color:#000;"><xsl:value-of select="@title"/></span>
                                </xsl:if>
                            </xsl:for-each>
                            <xsl:if test="@status='open'">
                                <div class="creator-info">#<xsl:value-of select="@id"/> opened <xsl:value-of select="date"/> by <xsl:value-of select="author"/></div>
                            </xsl:if>
                            <xsl:if test="@status='close'">
                                <div class="creator-info">#<xsl:value-of select="@id"/> by <xsl:value-of select="author"/> was closed <xsl:value-of select="date"/></div>
                            </xsl:if>
                            <xsl:if test="@status='merged'">
                                <div class="creator-info">#<xsl:value-of select="@id"/> by <xsl:value-of select="author"/> was merged <xsl:value-of select="date"/></div>
                            </xsl:if>
                        </div>
                        <div class="pull__col">
                            <svg class="octicon octicon-comment" viewBox="0 0 16 16" version="1.1" width="30" height="16"
                                 aria-hidden="true">
                                <path fill-rule="evenodd" d="M14 1H2c-.55 0-1 .45-1 1v8c0 .55.45 1 1 1h2v3.5L7.5 11H14c.55 0 1-.45 1-1V2c0-.55-.45-1-1-1zm0 9H7l-2 2v-2H2V2h12v8z"></path>
                            </svg>
                            <span><xsl:value-of select="comments"/></span>
                        </div>
                    </div>
                </xsl:for-each>
            </div>
        </body>
        </html>
    </xsl:template>

</xsl:stylesheet>