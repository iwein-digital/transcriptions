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
    
    <xsl:template match="tei:lb">
        <!--<xsl:text>&#x000A;</xsl:text>-->
        <lb xmlns="http://www.tei-c.org/ns/1.0" ><xsl:attribute name="n"><xsl:number count="tei:lb" level="any" from="tei:pb"></xsl:number></xsl:attribute></lb>
    </xsl:template>
    
    
    
</xsl:stylesheet>
