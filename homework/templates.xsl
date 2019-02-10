<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output indent="yes"
                method="html"
                encoding="utf-8"/>

    <xsl:variable name="header_icon_opened">
        <svg class="headline__number_of_open" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true">
            <path fill-rule="evenodd" d="M11 11.28V5c-.03-.78-.34-1.47-.94-2.06C9.46 2.35 8.78 2.03 8 2H7V0L4 3l3 3V4h1c.27.02.48.11.69.31.21.2.3.42.31.69v6.28A1.993 1.993 0 0 0 10 15a1.993 1.993 0 0 0 1-3.72zm-1 2.92c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zM4 3c0-1.11-.89-2-2-2a1.993 1.993 0 0 0-1 3.72v6.56A1.993 1.993 0 0 0 2 15a1.993 1.993 0 0 0 1-3.72V4.72c.59-.34 1-.98 1-1.72zm-.8 10c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z">
            </path>
        </svg>
    </xsl:variable>

    <xsl:variable name="header_icon_closed">
        <svg class="headline__number_of_closed" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true">
            <path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z">
            </path>
        </svg>
    </xsl:variable>

    <xsl:variable name="pr_icon_open">
        <svg class="pr_icon_open" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true">
            <path  fill-rule="evenodd" d="M11 11.28V5c-.03-.78-.34-1.47-.94-2.06C9.46 2.35 8.78 2.03 8 2H7V0L4 3l3 3V4h1c.27.02.48.11.69.31.21.2.3.42.31.69v6.28A1.993 1.993 0 0 0 10 15a1.993 1.993 0 0 0 1-3.72zm-1 2.92c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zM4 3c0-1.11-.89-2-2-2a1.993 1.993 0 0 0-1 3.72v6.56A1.993 1.993 0 0 0 2 15a1.993 1.993 0 0 0 1-3.72V4.72c.59-.34 1-.98 1-1.72zm-.8 10c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z">
            </path>
        </svg>
    </xsl:variable>

    <xsl:variable name="pr_icon_merge">
        <svg class="pr_icon_merge" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true">
            <path  fill-rule="evenodd" d="M10 7c-.73 0-1.38.41-1.73 1.02V8C7.22 7.98 6 7.64 5.14 6.98c-.75-.58-1.5-1.61-1.89-2.44A1.993 1.993 0 0 0 2 .99C.89.99 0 1.89 0 3a2 2 0 0 0 1 1.72v6.56c-.59.35-1 .99-1 1.72 0 1.11.89 2 2 2a1.993 1.993 0 0 0 1-3.72V7.67c.67.7 1.44 1.27 2.3 1.69.86.42 2.03.63 2.97.64v-.02c.36.61 1 1.02 1.73 1.02 1.11 0 2-.89 2-2 0-1.11-.89-2-2-2zm-6.8 6c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm8 6c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z">
            </path>
        </svg>
    </xsl:variable>

    <xsl:variable name="pr_icon_close">
        <svg class="pr_icon_close" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true">
            <path fill-rule="evenodd" d="M11 11.28V5c-.03-.78-.34-1.47-.94-2.06C9.46 2.35 8.78 2.03 8 2H7V0L4 3l3 3V4h1c.27.02.48.11.69.31.21.2.3.42.31.69v6.28A1.993 1.993 0 0 0 10 15a1.993 1.993 0 0 0 1-3.72zm-1 2.92c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zM4 3c0-1.11-.89-2-2-2a1.993 1.993 0 0 0-1 3.72v6.56A1.993 1.993 0 0 0 2 15a1.993 1.993 0 0 0 1-3.72V4.72c.59-.34 1-.98 1-1.72zm-.8 10c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z">
            </path>
        </svg>
    </xsl:variable>

    <xsl:variable name="pr_icon_x">
        <svg viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true">
            <path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z">
            </path>
        </svg>
    </xsl:variable>

    <xsl:variable name="pr_icon_message">
        <svg viewBox="0 0 16 16" version="1.1" width="12" height="16" aria-hidden="true">
            <path fill-rule="evenodd" d="M14 1H2c-.55 0-1 .45-1 1v8c0 .55.45 1 1 1h2v3.5L7.5 11H14c.55 0 1-.45 1-1V2c0-.55-.45-1-1-1zm0 9H7l-2 2v-2H2V2h12v8z">
            </path>
        </svg>
    </xsl:variable>

    <xsl:template match="pullRequestsList">
        <html>
            <head>
                <title>List_of_pull_requests.XML</title>
                <link rel="stylesheet" type="text/css" href="./style.css"/>
            </head>
            <body>
                <div class="modal-wrapper">
                    <div class="modal">
                        <div class="headline">
                            <div class="headline__number_of_pull_requests">
                                <xsl:copy-of select="$header_icon_opened"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="count(pullRequest[status = 'opened'])"/>
                                <xsl:text> Open </xsl:text>
                                <xsl:copy-of select="$header_icon_closed"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="count(pullRequest[status = 'closed'])"/>
                                <xsl:text> Closed</xsl:text>
                            </div>
                        </div>
                        <xsl:apply-templates mode="pr_list"/>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="pullRequest[state = 'open']" mode="pr_list">
        <div class="pull-request__row-wrapper opened" aria-selected="false">
            <div class="pull-request__row">
                <div class="pull-request__badge">
                    <xsl:copy-of select="$pr_icon_open"/>
                </div>
                <div class="pull-request__content">
                    <xsl:apply-templates select="." mode="pr_content"/>
                </div>
            </div>
            <div class="pull-request__under-row">
                <div class="pull-request__info">
                    <xsl:apply-templates select="." mode="pr_under_row"/>
                </div>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="pullRequest[state = 'merge']" mode="pr_list">
        <div class="pull-request__row-wrapper merged" aria-selected="false">
            <div class="pull-request__row">
                <div class="pull-request__badge">
                    <xsl:copy-of select="$pr_icon_merge"/>
                </div>
                <div class="pull-request__content">
                    <xsl:apply-templates select="." mode="pr_content"/>
                </div>
            </div>
            <div class="pull-request__under-row">
                <div class="pull-request__info">
                    <xsl:apply-templates select="." mode="pr_under_row"/>
                </div>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="pullRequest[state = 'close']" mode="pr_list">
        <div class="pull-request__row-wrapper closed" aria-selected="false">
            <div class="pull-request__row">
                <div class="pull-request__badge">
                    <xsl:copy-of select="$pr_icon_close"/>
                </div>
                <div class="pull-request__content">
                    <xsl:apply-templates select="." mode="pr_content"/>
                </div>
            </div>
            <div class="pull-request__under-row">
                <div class="pull-request__info">
                    <xsl:apply-templates select="." mode="pr_under_row"/>
                </div>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="pullRequest" mode="pr_content">
        <div class="pull-request-content__info row-content">
            <a href="{concat('https', '://github.com/facebook/create-react-app/pull/', id)}">
                <xsl:value-of select="info"/>
            </a>
        </div>
        <div class="pull-request__content__commit row-content">
            <a href="{concat('https', '://github.com/facebook/create-react-app/pull/', id, '#partial-pull-merging')}">
                <xsl:copy-of select="$pr_icon_x"/>
            </a>
        </div>
        <div class="pull-request__content__labels">
            <xsl:apply-templates select="labels" mode="pr_labels"/>
        </div>
        <div class="pull-request__AvatarStack">
            <a href="{concat('https', '://github.com/facebook/create-react-app/pull/', id)}">
                <xsl:copy-of select="$pr_icon_message"/>
                <span>
                    <xsl:value-of select="messages"/>
                </span>
            </a>
        </div>
    </xsl:template>

    <xsl:template match="label" mode="pr_labels">
        <span class="pull-request__content__label row-content" type-label="{.}">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>

    <xsl:template match="pullRequest[state = 'open']" mode="pr_under_row">
        # <xsl:value-of select="id"/> opened by
        <a href="{concat('https', '://github.com/facebook/create-react-app/pulls/', author)}">
            <xsl:value-of select="author"/>
        </a>
        at <xsl:value-of select="date"/>
    </xsl:template>

    <xsl:template match="pullRequest[state = 'merge']" mode="pr_under_row">
        # <xsl:value-of select="id"/> by
        <a href="{concat('https', '://github.com/facebook/create-react-app/pulls?q=is%3Apr+author%3A', author)}">
            <xsl:value-of select="author"/>
        </a>
        merged <xsl:value-of select="date"/>
    </xsl:template>

    <xsl:template match="pullRequest[state = 'close']" mode="pr_under_row">
        # <xsl:value-of select="id"/> closed by
        <a href="{concat('https', '://github.com/facebook/create-react-app/pulls?q=is%3Apr+author%3A', author)}">
            <xsl:value-of select="author"/>
        </a>
        at <xsl:value-of select="date"/>
    </xsl:template>

</xsl:stylesheet>
