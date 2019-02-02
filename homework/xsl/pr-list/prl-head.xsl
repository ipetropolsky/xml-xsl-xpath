<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="AdditionalInfo">
        <div class="columns is-centered has-background-light">
            <div class="column is-one-fifth has-text-weight-semibold">
                <a href="#">
                    <i class="fas fa-code-branch"></i>
                    <xsl:value-of select="OpenedCount"/> open
                </a>
            </div>
            <div class="column is-one-fifth">
                <a href="#">
                    <i class="fas fa-check"></i>
                    <xsl:value-of select="ClosedCount"/> closed
                </a>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
