<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    <sch:pattern>
        <sch:rule context="tei:l">
            <!--<sch:assert test="count(*) = count(tei:w | tei:note | tei:lb | tei:pc | tei:metamark | tei:del | tei:add | tei:hi )">Invalid element inside l</sch:assert>-->
            <sch:assert test="not(./text())">l-element can't have text node inside</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>