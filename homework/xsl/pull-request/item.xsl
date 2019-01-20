<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="../shared/label.xsl"/>
    <xsl:import href="../shared/datetime.xsl"/>
    <xsl:import href="../repository/title.xsl"/>
    <xsl:import href="../comment/list.xsl"/>

    <xsl:template match="pullRequest">
        <div class="pull-request">
            <div class="pull-request__repository">
                <h2><a href="../list.xml"><xsl:apply-templates select="repository"/></a></h2>
            </div>
            <div class="row">
                <div class="col">
                    <div class="pull-request__title">
                        <h1>
                            <xsl:value-of select="title"/>
                            <span class="pull-request__id">#<xsl:value-of select="@id"/></span>
                        </h1>
                    </div>
                    <div class="pull-request-list__labels">
                        <xsl:apply-templates select="labels"/>
                    </div>

                    <div class="pull-request-list__info">
                        <span>
                            #<xsl:value-of select="@id"/> opened
                            <xsl:call-template name="formatdatetime">
                                <xsl:with-param name="datetime" select="@datetime"/>
                            </xsl:call-template>
                            by <xsl:value-of select="author/userName"/>
                        </span>
                    </div>
                </div>
            </div>

            <ul class="nav nav-tabs" id="prTab">
                <li class="nav-item">
                    <a class="nav-link active" href="#info" data-toggle="tab">
                        info
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#comments" data-toggle="tab">
                        <i class="far fa-comment-alt"></i>
                        comments
                        <xsl:value-of select="count(comments/comment)"/>
                    </a>
                </li>
            </ul>

            <div class="tab-content" id="prTabContent">
                <div class="tab-pane active" id="info">
                    <div class="pull-request__text">
                        <xsl:value-of select="text"/>
                    </div>
                </div>
                <div class="tab-pane" id="comments">
                    <div class="pull-request__comments">
                        <xsl:apply-templates select="comments"/>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>
