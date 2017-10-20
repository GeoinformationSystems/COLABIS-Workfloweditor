<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"
                xmlns:prov="http://www.w3.org/ns/prov#"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns="http://colabis.de/"
                version="2.0">
    <xsl:output method="xml"/>
    <xsl:template match="/">
        <prov:document xmlns:prov="http://www.w3.org/ns/prov#" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://example.org/">
            <xsl:apply-templates></xsl:apply-templates>
        </prov:document>
    </xsl:template>
    <!-- prov:entity -->
    <xsl:template match="DataDMP">
        <prov:entity prov:id="{./@label}">
            <prov:type xsi:type="xsd:QName">
                <xsl:value-of select="./@label"/>
            </prov:type>
        </prov:entity>
    </xsl:template>
    <!-- prov:activity -->
    <xsl:template match="ProcessDMP">
        <prov:activity prov:id="{./@label}"/>
    </xsl:template>
    <!-- prov:organization -->
    <xsl:template match="ActorDMP">
        <prov:organization prov:id="{./@label}"/>
    </xsl:template>
    <!-- Connections between prov elements -->
    <xsl:template match="Connector">
        <xsl:variable name="source" select="./mxCell/@source"/>
        <xsl:variable name="target" select="./mxCell/@target"/>
        <xsl:choose>
            <!-- prov:wasAssociatedWith -->
            <xsl:when test="//ActorDMP/@id=$source and //ProcessDMP/@id=$target">
                <prov:wasAssociatedWith>
                    <prov:activity prov:ref="{//ProcessDMP[@id=$target]/@label}"/>
                    <prov:agent prov:ref="{//ActorDMP[@id=$source]/@label}"/>
                </prov:wasAssociatedWith>
            </xsl:when>
            <!-- prov:wasAttributedTo -->
            <xsl:when test="//ActorDMP/@id=$source and //DataDMP/@id=$target">
                <prov:wasAttributedTo>
                    <prov:entity prov:ref="{//DataDMP[@id=$target]/@label}"/>
                    <prov:agent prov:ref="{//ActorDMP[@id=$source]/@label}"/>
                </prov:wasAttributedTo>
            </xsl:when>
            <!-- prov:used -->
            <xsl:when test="//DataDMP/@id=$source and //ProcessDMP/@id=$target">
                <prov:used>
                    <prov:activity prov:ref="{//ProcessDMP[@id=$target]/@label}"/>
                    <prov:entity prov:ref="{//DataDMP[@id=$source]/@label}"/>
                </prov:used>
            </xsl:when>
            <!-- prov:wasGenereatedBy -->
            <xsl:when test="//ProcessDMP/@id=$source and //DataDMP/@id=$target">
                <prov:wasGeneratedBy>
                    <prov:entity prov:ref="{//DataDMP[@id=$target]/@label}"/>
                    <prov:activity prov:ref="{//ProcessDMP[@id=$source]/@label}"/>
                </prov:wasGeneratedBy>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>