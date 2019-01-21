<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output indent="yes"
                method="xml"
                encoding="utf-8"/>

    <xsl:template match="div[@class='js-navigation-container js-active-navigation-container']">
        <!--<?xml version="1.0" encoding="utf-8"?>-->
        <pulls>
            <xsl:for-each select="//div[@class='d-table table-fixed width-full Box-row--drag-hide position-relative']">
                <pull>
                    <author>
                        <xsl:value-of select=".//span[@class='opened-by']/a"/>
                    </author>
                    <tags>
                        <xsl:for-each select=".//span[@class='labels lh-default']/a">
                            <tag>
                                <xsl:value-of select="."/>
                            </tag>
                        </xsl:for-each>
                    </tags>
                </pull>
            </xsl:for-each>
        </pulls>
    </xsl:template>
</xsl:stylesheet>
