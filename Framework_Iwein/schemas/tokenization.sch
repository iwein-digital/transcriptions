<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    <ns uri="https://digi.ub.uni-heidelberg.de/schema/tei/heiEDITIONS" prefix="hei"/>
    
    <pattern>
        <let name="tokencontainers" value="tokenize(//hei:elementsWithTokenizedContent/@include, ' ')"></let>
        
        <rule context="text()
            [ancestor::tei:text]
            [normalize-space(.) != '']
            [not(ancestor::tei:note)]
            ">

            <report test="self::node()
                [(for $i in ancestor::element() return name($i)) = $tokencontainers]
                [not(ancestor::tei:w) and not(ancestor::tei:pc) and not(ancestor::tei:num) and not(ancestor::tei:c) and not(ancestor::tei:metamark)]">Nicht tokenisiert!</report>
                       
        </rule>
    </pattern>
    
   
</schema>