<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output indent="yes"
                method="html"
                encoding="utf-8"
                doctype-system="about:legacy-compat"/>

    <xsl:template match="pullRequests">
        <html>
        <head>
            <title></title>
            <link href="./styles.css" rel="stylesheet"/>
        </head>
        <body class="body-in-the-center">

            <header class="header">
                <input type="text" placeholder="Search or jump to..."></input>
                <a href="#">Pull requests</a>
                <a href="#">Issues</a>
                <a href="#">Marketplace</a>
                <a href="#">Explore</a>
            </header>

            <div class="main-tabs">
                <div class="main-tabs-top-part">
                    <div class="main-tabs-top-part__link">
                        <a href="#">facebook</a>
                        <div> / </div>
                        <a href="#">create-react-app</a>
                    </div>
                    <div class="main-tabs-top-part__buttons">
                        <button>Watch</button>
                        <button>Star</button>
                        <button>Fork</button>
                    </div>
                </div>

                <div class="main-tabs-bottom-part">
                    <div class="main-tabs-bottom-part__tab">
                        <button>Code</button>
                        <button>Issues</button>
                        <button>Pull requests</button>
                        <button>Projects</button>
                        <button>Insights</button>
                    </div>
                </div>
            </div>

            <div class="main-wrapper">
                <div>
                    <div class="text-block">
                        <div class="text-block__text">
                            <h2>First time using xsl xml xslt and css?</h2>
                            <p>try to git gud</p>
                        </div>
                        <div class="text-block__link">
                            <a href="#">try hard</a>
                        </div>
                    </div>

                    <div class="pr-list">
                        <div class="pr-menu">
                            <div class="pr-menu-state">
                                <xsl:apply-templates select="./summary/prInfo"/>
                            </div>
                            <div class="pr-menu-dropdown">
                                <div class="pr-menu-dropdown__element">
                                    <span class="pr-menu-dropdown__element-face">Author</span>
                                    <div class="pr-menu-dropdown__element-content">author</div>
                                </div>
                                <div class="pr-menu-dropdown__element">
                                    <span class="pr-menu-dropdown__element-face">Labels</span>
                                    <div class="pr-menu-dropdown__element-content">labels</div>
                                </div>
                                <div class="pr-menu-dropdown__element">
                                    <span class="pr-menu-dropdown__element-face">Projects</span>
                                    <div class="pr-menu-dropdown__element-content">projects</div>
                                </div>
                                <div class="pr-menu-dropdown__element">
                                    <span class="pr-menu-dropdown__element-face">Milestones</span>
                                    <div class="pr-menu-dropdown__element-content">milestones</div>
                                </div>
                                <div class="pr-menu-dropdown__element">
                                    <span class="pr-menu-dropdown__element-face">Reviews</span>
                                    <div class="pr-menu-dropdown__element-content">reviews</div>
                                </div>
                                <div class="pr-menu-dropdown__element">
                                    <span class="pr-menu-dropdown__element-face">Assignee</span>
                                    <div class="pr-menu-dropdown__element-content">assignee</div>
                                </div>
                                <div class="pr-menu-dropdown__element">
                                    <span class="pr-menu-dropdown__element-face">Sort</span>
                                    <div class="pr-menu-dropdown__element-content">sort</div>
                                </div>
                            </div>
                        </div>

                        <div class="pr-wrapper">
                            <div id="open_pr" class="open-pr">
                                <xsl:apply-templates select="./item[@status = 'open']"/>
                            </div>
                            <div id="close_pr" class="close-pr">
                                <xsl:apply-templates select="./item[@status = 'closed' or @status = 'merged']"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="bottom-align">
                    <div class="pagination">
                        <a href="#">Previous</a>
                        <a href="#" class="pagination__active">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">Next</a>
                    </div>

                    <div class="bottom-menu">
                        <div class="bottom-menu__left">
                            <div>© 2019 Please, Inc.</div>
                            <a href="#">Terms</a>
                            <a href="#">Privacy</a>
                            <a href="#">Security</a>
                            <a href="#">Status</a>
                            <a href="#">Help</a>
                        </div>
                        <div class="bottom-menu__right">
                            <a href="#">Contact GitHub</a>
                            <a href="#">Pricing</a>
                            <a href="#">API</a>
                            <a href="#">Training</a>
                            <a href="#">Blog</a>
                            <a href="#">About</a>
                        </div>
                    </div>
                </div>
            </div>
            <script src="./pullRequests.js"></script>
        </body>
        </html>
    </xsl:template>


    <xsl:template match="pullRequests/summary/prInfo">
        <div id="{./status}_button" class="pr-menu-state_condition">
            <xsl:value-of select="./amount"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="./status"/>
        </div>    
    </xsl:template>

    <xsl:template match="pullRequests/item">

        <div id="{./@id}" class="pr">
            <div class="pr-left-icon">
                <xsl:apply-templates select="." mode="prStatus"/>
            </div>
            <div class="pr-info">
                <div class="pr-info__first-line">
                    <xsl:apply-templates select="./title" mode="title"/>
                    <xsl:apply-templates select="./buildStatus" mode="buildStatus"/>
                    <xsl:apply-templates select="./labels" mode="labels"/>
                </div>
                <div class="pr-info__second-line">
                    <span class="opened-by">
                        <xsl:apply-templates select="." mode="prInfo"/>
                    </span>
                </div>
            </div>
            <div class="comment">
                <xsl:apply-templates select="./comments" mode="comments"/>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="pullRequests/item"  mode="prStatus">
        <span class="pr-left-icon__{@status}"></span>
    </xsl:template>

    <xsl:template match="pullRequests/item/title"  mode="title">
        <a class="pr-info__href" href="{./link}">
            <xsl:value-of select="./name"/>
        </a>
    </xsl:template>

    <xsl:template match="pullRequests/item/buildStatus" mode="buildStatus">
        <span class="commit-build-status-{@passed}"></span>
    </xsl:template>

    <xsl:template match="pullRequests/item/labels/label" mode="labels">
        <a class="pr-info__label" style="background: {./backgroundColor}; color: {./textColor};" href="{./link}">
            <xsl:value-of select="./name"/>
        </a>
    </xsl:template>

    <xsl:template match="pullRequests/item[@status = 'open']" mode="prInfo">
        <xsl:value-of select="concat('#', @id)"/>
        <xsl:text> opened </xsl:text>
        <xsl:apply-templates select="./openDateTime" mode="time"/>
        <xsl:text> by </xsl:text>
        <xsl:apply-templates select="./author" mode="author"/>
    </xsl:template>

    <xsl:template match="pullRequests/item[@status = 'closed' or @status = 'merged']" mode="prInfo">
        <xsl:value-of select="concat('#', @id)"/>
        <xsl:text> by </xsl:text>
        <xsl:apply-templates select="./author" mode="author"/>
        <xsl:text> was </xsl:text>
        <xsl:value-of select="concat(@status, ' ')"/>
        <xsl:apply-templates select="./closeDateTime" mode="time"/>
    </xsl:template>

    <xsl:template match="pullRequests/item/openDateTime" mode="time">
        <relative-time datetime="{./year}-{./month}-{./day}T{./hour}:{./minute}:{./second}Z" title="{./day}.{./month}.{./year}, {./hour}:{./minute} GMT{./GMT}">
            <xsl:value-of select="./outputText"/>
        </relative-time>
    </xsl:template>

    <xsl:template match="pullRequests/item/closeDateTime" mode="time">
        <relative-time datetime="{./year}-{./month}-{./day}T{./hour}:{./minute}:{./second}Z" title="{./day}.{./month}.{./year}, {./hour}:{./minute} GMT{./GMT}">
            <xsl:value-of select="./outputText"/>
        </relative-time>
    </xsl:template>

    <xsl:template match="pullRequests/item/author" mode="author">
        <a class="user-link" href="{./link}">
            <xsl:value-of select="./name"/>
        </a>
    </xsl:template>

    <xsl:template match="pullRequests/item/comments" mode="comments">
        <a href="{./link}">
            <span class="comment-svg-icon"></span>
            <xsl:value-of select="./amount"/>
        </a>
    </xsl:template>

</xsl:stylesheet>