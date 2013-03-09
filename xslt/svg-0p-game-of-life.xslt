<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
              xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
              xmlns:z="http://ef.gy/2013/0p"
              xmlns:svg="http://www.w3.org/2000/svg"
              xmlns="http://www.w3.org/2000/svg"
              version="1.1">
  <xsl:output method="xml" version="1.0" encoding="UTF-8"
              indent="no"
              media-type="image/svg+xml" />

  <xsl:strip-space elements="*" />

  <xsl:param name="documentRoot"/>

  <xsl:template match="@*|node()">
    <xsl:copy><xsl:apply-templates select="@*|node()"/></xsl:copy>
  </xsl:template>

  <xsl:template match="z:bit">
    <rect x="{@x}" y="{@y}" width="1" height="1"/>
  </xsl:template>

  <xsl:template match="z:game-of-life">
    <xsl:variable name="minx" select="z:bit/@x[not(. &gt; ../../z:bit/@x)][1]"/>
    <xsl:variable name="maxx" select="z:bit/@x[not(. &lt; ../../z:bit/@x)][1]"/>
    <xsl:variable name="miny" select="z:bit/@y[not(. &gt; ../../z:bit/@y)][1]"/>
    <xsl:variable name="maxy" select="z:bit/@y[not(. &lt; ../../z:bit/@y)][1]"/>
    <xsl:processing-instruction name="xml-stylesheet">
      <xsl:text>type="text/css" href="/css/game-of-life"</xsl:text>
    </xsl:processing-instruction>
    <svg viewBox="{$minx - 1} {$miny - 1} {$maxx - $minx + 3} {$maxy - $miny + 3}">
      <xsl:apply-templates select="z:bit"/>
    </svg>
  </xsl:template>
</xsl:stylesheet>
