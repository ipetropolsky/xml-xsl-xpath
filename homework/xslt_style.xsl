<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:variable name="opened_icon">
   <svg viewBox="0 0 12 16" height="26.7" fill="green" width="20" xmlns="http://www.w3.org/2000/svg"><path d="M11 11.28V5c-.03-.78-.34-1.47-.94-2.06C9.46 2.35 8.78 2.03 8 2H7V0L4 3l3 3V4h1c.27.02.48.11.69.31.21.2.3.42.31.69v6.28A1.993 1.993 0 0 0 10 15a1.993 1.993 0 0 0 1-3.72zm-1 2.92c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zM4 3c0-1.11-.89-2-2-2a1.993 1.993 0 0 0-1 3.72v6.56A1.993 1.993 0 0 0 2 15a1.993 1.993 0 0 0 1-3.72V4.72c.59-.34 1-.98 1-1.72zm-.8 10c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
</xsl:variable>

<xsl:variable name="closed_icon">
   <svg viewBox="0 0 12 16" height="26.7" fill="red" width="20" xmlns="http://www.w3.org/2000/svg"><path d="M11 11.28V5c-.03-.78-.34-1.47-.94-2.06C9.46 2.35 8.78 2.03 8 2H7V0L4 3l3 3V4h1c.27.02.48.11.69.31.21.2.3.42.31.69v6.28A1.993 1.993 0 0 0 10 15a1.993 1.993 0 0 0 1-3.72zm-1 2.92c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zM4 3c0-1.11-.89-2-2-2a1.993 1.993 0 0 0-1 3.72v6.56A1.993 1.993 0 0 0 2 15a1.993 1.993 0 0 0 1-3.72V4.72c.59-.34 1-.98 1-1.72zm-.8 10c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
</xsl:variable>

<xsl:variable name="merged_icon">
   <svg viewBox="0 0 768 1024" height="26.7" fill="purple" width="20" xmlns="http://www.w3.org/2000/svg"><path d="M640 448c-47.625 0-88.625 26.312-110.625 64.906C523.625 512.5 518 512 512 512c-131.062 0-255.438-99.844-300.812-223.438C238.469 265.09400000000005 256 230.71900000000005 256 192c0-70.656-57.344-128-128-128S0 121.34400000000005 0 192c0 47.219 25.844 88.062 64 110.281V721.75C25.844 743.938 0 784.75 0 832c0 70.625 57.344 128 128 128s128-57.375 128-128c0-47.25-25.844-88.062-64-110.25V491.469C276.156 580.5 392.375 640 512 640c6.375 0 11.625-0.438 17.375-0.625C551.5 677.812 592.5 704 640 704c70.625 0 128-57.375 128-128C768 505.344 710.625 448 640 448zM128 896c-35.312 0-64-28.625-64-64 0-35.312 28.688-64 64-64 35.406 0 64 28.688 64 64C192 867.375 163.406 896 128 896zM128 256c-35.312 0-64-28.594-64-64s28.688-64 64-64c35.406 0 64 28.594 64 64S163.406 256 128 256zM640 640c-35.312 0-64-28.625-64-64 0-35.406 28.688-64 64-64 35.375 0 64 28.594 64 64C704 611.375 675.375 640 640 640z"/></svg>
</xsl:variable>

<xsl:variable name="tag_icon">
   <svg version="1.1" id="Capa_1" height="12" width="12" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 100 100" style="enable-background:new 0 0 100 100;" xml:space="preserve"><path style="fill:#6c6c6c;" d="M96.456,2.028c-0.544-1.577-2.248-2.408-3.804-1.859c-1.557,0.549-2.379,2.272-1.837,3.849
            c4.599,13.351-4.53,23.317-11.485,28.657l-2.817-4.072c-0.942-1.361-3.058-2.495-4.699-2.52l-15.777,0.072
            c-1.64-0.026-4.085,0.735-5.43,1.689L4.123,60.786c-2.251,1.596-2.799,4.736-1.223,7.016L24.027,98.34
            c1.577,2.28,4.111,2.007,6.362,0.412l46.483-32.941c1.345-0.955,2.885-3.02,3.426-4.59l4.94-15.731
            c0.538-1.571,0.21-3.969-0.733-5.331l-1.717-2.481C92.139,30.451,101.841,17.665,96.456,2.028z M74.829,48.808
            c-3.603,2.552-8.569,1.665-11.091-1.98c-2.523-3.648-1.648-8.672,1.957-11.227c2.859-2.027,6.573-1.879,9.246,0.088
            c-1.346,0.82-2.269,1.292-2.445,1.376c-1.49,0.712-2.127,2.512-1.426,4.02c0.51,1.095,1.584,1.736,2.705,1.736
            c0.426,0,0.859-0.094,1.271-0.29c0.958-0.457,1.989-1.009,3.064-1.652C78.595,43.845,77.426,46.968,74.829,48.808z"/></svg>
