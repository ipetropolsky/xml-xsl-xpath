<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Полное копирование с заменой <doBang/> на <doSomething/> + import -->

    <xsl:import href="07-identity.xsl"/>

    <xsl:template match="doBang">
        <doSomething/>
    </xsl:template>

</xsl:stylesheet>
