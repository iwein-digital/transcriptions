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
    
    <xsl:template match="tei:graphic">
        <xsl:choose>
            <xsl:when test="count (preceding::tei:graphic) != 0">
                <graphic xmlns="http://www.tei-c.org/ns/1.0">
                    <xsl:attribute name="url">
                        <xsl:text>https://digi.ub.uni-heidelberg.de/diglit/</xsl:text>
                        <xsl:value-of select="tokenize( preceding::tei:graphic[last()]/@url , '/' )[5]"/>
                        <xsl:text>/</xsl:text>
                        <xsl:variable name="starting_page">
                            <xsl:value-of select="tokenize( preceding::tei:graphic[last()]/@url , '/' )[last()] "/>
                        </xsl:variable>
                        <xsl:variable name="preceding_pages">
                            <xsl:value-of select="count( preceding::tei:graphic)"/>
                        </xsl:variable>
                        <xsl:value-of select="format-number( $starting_page + $preceding_pages, '0000')"/>
                    </xsl:attribute>
                    <xsl:attribute name="mimeType">
                        <xsl:text>image/*</xsl:text>
                    </xsl:attribute>
                </graphic>
            </xsl:when>
            <xsl:otherwise>
                <graphic xmlns="http://www.tei-c.org/ns/1.0">
                    <xsl:apply-templates select="@*"/>
                </graphic>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>