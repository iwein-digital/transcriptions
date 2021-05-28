<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:dwork = "dwork"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
<!--    Location of the configuration file-->
   <xsl:variable name="config_file">
       <xsl:text>../config/ms_facsimile.xml</xsl:text>
   </xsl:variable>
   
    <xsl:variable name="witness">
        <xsl:value-of select="//tei:witness/@xml:id"/>
    </xsl:variable>
    
    <xsl:variable name="dwork_id">
        <xsl:for-each select="document($config_file)//*">
            <xsl:if test="./@xml:id = $witness">
                <xsl:value-of select="./dwork:dworkId"/>
            </xsl:if>
        </xsl:for-each>
    </xsl:variable>
    
    <xsl:variable name="starting_page">
        <xsl:for-each select="document($config_file)//*">
            <xsl:if test="./@xml:id = $witness">
                <xsl:value-of select="./dwork:start"/>
            </xsl:if>
        </xsl:for-each>
    </xsl:variable>
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:surface">
        <surface xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:attribute name="xml:id">
                <xsl:value-of select="//tei:witness/@xml:id"/>
                <xsl:text>_</xsl:text>
                <xsl:value-of select="./@n"/>
            </xsl:attribute>
            <xsl:apply-templates select="@*|node()"/>
        </surface>
    </xsl:template>
    
    <xsl:template match="tei:zone[not( contains( @ana, 'HorizontalLayout') )]">
        <zone xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:attribute name="xml:id">
                <xsl:value-of select="$witness"/>
                <xsl:text>_</xsl:text>
                <xsl:value-of select="ancestor::tei:surface/@n"/>
                <xsl:text>-</xsl:text>
                <xsl:value-of select="./@n"/>
            </xsl:attribute>
            <xsl:apply-templates select="@*|node()"/>
        </zone>
    </xsl:template>
    
    <xsl:template match="tei:graphic">
        <graphic xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:attribute name="url">
                <xsl:text>https://digi.ub.uni-heidelberg.de/diglit/</xsl:text>
                <xsl:value-of select="$dwork_id"/>
                <xsl:text>/</xsl:text>
                <xsl:variable name="preceding_pages">
                    <xsl:value-of select="count (preceding::tei:surface)"/>
                </xsl:variable>
                <xsl:value-of select="format-number( $starting_page + $preceding_pages, '0000')"/>
                
            </xsl:attribute>
        </graphic>
    </xsl:template>
    
    
</xsl:stylesheet>