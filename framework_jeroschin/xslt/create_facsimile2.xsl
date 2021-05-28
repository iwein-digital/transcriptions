<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
<!--    This template adds hc:HorizontalLayout for more than one column-->
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:surface">
        <surface xmlns="http://www.tei-c.org/ns/1.0" >
            <xsl:apply-templates select="@*"/>
            <xsl:choose>
                <xsl:when test="count(child::tei:zone[ contains( @ana, 'hc:Column' ) ] ) > 1">
                    <zone>
                        <xsl:attribute name="ana">hc:HorizontalLayout</xsl:attribute>
                        <xsl:apply-templates select="tei:zone[ contains( @ana, 'hc:Column' ) ]"/>
                    </zone>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="tei:zone[ contains( @ana, 'hc:Column' ) ]"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates select="tei:zone[ not( contains( @ana, 'hc:Column' ) ) ]"></xsl:apply-templates>
        </surface>
    </xsl:template>
</xsl:stylesheet>