<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" version="4.0" indent="yes" encoding="utf-8"/>

    <xsl:template match="/pr_list">
        <html>
            <head>
        	    <title>pr_list</title>
                <link rel="stylesheet" type="text/css" href="styles.css"/>
            </head>
            <body>
                <div class="wrapper">
	                <b>
    	                <xsl:value-of select="'Requests'"/>
        	        </b>
        	        <ul class="request_list">
        	    	    <xsl:apply-templates select="pull_requests/request" mode="mode1"/>
                    </ul>
                </div>        	    	
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="request" mode="mode1">
        <li class="request_row">
            <div class="primary_info_block">
        	    <div>
        		    <xsl:attribute name="class">
				    <xsl:value-of select="status"/>
				    </xsl:attribute>
        	    </div>
        	    <div class="description">
        	        <xsl:value-of select="description"/>
        	    </div>
        	    <div>
        	        <xsl:attribute name="class">
				    <xsl:value-of select="check_flag"/>
				    </xsl:attribute>
        	    </div>
        	    <div class="tags">
        	        <xsl:value-of select="tags"/>
        	    </div>
            </div>
        	<div class="comments_block">
        	    <div class="comments_picture"></div>
        	    <div class="comments">
        	        <xsl:value-of select="comments_number"/>
        	    </div>
        	</div>
        	<div class="additional_info_block">
        	    <div class="request_id">
        	        #<xsl:value-of select="@id"/>
        	    </div>
        	    <div class="date">
        	        on <xsl:value-of select="date/day"/>.<xsl:value-of select="date/month"/>.<xsl:value-of select="date/year"/> at <xsl:value-of select="date/hours"/>:<xsl:value-of select="date/minutes"/>:<xsl:value-of select="date/seconds"/> GMT <xsl:value-of select="date/time_zone"/>
        	    </div>
        	    <div class="author">
        	        by <xsl:value-of select="author"/>
        	    </div>
        	</div>
        </li>
    </xsl:template>

</xsl:stylesheet>
