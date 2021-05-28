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
    
<!--    Man braucht die leere facsimile-Elemente schon haben -->
    <xsl:template match="tei:facsimile">
        <facsimile xmlns="http://www.tei-c.org/ns/1.0" >
        <xsl:for-each select="//tei:text//tei:pb">
            
            <surface ana="hc:Page">
                <xsl:attribute name="n"><xsl:value-of select="./@n"/></xsl:attribute>
                
                <xsl:variable name="current_pb_index">
                    <xsl:value-of select="count(./preceding::tei:pb) + 1"></xsl:value-of>
                </xsl:variable>
                
                <xsl:for-each select="./following::tei:cb[count(./preceding::tei:pb) = $current_pb_index]">
                    <zone>
                        <xsl:attribute name="ana">hc:Column hc:TextZone</xsl:attribute>
                        <xsl:attribute name="n">
                            <xsl:value-of select="./@n"/>
                        </xsl:attribute>
                    </zone>
                </xsl:for-each>
                
                <xsl:for-each select="./following::tei:milestone[contains(@ana,'hc:ZoneBeginning') and count(./preceding::tei:pb) = $current_pb_index]">
                    <zone>
                        <xsl:attribute name="ana">hc:TextZone</xsl:attribute>
                    </zone>
                </xsl:for-each>
                
                
                
            </surface>
        </xsl:for-each>
        </facsimile>
    </xsl:template>
</xsl:stylesheet>