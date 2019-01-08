<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output indent="yes"
                method="html"
                encoding="utf-8"
                media-type="text/html;"
                doctype-system="about:legacy-compat"/>

    <xsl:template match="/">
        <html>
        <head>
            <title>Pull Requests</title>
            <link href="./main.css" rel="stylesheet" media="all" />
        </head>
        <body class="page_body">
            <div class="list-header">
                <xsl:apply-templates select="pullRequestsList"/>
            </div>
            <div class="list-body">
                <xsl:apply-templates select="/pullRequestsList/pullRequest"/>
            </div>
        </body>
        </html>
    </xsl:template>

    <xsl:template match="pullRequest">
        <div class="list-item">
            <div class="list-item_base-info">
                <div class="list-item_left-part">
                    <div class="list-item_icon">
                        <svg class="octicon open" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true">
                            <path fill-rule="evenodd" d="M11 11.28V5c-.03-.78-.34-1.47-.94-2.06C9.46 2.35 8.78 2.03 8 2H7V0L4 3l3 3V4h1c.27.02.48.11.69.31.21.2.3.42.31.69v6.28A1.993 1.993 0 0 0 10 15a1.993 1.993 0 0 0 1-3.72zm-1 2.92c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zM4 3c0-1.11-.89-2-2-2a1.993 1.993 0 0 0-1 3.72v6.56A1.993 1.993 0 0 0 2 15a1.993 1.993 0 0 0 1-3.72V4.72c.59-.34 1-.98 1-1.72zm-.8 10c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"></path>
                        </svg>
                    </div>
                    <div class="list-item_content"><xsl:value-of select="./title"/></div>
                    <div class="list-item_status">
                        <xsl:choose>
                            <xsl:when test="count(./checks/check[status = 'failed']) &gt; 0">
                                <svg class="octicon octicon-x" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true">
                                    <path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"></path>
                                </svg>
                            </xsl:when>
                            <xsl:otherwise>
                                <svg class="octicon octicon-check" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true">
                                    <path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"></path>
                                </svg>
                            </xsl:otherwise>
                        </xsl:choose>
                    </div>
                    <div class="list-item_labels">
                        <xsl:apply-templates select="./labels/label"/>
                    </div>
                </div>
                <div class="list-item_right-part">
                    <div class="list-item_comments">
                        <div class="list-item_comments-icon">
                            <svg class="octicon octicon-comment v-align-middle" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true">
                                <path fill-rule="evenodd" d="M14 1H2c-.55 0-1 .45-1 1v8c0 .55.45 1 1 1h2v3.5L7.5 11H14c.55 0 1-.45 1-1V2c0-.55-.45-1-1-1zm0 9H7l-2 2v-2H2V2h12v8z"></path>
                            </svg>
                        </div>
                        <div class="list-item_comments-content"><xsl:value-of select="count(./comments/comment)"/></div>
                    </div>
                </div>
            </div>
            <div class="list-item_additional-info">
                <div class="pr-number">#<xsl:value-of select="@number"/></div>
                <div class="pr-date">created at <xsl:value-of select="./createdAt"/></div>
                <div class="pr-author">by <xsl:value-of select="./user/login"/></div>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="pullRequestsList">
        <div class="statistics">
            <div class="statistics-item">
                <div class="statistics-item_icon">
                    <svg class="octicon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true">
                        <path fill-rule="evenodd" d="M11 11.28V5c-.03-.78-.34-1.47-.94-2.06C9.46 2.35 8.78 2.03 8 2H7V0L4 3l3 3V4h1c.27.02.48.11.69.31.21.2.3.42.31.69v6.28A1.993 1.993 0 0 0 10 15a1.993 1.993 0 0 0 1-3.72zm-1 2.92c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zM4 3c0-1.11-.89-2-2-2a1.993 1.993 0 0 0-1 3.72v6.56A1.993 1.993 0 0 0 2 15a1.993 1.993 0 0 0 1-3.72V4.72c.59-.34 1-.98 1-1.72zm-.8 10c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"></path>
                    </svg>
                </div>
                <div class="statistics-item_content"><xsl:value-of select="count(/pullRequestsList/pullRequest[@state='open'])"/> Open</div>
            </div>
            <div class="statistics-item">
                <div class="statistics-item_icon">
                    <svg class="octicon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true">
                        <path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"></path>
                    </svg>
                </div>
                <div class="statistics-item_content"><xsl:value-of select="count(/pullRequestsList/pullRequest[@state='closed'])"/> Closed</div>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="label">
        <div class="list-item_label"><xsl:value-of select="./name"/></div>
    </xsl:template>

</xsl:stylesheet>