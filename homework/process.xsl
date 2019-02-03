<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:sxl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/pull_requests">
        <html>
            <head>
                <title>XSLT / XML Path HomeWork</title>
                <link rel="stylesheet" href="style.css"/>
            </head>
            <body>

                <div class="pull-request-list">
                    <div class="pull-request-list__header">
                        <div class="pull-request-list__item">
                            <svg class="octicon" viewBox="0 0 12 16" version="1.1" width="12" height="16"
                                 aria-hidden="true">
                                <path fill-rule="evenodd"
                                      d="M11 11.28V5c-.03-.78-.34-1.47-.94-2.06C9.46 2.35 8.78 2.03 8 2H7V0L4 3l3 3V4h1c.27.02.48.11.69.31.21.2.3.42.31.69v6.28A1.993 1.993 0 0 0 10 15a1.993 1.993 0 0 0 1-3.72zm-1 2.92c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zM4 3c0-1.11-.89-2-2-2a1.993 1.993 0 0 0-1 3.72v6.56A1.993 1.993 0 0 0 2 15a1.993 1.993 0 0 0 1-3.72V4.72c.59-.34 1-.98 1-1.72zm-.8 10c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"></path>
                            </svg>
                            <span class="pull-request-list__header-item"><xsl:value-of select="count(/pull_requests/pr[state='Opened'])"/> Open</span>
                        </div>
                        <div class="pull-request-list__item">
                            <svg class="octicon" viewBox="0 0 12 16" version="1.1" width="12" height="16"
                                 aria-hidden="true">
                                <path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"></path>
                            </svg>
                            <span>
                                <xsl:value-of select="count(/pull_requests/pr[state='Closed'])"/> Closed
                            </span>
                        </div>
                    </div>

                    <xsl:for-each select="/pull_requests/pr">
                        <div class="pull-request-list__row">
                            <div class="pull-request-list__row-closed-icon">
                                <xsl:if test="state='Opened'">
                                    <svg class="octicon open" viewBox="0 0 12 16" version="1.1"
                                         width="12" height="16" aria-hidden="true">
                                        <path fill-rule="evenodd"
                                              d="M11 11.28V5c-.03-.78-.34-1.47-.94-2.06C9.46 2.35 8.78 2.03 8 2H7V0L4 3l3 3V4h1c.27.02.48.11.69.31.21.2.3.42.31.69v6.28A1.993 1.993 0 0 0 10 15a1.993 1.993 0 0 0 1-3.72zm-1 2.92c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zM4 3c0-1.11-.89-2-2-2a1.993 1.993 0 0 0-1 3.72v6.56A1.993 1.993 0 0 0 2 15a1.993 1.993 0 0 0 1-3.72V4.72c.59-.34 1-.98 1-1.72zm-.8 10c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"></path>
                                    </svg>
                                </xsl:if>

                                <xsl:if test="state='Closed'">
                                    <svg class="octicon close" viewBox="0 0 12 16" version="1.1" width="12" height="16"
                                         aria-hidden="true">
                                        <path fill-rule="evenodd"
                                              d="M11 11.28V5c-.03-.78-.34-1.47-.94-2.06C9.46 2.35 8.78 2.03 8 2H7V0L4 3l3 3V4h1c.27.02.48.11.69.31.21.2.3.42.31.69v6.28A1.993 1.993 0 0 0 10 15a1.993 1.993 0 0 0 1-3.72zm-1 2.92c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zM4 3c0-1.11-.89-2-2-2a1.993 1.993 0 0 0-1 3.72v6.56A1.993 1.993 0 0 0 2 15a1.993 1.993 0 0 0 1-3.72V4.72c.59-.34 1-.98 1-1.72zm-.8 10c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"></path>
                                    </svg>
                                </xsl:if>
                            </div>

                            <div class="pull-request-list__row-content">
                                <span>
                                    <xsl:value-of select="pr_title"/>
                                </span>
                                <xsl:if test="check_state='OK'">
                                    <span>
                                        <svg class="octicon octicon-check-ok" viewBox="0 0 12 16" version="1.1"
                                             width="12"
                                             height="16" aria-hidden="true">
                                            <path fill-rule="evenodd"
                                                  d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"></path>
                                        </svg>
                                    </span>
                                </xsl:if>
                                <xsl:if test="check_state!='OK'">
                                    <span class="check--not-ok">
                                        <svg class="octicon octicon-check-not-ok" viewBox="0 0 12 16" version="1.1"
                                             width="12"
                                             height="16" aria-hidden="true">
                                            <path fill-rule="evenodd"
                                                  d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"></path>
                                        </svg>
                                    </span>
                                </xsl:if>
                                <xsl:if test="sla_signed='1'">
                                    <span class="pull-request-list__row-tag sla-signed">SLA Signed</span>
                                </xsl:if>
                                <xsl:for-each select="tags/tag">
                                    <span class="pull-request-list__row-tag {@class}">tag: <xsl:value-of select="@title"/></span>
                                </xsl:for-each>
                                <xsl:if test="state='Opened'">
                                    <div class="pull-request-list__row-additional-info">#<xsl:value-of select="@id"/>
                                        opened
                                        <xsl:value-of select="date"/> by
                                        <xsl:value-of select="creator"/>
                                    </div>
                                </xsl:if>
                                <xsl:if test="state='Closed'">
                                    <div class="pull-request-list__row-additional-info">#<xsl:value-of select="@id"/> by
                                        <xsl:value-of select="creator"/> was closed
                                        <xsl:value-of select="date"/>
                                    </div>
                                </xsl:if>
                            </div>
                            <div class="pull-request-list__row-comment">
                                <a href ='#'>
                                    <svg class="octicon octicon-comment" viewBox="0 0 16 16" version="1.1" width="30"
                                         height="16"
                                         aria-hidden="true">
                                        <path fill-rule="evenodd"
                                              d="M14 1H2c-.55 0-1 .45-1 1v8c0 .55.45 1 1 1h2v3.5L7.5 11H14c.55 0 1-.45 1-1V2c0-.55-.45-1-1-1zm0 9H7l-2 2v-2H2V2h12v8z"></path>
                                    </svg>
                                    <span>
                                        <xsl:value-of select="comment_count"/>
                                    </span>
                                </a>
                            </div>
                        </div>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>