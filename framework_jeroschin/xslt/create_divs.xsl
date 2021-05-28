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

    <xsl:param name="begin">5</xsl:param>
    <xsl:param name="end">8</xsl:param>
    
    <xsl:variable name="xpath" select="(//tei:l[@n=$begin][not(ancestor::tei:lg)] |
        //tei:l[@n=$begin]/ancestor::tei:lg | //tei:l[@n=$begin]/(following::tei:l[not(ancestor::tei:lg)] | following::tei:pb |
        following::tei:cb | following::tei:lg)) intersect
        (//tei:l[@n=$end][not(ancestor::tei:lg)] |
        //tei:l[@n=$end]/ancestor::tei:lg | //tei:l[@n=$end]/(preceding::tei:l[not(ancestor::tei:lg)] | preceding::tei:pb |
        preceding::tei:cb | preceding::tei:lg) )"></xsl:variable>
    
    <xsl:variable name="neg_xpath1"
        select="//tei:l[@n=$begin]/(preceding::tei:l[not(ancestor::tei:lg)] | preceding::tei:pb |
        preceding::tei:cb | preceding::tei:lg)"></xsl:variable>
    
    <xsl:variable name="neg_xpath2" select="//tei:l[@n=$end]/(following::tei:l[not(ancestor::tei:lg)] | following::tei:pb |
        following::tei:cb | following::tei:lg)">
        
    </xsl:variable>
    
    <xsl:template match="tei:body">
        <body xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates select="$neg_xpath1"/>
            <div xmlns="http://www.tei-c.org/ns/1.0">
                <xsl:copy-of select="$xpath"></xsl:copy-of>
            </div>
            <xsl:apply-templates select="$neg_xpath2"/>
        </body>        
    </xsl:template>
    
</xsl:stylesheet>