</xsl:variable>


<xsl:template match="labels">
   <xsl:for-each select="label">
      <xsl:choose>
         <xsl:when test="@type='cross'">
         <div class='label bloko-icon bloko-icon_cancel bloko-icon_initial-tertiary'></div>
         </xsl:when>

         <xsl:when test="@type='CLA signed'">
         <div class='label label-CLA-signed'>
            CLA signed
         </div>
         </xsl:when>

         <xsl:when test="@type='checkmark'">
         <div class='label bloko-icon bloko-icon_done bloko-icon_initial-secondary'>
         </div>
         </xsl:when>

         <xsl:when test="@type='tag: bug fix'">
         <div class='label label-bug-fix'>
            tag: bug fix
         </div>
         </xsl:when>

         <xsl:when test="@type='issue: proposal'">
         <div class='label label-issue-proposal'>
            issue: proposal
         </div>
         </xsl:when>
      </xsl:choose>
   </xsl:for-each>
</xsl:template>

<xsl:template match="tags">
   <xsl:for-each select="tag">
      <div class="tag-wrapper">
         <div class="tag-icon">
            <xsl:copy-of select="$tag_icon"></xsl:copy-of>
         </div>
         <div class="tag">
            <xsl:value-of select="."/>
         </div>
      </div>
   </xsl:for-each>
</xsl:template>

<xsl:template match="pullRequest">
   <div class="item-wrapper">
      <div class="pr-icon">
         <xsl:choose>
            <xsl:when test="@status='opened'">
               <xsl:copy-of select="$opened_icon"></xsl:copy-of>
            </xsl:when>
            <xsl:when test="@status='closed'">
               <xsl:copy-of select="$closed_icon"></xsl:copy-of>
            </xsl:when>
            <xsl:when test="@status='merged'">
               <xsl:copy-of select="$merged_icon"></xsl:copy-of>
            </xsl:when>
         </xsl:choose>
      </div>
      <div class="pr-wrapper">
         <div class="pr-top">
            <div class="pr-header">
               <xsl:value-of select="header"/>
            </div>
            <xsl:apply-templates select="labels"/>
         </div>
         <div class="pr-description-wrapper">
            <div class="pr-description"> <a>#</a>
               <xsl:value-of select="@id"/> <a>&#160;was&#160;</a>
               <xsl:value-of select="@status"/> <a>&#160;on&#160;</a> 
               <xsl:value-of select="time"/><a> by </a>
               <xsl:value-of select="author"/>
            </div>
            <xsl:apply-templates select="tags"/>
         </div>   
      </div>
      <xsl:if test="comments!=0">
      <div class='pr-comments-wrapper'>
         <div class='pr-comments-icon bloko-icon bloko-icon_message-outline bloko-icon_default-inverted '></div>
         <div class='pr-comments-quantity'>
            <xsl:value-of select="comments"/>   
         </div>
      </div>
      </xsl:if>
   </div>
</xsl:template>

<xsl:output indent="yes"
            method="html"
            encoding="utf-8"
            doctype-system="about:legacy-compat"/>

<xsl:template match="/">
   <html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
      <title>Homework 2</title>
      <link rel="shortcut icon" href="./pic/hh.png" type="image/png"></link>
      <link rel="stylesheet" href="./styles.css"></link>
      <link rel="stylesheet" href="https://tech.hh.ru/bloko/styles/css/blocks/icon.css"></link>
   </head>
   <body>
   <div class="page-wrapper">
      <h2 class="page-header">Pull Requests</h2>
      <div class="statistics-wrapper">
         <div class="statistics-item">
            <a>Open </a>
            <a><xsl:value-of select="count(page/list/pullRequest[@status='opened'])"/></a>
         </div>
         <div class="statistics-item">
            <a>Closed </a>
            <a><xsl:value-of select="count(page/list/pullRequest[@status='closed' or @status='merged'])"/></a>
         </div>
      </div>
      <div class="list-wrapper">
         <xsl:for-each select="page/list/pullRequest">
            <xsl:apply-templates select="."/>
         </xsl:for-each>
      </div>
   </div>
   </body>
   </html>
</xsl:template>

</xsl:stylesheet> 