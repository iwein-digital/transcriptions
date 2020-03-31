<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:body">
        <body xmlns="http://www.tei-c.org/ns/1.0" >
            <pb/>
            <xsl:variable name="no_tab_content">
                <xsl:analyze-string select="." regex="\t| {{2,}}">
                    <xsl:non-matching-substring><xsl:value-of select="."/></xsl:non-matching-substring>
                </xsl:analyze-string>
            </xsl:variable>
            <xsl:analyze-string select="$no_tab_content" regex="\n">
                <xsl:matching-substring>
                    <xsl:text>&#x000A;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;</xsl:text>
                    <lb/>
                </xsl:matching-substring>
                <xsl:non-matching-substring>
                    <xsl:analyze-string select="." regex="//">
                        <xsl:matching-substring>
                            <pb/>
                        </xsl:matching-substring>
                        <xsl:non-matching-substring>
                            <xsl:value-of select="."/>
                        </xsl:non-matching-substring>
                    </xsl:analyze-string>
                </xsl:non-matching-substring>
            </xsl:analyze-string>
        </body>
    </xsl:template>
    
    
</xsl:stylesheet>