<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output indent="yes"
                method="html"
                encoding="utf-8"/>
    <xsl:strip-space elements="*"/>

    <xsl:template name="root" match="pulls">
        <html>
            <head>
                <META http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

                <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"/>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

                <link rel="stylesheet" href="resources/css/main.css"/>
            </head>
            <boby>
                <div class="grid row">
                    <div class="col"/>
                    <div class="col-6">
                        <div class="title">
                            <h3 class="page-title">Pull Requests</h3>

                            <h5 style="margin-left:auto;">Open:
                                <xsl:value-of select="count(//pull/type[text()='Open pull request'])"/>
                            </h5>
                            <h5>Closed:
                                <xsl:value-of select="count(//pull/type[text()='Closed pull request'])"/>
                            </h5>
                            <h5>Merged:
                                <xsl:value-of select="count(//pull/type[text()='Merged pull request'])"/>
                            </h5>
                        </div>

                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Type</th>
                                    <th scope="col">Checks</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Author</th>
                                    <th scope="col">Tags</th>
                                    <th scope="col">Comments</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:apply-templates select="pull"/>
                            </tbody>
                        </table>
                    </div>
                    <div class="col"/>
                </div>
            </boby>
        </html>
    </xsl:template>

    <xsl:template match="pull">
        <tr>
            <td>
                <!--<xsl:value-of select="type"/>-->
                <xsl:apply-templates select="type"/>
            </td>
            <td>
                <xsl:apply-templates select="status"/>
            </td>
            <td>
                <xsl:value-of select="date"/>
            </td>
            <td>
                <xsl:value-of select="author"/>
            </td>
            <td>
                <xsl:apply-templates select="tags/tag"/>
            </td>
            <td>
                <xsl:apply-templates select="comments"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="type[text()='open']">
        <span data-toggle="tooltip" data-placement="bottom" title="Open">
            <img src="resources/img/open-pr.svg"></img>
        </span>
    </xsl:template>

    <xsl:template match="type[text()='closed']">
        <span data-toggle="tooltip" data-placement="bottom" title="Closed">
            <img src="resources/img/closed-pr.svg"></img>
        </span>
    </xsl:template>

    <xsl:template match="type[text()='merged']">
        <span data-toggle="tooltip" data-placement="bottom" title="Merged">
            <img src="resources/img/merged-pr.svg"></img>
        </span>
    </xsl:template>


    <xsl:template match="comments[text()!='']">
        <img src="resources/img/messages.svg"></img>
        <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="tags/tag">
        <span class="badge badge-secondary">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>

    <xsl:template match="passed[text() = 'true']">
        <img src="resources/img/passed.svg"></img>
    </xsl:template>

    <xsl:template match="passed[text() != 'true']">
        <img src="resources/img/failed.svg"></img>
    </xsl:template>


</xsl:stylesheet>
