<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:variable name="pr_icon_merged">
    <svg viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true">
      <path fill-rule="evenodd" d="M10 7c-.73 0-1.38.41-1.73 1.02V8C7.22 7.98 6 7.64 5.14 6.98c-.75-.58-1.5-1.61-1.89-2.44A1.993 1.993 0 0 0 2 .99C.89.99 0 1.89 0 3a2 2 0 0 0 1 1.72v6.56c-.59.35-1 .99-1 1.72 0 1.11.89 2 2 2a1.993 1.993 0 0 0 1-3.72V7.67c.67.7 1.44 1.27 2.3 1.69.86.42 2.03.63 2.97.64v-.02c.36.61 1 1.02 1.73 1.02 1.11 0 2-.89 2-2 0-1.11-.89-2-2-2zm-6.8 6c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm8 6c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z">
      </path>
    </svg>
  </xsl:variable>

  <xsl:variable name="pr_icon">
    <svg viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true">
      <path fill-rule="evenodd" d="M11 11.28V5c-.03-.78-.34-1.47-.94-2.06C9.46 2.35 8.78 2.03 8 2H7V0L4 3l3 3V4h1c.27.02.48.11.69.31.21.2.3.42.31.69v6.28A1.993 1.993 0 0 0 10 15a1.993 1.993 0 0 0 1-3.72zm-1 2.92c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zM4 3c0-1.11-.89-2-2-2a1.993 1.993 0 0 0-1 3.72v6.56A1.993 1.993 0 0 0 2 15a1.993 1.993 0 0 0 1-3.72V4.72c.59-.34 1-.98 1-1.72zm-.8 10c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z">
      </path>
    </svg>
  </xsl:variable>

  <xsl:variable name="icon_check">
    <svg viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true">
      <path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z">
      </path>
    </svg>
  </xsl:variable>

  <xsl:variable name="icon_x">
    <svg viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true">
      <path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z">
      </path>
    </svg>
  </xsl:variable>

  <xsl:variable name="icon_comments">
    <svg viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true">
      <path fill-rule="evenodd" d="M14 1H2c-.55 0-1 .45-1 1v8c0 .55.45 1 1 1h2v3.5L7.5 11H14c.55 0 1-.45 1-1V2c0-.55-.45-1-1-1zm0 9H7l-2 2v-2H2V2h12v8z">
      </path>
    </svg>
  </xsl:variable>

  <xsl:output method="html" encoding="utf-8" indent="yes"
              doctype-system="about:legacy-compat"/>

  <xsl:template match="/pulls">
    <html>
      <head>
        <title>Pull Requests</title>
        <link rel="stylesheet" href="./style.css"/>
      </head>
      <body>
        <div class="pull-requests">
          <div class="pull-requests-count">
            <div class="pull-requests-count-open">
              <xsl:copy-of select="$pr_icon"/>
              <xsl:value-of select="count(pull[status='open'])"/>
              <xsl:text> Open</xsl:text>
            </div>
            <div class="pull-requests-count-closed">
              <xsl:copy-of select="$icon_check"/>
              <xsl:value-of select="count(pull[status='closed' or status='merged'])"/>
              <xsl:text> Closed</xsl:text>
            </div>
          </div>
          <xsl:apply-templates select="pull"/>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="pull[status='open']">
    <div class="pull-request">
      <div class="pull-request-icon pull-request-icon-open">
        <xsl:copy-of select="$pr_icon"/>
      </div>
      <xsl:apply-templates select="." mode="data"/>
    </div>
  </xsl:template>

  <xsl:template match="pull[status='closed']">
    <div class="pull-request">
      <div class="pull-request-icon pull-request-icon-closed">
        <xsl:copy-of select="$pr_icon"/>
      </div>
      <xsl:apply-templates select="." mode="data"/>
    </div>
  </xsl:template>

  <xsl:template match="pull[status='merged']">
    <div class="pull-request">
      <div class="pull-request-icon pull-request-icon-merged">
        <xsl:copy-of select="$pr_icon_merged"/>
      </div>
      <xsl:apply-templates select="." mode="data"/>
    </div>
  </xsl:template>

  <xsl:template match="pull" mode="data">
    <div class="pull-request-data">
      <div class="pr-title-labels-comments">
        <div class="pr-title-and-labels">
          <xsl:apply-templates select="." mode="title"/>
          <xsl:apply-templates select="." mode="checks"/>
          <span class="labels">
            <xsl:apply-templates select="labels"/>
          </span>
        </div>
        <xsl:apply-templates select="@comments"/>
      </div>
      <div class="pr-date-and-author">
        <xsl:apply-templates select="." mode="date_and_author"/>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="@comments">
    <span class="comments">
      <xsl:copy-of select="$icon_comments"/>
      <xsl:value-of select="."/>
    </span>
  </xsl:template>

  <xsl:template match="pull[status='open']" mode="date_and_author">
    #<xsl:value-of select="@id"/> opened <xsl:value-of select="created"/>
    by <xsl:apply-templates select="author"/>
  </xsl:template>

  <xsl:template match="pull[status='merged']" mode="date_and_author">
    <span>#<xsl:value-of select="@id"/></span> by <xsl:apply-templates select="author"/>
    merged <xsl:value-of select="merged"/>
  </xsl:template>

  <xsl:template match="pull[status='closed']" mode="date_and_author">
    <span>#<xsl:value-of select="@id"/></span> by <xsl:apply-templates select="author"/>
    closed <xsl:value-of select="closed"/>
  </xsl:template>

  <xsl:template match="author">
    <a class="pr-author"
       href="{concat('https://github.com/', /pulls/@user, '/', /pulls/@repo,
                     '/issues?q=is%3Apr+author%3A', .)}">
      <xsl:value-of select="."/>
    </a>
  </xsl:template>

  <xsl:template match="label">
    <span class="label">
      <xsl:attribute name="data-label">
        <xsl:value-of select="."/>
      </xsl:attribute>
      <xsl:value-of select="."/>
    </span>
  </xsl:template>

  <xsl:template match="pull" mode="checks">
    <span title="{concat(@checksPassed, ' / ', @checksTotal, ' checks OK')}">
      <xsl:apply-templates select="@checksSuccess"/>
    </span>
  </xsl:template>

  <xsl:template match="@checksSuccess[.='true']">
    <xsl:attribute name="class">
      <xsl:text>checks checks-success</xsl:text>
    </xsl:attribute>
    <xsl:copy-of select="$icon_check"/>
  </xsl:template>

  <xsl:template match="@checksSuccess[.='false']">
    <xsl:attribute name="class">
      <xsl:text>checks checks-failed</xsl:text>
    </xsl:attribute>
    <xsl:copy-of select="$icon_x"/>
  </xsl:template>

  <xsl:template match="pull" mode="title">
    <a class="pr-title"
       href="{concat('https://github.com/', /pulls/@user, '/', /pulls/@repo, '/pull/', @id)}">
      <xsl:value-of select="title"/>
    </a>
  </xsl:template>

</xsl:stylesheet>
