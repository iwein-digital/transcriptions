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
    
    <xsl:template match="tei:facsimile">
        <xsl:text>&#x000A;&#x0020;&#x0020;&#x0020;&#x0020;</xsl:text>
        <facsimile xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates select="@*|node()"/>
            <xsl:text>&#x000A;&#x0020;&#x0020;&#x0020;&#x0020;</xsl:text>
        </facsimile>
    </xsl:template>

    <xsl:template match="tei:surface">
        <xsl:text>&#x000A;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;</xsl:text>
        <surface xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates select="@*|node()"/>
            <xsl:choose>
                <xsl:when test="count(child::*) > 0 ">
                    <xsl:text>&#x000A;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;</xsl:text>
                </xsl:when>
            </xsl:choose>
        </surface>
    </xsl:template>
    
    <xsl:template match="tei:graphic">
        <xsl:text>&#x000A;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;</xsl:text>
        <graphic xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates select="@*|node()"/>
        </graphic>
    </xsl:template>
    
    <xsl:template match="tei:zone[parent::tei:surface]">
        <xsl:text>&#x000A;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;</xsl:text>
        <zone xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates select="@*|node()"/>
            <xsl:choose>
                <xsl:when test="count(child::*) > 0 ">
                    <xsl:text>&#x000A;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;</xsl:text>
                </xsl:when>
            </xsl:choose>
        </zone>
    </xsl:template>
    
    <xsl:template match="tei:zone[ not (parent::tei:surface ) ]">
        <xsl:text>&#x000A;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;</xsl:text>
        <zone xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates select="@*|node()"/>
            <xsl:choose>
                <xsl:when test="count(child::*) > 0 ">
                    <xsl:text>&#x000A;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;&#x0020;</xsl:text>
                </xsl:when>
            </xsl:choose>
        </zone>
    </xsl:template>
    
    
    
    

</xsl:stylesheet>