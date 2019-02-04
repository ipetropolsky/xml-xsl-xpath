<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="list-item.xsl"/>

    <xsl:template match="pullRequests">
        <ul class="nav nav-tabs" id="prStatusTab">
            <li class="nav-item">
                <a class="nav-link active" href="#open" id="open-tab" data-toggle="tab">
                    <!-- code-merge requires font awesome pro -->
                    <i class="fas fa-code-branch"/>
                    <xsl:value-of select="count(pullRequest[@checks = 'ok'])"/> opened
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#close" id="close-tab" data-toggle="tab">
                    <i class="fas fa-check"/>
                    <xsl:value-of select="count(pullRequest[@checks = 'reject'])"/> closed
                </a>
            </li>
        </ul>
        <div class="tab-content" id="prStatusTabContent">
            <div class="tab-pane active" id="open">
                <xsl:apply-templates select="pullRequest[@status = 'open']"/>
            </div>
            <div class="tab-pane" id="close">
                <xsl:apply-templates select="pullRequest[@status != 'open']"/>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>
