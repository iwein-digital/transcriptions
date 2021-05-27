<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:hei="https://digi.ub.uni-heidelberg.de/schema/tei/heiEDITIONS"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template match="@rendition">
        <xsl:variable name="attrValue"><xsl:value-of select="."/></xsl:variable>
        <xsl:choose>
            <xsl:when test="$attrValue = '' ">
            </xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="rendition">
                    <xsl:value-of select="."/>
                </xsl:attribute>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="@hei:color">
        <xsl:variable name="attrValue"><xsl:value-of select="."/></xsl:variable>
        <xsl:choose>
            <xsl:when test="$attrValue = '' ">
            </xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="hei:color">
                    <xsl:value-of select="."/>
                </xsl:attribute>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
</xsl:stylesheet>