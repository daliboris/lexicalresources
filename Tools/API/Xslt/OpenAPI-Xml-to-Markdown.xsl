<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:xs="http://www.w3.org/2001/XMLSchema"
 xmlns:math="http://www.w3.org/2005/xpath-functions/math"
 xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
 exclude-result-prefixes="xs math xd"
 version="3.0">
 <xd:doc scope="stylesheet">
  <xd:desc>
   <xd:p><xd:b>Created on:</xd:b> Apr 17, 2023</xd:p>
   <xd:p><xd:b>Author:</xd:b> Boris</xd:p>
   <xd:p></xd:p>
  </xd:desc>
 </xd:doc>
 
 <xsl:output method="text" />
 
 <xsl:mode on-no-match="shallow-skip"/>
 
 <xsl:template match="api">
  <xsl:value-of select="'### Endpoints&#xa;&#xa;'"/>
  <xsl:apply-templates select="path[not(starts-with(@value, '/test/'))]">
   <xsl:sort select="@value" />
  </xsl:apply-templates>
 </xsl:template>
 
 <xsl:template match="path">
  <xsl:value-of select="concat('- ', replace(upper-case(method/@name), '/api/lex', ''), ' ', @value, '&#xa;')"/>
  <xsl:apply-templates  />
 </xsl:template>
 
 <xsl:template match="summary | description">
  <xsl:value-of select="concat('  - ', ., '&#xa;')"/>
 </xsl:template>
 
 <xsl:template match="method">
  <xsl:apply-templates select="* except parameter" />
  <xsl:if test="parameter">
   <xsl:value-of select="'  - parameters&#xa;'"/>
   <xsl:apply-templates select="parameter" />   
  </xsl:if>
 </xsl:template>
 
 <xsl:template match="parameter">
  <xsl:value-of select="concat('    - ', @name, ' (', @schema, ')', '&#xa;')"/>
 </xsl:template>
 
</xsl:stylesheet>