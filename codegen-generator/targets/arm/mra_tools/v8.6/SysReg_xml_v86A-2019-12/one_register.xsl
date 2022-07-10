<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml">

<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
  doctype-system="xhtml1-transitional.dtd"
  method="html" encoding="UTF-8"
  indent="yes"/>

<xsl:preserve-space elements="reg_write_instruction"/>
<xsl:strip-space elements="field_reset"/>

<!-- Title of interface group -->
<xsl:template match="/register_page">
  <html>
    <head>
      <xsl:if test="registers/register">
        <title><xsl:value-of select="registers/register[1]/reg_short_name"/></title>
      </xsl:if>
      <link href="insn.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
      <xsl:call-template name="generate_header_footer"/>
      <hr/>
      <xsl:for-each select="registers">
        <xsl:apply-templates select="register"/>
      </xsl:for-each>
      <hr/>
      <xsl:call-template name="generate_footer"/>
    </body>
  </html>
</xsl:template>

<xsl:template match="/textsection">
  <html>
    <head>
      <title><xsl:value-of select="@title"/></title>
      <link href="insn.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
      <xsl:call-template name="generate_header_footer"/>
      <hr/>

      <h1><xsl:value-of select="@title"/></h1>

      <xsl:apply-templates select="para"/>

      <hr/>
      <xsl:call-template name="generate_footer"/>
    </body>
  </html>
</xsl:template>

<xsl:template name="generate_header_footer">
  <table align="center">
    <tr>
      <!-- header/footer start -->
      <td><div class="topbar"><a href="AArch32-regindex.xml">AArch32 Registers</a></div></td>
      <td><div class="topbar"><a href="AArch64-regindex.xml">AArch64 Registers</a></div></td>
      <td><div class="topbar"><a href="AArch32-sysindex.xml">AArch32 Instructions</a></div></td>
      <td><div class="topbar"><a href="AArch64-sysindex.xml">AArch64 Instructions</a></div></td>
      <td><div class="topbar"><a href="enc_index.xml">Index by Encoding</a></div></td>
      <td><div class="topbar"><a href="ext_alpha_index.xml">External Registers</a></div></td>
      <td><div class="topbar"><a href="ext_enc_index.xml">External Registers by Offset</a></div></td>
      <td><div class="topbar"><a href="func_index.xml">Registers by Functional Group</a></div></td>
      <td><div class="topbar"><a href="notice.xml">Proprietary Notice</a></div></td>
      <!-- header/footer end -->
    </tr>
  </table>
</xsl:template>

<xsl:template name="generate_footer">
  <xsl:call-template name="generate_header_footer"/>
  <p class="versions"><xsl:value-of select="timestamp"/></p>
  <p class="copyconf">Copyright &#169; 2010-2019 Arm Limited or its affiliates. All rights reserved. This document is Non-Confidential.</p>
</xsl:template>

<xsl:template match="register">
  <xsl:variable name="SHORT_NAME">
    <xsl:value-of select="reg_short_name"/>
  </xsl:variable>
  <h1 class="register-section">
  <xsl:choose>
    <xsl:when test="./reg_variables and count(./reg_variables/reg_variable) = 1">
      <!--  If register variables are available, use these to specify the values for n.
            This will output something like "0 - 30", if min and max values are available.
            Otherwise we would expect something like "1, 2, 3, 4" if individual values are
            available. -->
      <xsl:value-of select="reg_short_name"/>, <xsl:value-of select="reg_long_name"/>, <xsl:value-of select="reg_variables/reg_variable/@variable"/> =
      <xsl:choose>
        <xsl:when test="reg_variables/reg_variable/@max">
          <!-- Deal with ranges. -->
          <xsl:choose>
            <xsl:when test="reg_variables/reg_variable/@min">
              <xsl:value-of select="reg_variables/reg_variable/@min"/>
            </xsl:when>
            <xsl:otherwise>
              <!--  Assume 0 if no min specified. -->
              <xsl:text>0</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:text> - </xsl:text>
          <xsl:value-of select="reg_variables/reg_variable/@max"/>
        </xsl:when>
        <xsl:when test="reg_variables/reg_variable/reg_variable_val">
          <!-- Deal with individual values. -->
          <xsl:for-each select="reg_variables/reg_variable/reg_variable_val">
            <xsl:value-of select="."/>
            <xsl:if test="position() != last()">
              <xsl:text>,</xsl:text>
            </xsl:if>
          </xsl:for-each>
        </xsl:when>
      </xsl:choose>
    </xsl:when>
    <xsl:when test="./reg_array">
      <xsl:value-of select="reg_short_name"/>, <xsl:value-of select="reg_long_name"/>, n = <xsl:value-of select="reg_array/reg_array_start"/> - <xsl:value-of select="reg_array/reg_array_end"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="reg_short_name"/>, <xsl:value-of select="reg_long_name"/>
    </xsl:otherwise>
  </xsl:choose>
  </h1>
  <xsl:if test="reg_documents_other_regs">
    <p>
      <xsl:text>This describes </xsl:text>
      <!--  TODO: pull out this comma-separated list code into its own template, as we're already using it in two places. -->
      <xsl:for-each select="reg_documents_other_regs/register_link">
        <xsl:if test="position() != 1 and last() != 2"><xsl:text>, </xsl:text></xsl:if>
        <xsl:if test="position() = last() and last() = 2"><xsl:text> and </xsl:text></xsl:if>
        <xsl:if test="position() = last() and last() > 2"><xsl:text>and </xsl:text></xsl:if>
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="./@id"/>
          </xsl:attribute>
          <xsl:value-of select="."/>
        </a>
      </xsl:for-each>
      <xsl:text>.</xsl:text>
    </p>
  </xsl:if>
  <p>The <xsl:value-of select="$SHORT_NAME"/> characteristics are:</p>

  <h2>Purpose</h2>
  <xsl:apply-templates select="reg_purpose"/>
  <xsl:if test="./@is_internal = 'True' and count(access_mechanisms) = 0">
    <!-- If there are <access_mechanisms>, the traps and enables are
         rendered by that template. -->

    <h2>Traps and Enables</h2>
    <xsl:if test="count(./reg_reverse_traps_and_enables/reverse_trap_or_enable_text) > 0">
      <!-- We don't store priority information yet - instead, refer to the appropriate Armv8 ARM sections. -->
      <xsl:choose>
        <xsl:when test="./@is_internal = 'True' and ./@execution_state = 'AArch32'">
          <!-- &#174; is the code for the registered (r) symbol; the more readable &reg; does not work from within XSL.  -->
          <p>For a description of the prioritization of any generated exceptions, see section G1.11.2 (Exception priority order) in the <i>Arm<sup>&#174;</sup> Architecture Reference Manual, ARMv8, for ARMv8-A architecture profile</i> for exceptions taken to AArch32 state, and section D1.13.2 (Synchronous exception prioritization) for exceptions taken to AArch64 state. Subject to the prioritization rules:</p>
        </xsl:when>
        <xsl:when test="./@is_internal = 'True' and ./@execution_state = 'AArch64'">
          <!-- &#174; is the code for the registered (r) symbol; the more readable &reg; does not work from within XSL. -->
          <p>For a description of the prioritization of any generated exceptions, see section D1.13.2 (Synchronous exception prioritization) in the <i>Arm<sup>&#174;</sup> Architecture Reference Manual, ARMv8, for ARMv8-A architecture profile</i>. Subject to the prioritization rules:</p>
        </xsl:when>
      </xsl:choose>
    </xsl:if>
    <xsl:apply-templates select="reg_reverse_traps_and_enables"/>
    <xsl:if test="count(./reg_reverse_traps_and_enables/reverse_trap_or_enable_text) = 0">
      <xsl:choose>
        <xsl:when test="./@is_register = 'False'">
          <p>There are no traps or enables affecting this instruction.</p>
        </xsl:when>
        <xsl:otherwise>
          <p>There are no traps or enables affecting this register.</p>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:if>

  <h2>Configuration</h2>
  <xsl:apply-templates select="reg_banking"/>
  <xsl:apply-templates select="reg_mappings"/>
  <xsl:if test="@is_internal = 'False' and reg_address/@power_domain != 'None'">
    <xsl:call-template name="memory_mapped_register_power_domain"/>
  </xsl:if>
  <xsl:if test="./@is_optional = 'True'">
    <p>Implementation of this register is <span class="arm-defined-word">OPTIONAL</span>.</p>
  </xsl:if>
  <xsl:if test="reg_condition">
    <xsl:variable name="REG_OR_INSTRUCTION">
    <xsl:choose>
      <xsl:when test="./@is_register = 'True'">register</xsl:when>
      <xsl:otherwise>instruction</xsl:otherwise>
    </xsl:choose>
    </xsl:variable>
    <p>This <xsl:value-of select="$REG_OR_INSTRUCTION"/> is present only
    <xsl:choose>
      <xsl:when test="substring(./reg_condition,1,8)='from ARM'">
        <xsl:text>from Arm</xsl:text><xsl:value-of select="substring(./reg_condition,9)"/>.
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="./reg_condition"/>.
      </xsl:otherwise>
    </xsl:choose>
    Otherwise, direct accesses to <xsl:value-of select="$SHORT_NAME"/> are <span class="arm-defined-word"><xsl:value-of select="reg_condition/@otherwise"/></span>.</p>
  </xsl:if>
  <xsl:apply-templates select="reg_configuration"/>

  <xsl:choose>
    <xsl:when test="./@is_internal = 'True' and count(./reg_mappings/reg_mapping) = 0 and count(./reg_configuration/configuration_text) = 0 and not(./reg_banking) and not(./reg_condition) and (not(./arch_variants/arch_variant) or starts-with(./arch_variants/arch_variant[1]/@name, 'ARMv8.0'))">
      <p>There are no configuration notes.</p>
    </xsl:when>
    <xsl:when test="./@is_internal = 'False' and ./@is_optional = 'False' and ./reg_address/@power_domain = 'None' and count(./reg_mappings/reg_mapping) = 0 and count(./reg_configuration/configuration_text) = 0  and not(./reg_condition) and (not(./arch_variants/arch_variant) or starts-with(./arch_variants/arch_variant[1]/@name, 'ARMv8.0'))">
      <p>There are no configuration notes.</p>
    </xsl:when>
  </xsl:choose>

  <h2>Attributes</h2>
  <xsl:apply-templates select="reg_attributes"/>

  <h2>Field descriptions</h2>
  <xsl:choose>
    <xsl:when test="./@is_stub_entry = 'True'">
      <p>
        <xsl:text>See </xsl:text>
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="reg_documented_in/@id"/>
          </xsl:attribute>
          <xsl:value-of select="reg_documented_in"/>
        </a>
        <xsl:text>.</xsl:text>
      </p>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates select="reg_fieldsets"/>
    </xsl:otherwise>
  </xsl:choose>

  <xsl:apply-templates select="reg_pseudocode"/>

  <xsl:choose>
    <xsl:when test="count(access_mechanisms/access_mechanism) = 0 and (count(reg_address) > 0 or count(reg_encoding) > 0)">
      <!-- If we have an <access_mechanisms> element, the access
           mechanisms template will produce the "Accessing" section.

           Otherwise, the section is generated if there is an
           <reg_encoding> (System register without access_mechanisms
           data) or <reg_address> (memory-mapped register.)  If the
           register has neither of these, there is no need for an
           Accessing section. (Currently true for SP_EL3 and ESR_ELx.) -->
      <xsl:choose>
        <xsl:when test="./@is_register = 'False'"> <!-- System instructions vs. registers-->
          <h2>Executing the <xsl:value-of select="reg_short_name"/> instruction</h2>
        </xsl:when>
        <xsl:otherwise>
          <h2>Accessing the <xsl:value-of select="$SHORT_NAME"/></h2>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="access_mechanisms/access_permission_text"/>
      <xsl:choose>
        <xsl:when test="./@is_internal = 'False'">
          <xsl:call-template name="reg_address_handler"/>
          <!-- <xsl:apply-templates select="reg_address"/> -->
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="reg_encoding"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates select="access_mechanisms"/>
    </xsl:otherwise>
  </xsl:choose>
  <br/><br/>
</xsl:template>

<xsl:template name="reg_access">
  <xsl:choose>
   <xsl:when test="reg_access/reg_access_state">
     <xsl:call-template name="reg_access_handler"/>
   </xsl:when>
   <xsl:otherwise>
     <p>Accessing this register depends on which field is being accessed; see the register field descriptions for the states that they are accessible in.</p>
   </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="reg_access_handler">
  <xsl:choose>
    <xsl:when test="count(./reg_access) > 1">
      <!-- Check to see if there are any <reg_access_level> contents in the first <reg_access> element that don't match the second one. -->
      <!-- TODO: extend this to match first element to every successive element, rather than just first and second. -->
      <xsl:choose>
        <xsl:when test="count(access[1]/state/level[not(./text() = ../../../access[2]/state/level/text())]) = 0">
          <xsl:call-template name="reg_access_combined"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="reg_access"/> <!-- If any don't match, handle as before; make separate tables. -->
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates select="reg_access"/> <!-- Handle as before. -->
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="reg_access_combined">
  <table class="register_access">
    <tr>
      <xsl:if test="reg_access[1]/@name">
        <th></th>
      </xsl:if>
      <xsl:for-each select="reg_access[1]/reg_access_state">
        <th><xsl:value-of select="reg_access_level"/></th>
      </xsl:for-each>
    </tr>
    <xsl:for-each select="reg_access">
      <tr>
      <xsl:if test="./@name">
        <td><xsl:value-of select="./@name"/></td>
      </xsl:if>
      <xsl:for-each select="reg_access_state">
        <td><xsl:value-of select="reg_access_type"/></td>
      </xsl:for-each>
      </tr>
    </xsl:for-each>
  </table>
</xsl:template>

<xsl:template match="reg_access">
  <table class="register_access">
    <tr>
      <xsl:if test="./@name">
        <th></th>
      </xsl:if>
      <xsl:for-each select="reg_access_state">
        <th><xsl:value-of select="reg_access_level"/></th>
      </xsl:for-each>
    </tr>
    <tr>
      <xsl:if test="./@name">
        <td><xsl:value-of select="./@name"/></td>
      </xsl:if>
      <xsl:for-each select="reg_access_state">
        <td><xsl:value-of select="reg_access_type"/></td>
      </xsl:for-each>
    </tr>
  </table>
  <xsl:if test="../reg_address/reg_component = 'Debug' or ../reg_address/reg_component = 'PMU' or ../reg_address/reg_component = 'CTI'">
    <!-- &#174; is the code for the registered (r) symbol; the more readable &reg; does not work from within XSL. -->
    <p>The meanings of the conditions in the table above are summarised in 'Access permissions for the External debug interface registers' in the <i>Arm<sup>&#174;</sup> Architecture Reference Manual, ARMv8, for ARMv8-A architecture profile</i>, section H8.6.1. The priority at which each condition applies is from highest priority on the left to lowest on the right.</p>
  </xsl:if>
</xsl:template>

<xsl:template name="reg_address_handler">
  <xsl:call-template name="reg_address_preamble">
    <xsl:with-param name="whole_register" select="'True'"/>
  </xsl:call-template>
    <!--<xsl:call-template name="reg_address_preamble">
      <xsl:with-param name="whole_register" select="'False'"/>
      <xsl:with-param name="startbit" select="31"/>
      <xsl:with-param name="endbit" select="0"/>
    </xsl:call-template> -->
  <!-- We deal with this in three parts: the whole register, bits [31:0] of the register, and bits [63:32] of the register. -->
  <!-- First the whole register. -->
  <xsl:if test="reg_address">
    <xsl:for-each select="reg_address">
      <xsl:call-template name="offset_accessibility">
        <xsl:with-param name="reg_address" select="."/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:if>
  <!-- <xsl:if test="reg_address/@register_startbit = 31 and reg_address/@register_endbit = 0"> -->
    <!-- <xsl:for-each select="reg_address[@register_startbit = 31 and @register_endbit = 0]"> -->
      <!-- <xsl:call-template name="offset_accessibility"> -->
        <!-- <xsl:with-param name="reg_address" select="."/> -->
      <!-- </xsl:call-template>    -->
    <!-- </xsl:for-each> -->
  <!-- </xsl:if> -->
  <!-- <xsl:if test="reg_address/@register_startbit = 63 and reg_address/@register_endbit = 32"> -->
    <!-- <xsl:for-each select="reg_address[@register_startbit = 63 and @register_endbit = 32]"> -->
      <!-- <xsl:call-template name="offset_accessibility"> -->
        <!-- <xsl:with-param name="reg_address" select="."/> -->
      <!-- </xsl:call-template>   -->
    <!-- </xsl:for-each> -->
  <!-- </xsl:if>   -->
</xsl:template>

<xsl:template name="offset_accessibility">
  <xsl:param name="reg_address"/>
  <table class="info">
    <!-- Table header -->
    <tr>
      <th>Component</th>
      <xsl:if test="$reg_address/reg_frame"><th>Frame</th></xsl:if>
      <th>Offset</th>
      <xsl:if test="$reg_address/reg_instance">
      <th>Instance</th></xsl:if>
      <xsl:if test="$reg_address/@register_startbit and $reg_address/@register_endbit"><th>Range</th></xsl:if>
    </tr>
    <!-- Table body -->
    <tr>
      <td><xsl:value-of select="$reg_address/reg_component"/></td>
      <xsl:if test="$reg_address/reg_frame">
        <td><xsl:value-of select="$reg_address/reg_frame"/></td>
      </xsl:if>
      <td><xsl:apply-templates select="$reg_address/reg_offset"/></td>
      <xsl:if test="$reg_address/reg_instance">
        <td><xsl:value-of select="$reg_address/reg_instance"/></td>
      </xsl:if>
      <xsl:if test="$reg_address/@register_startbit and $reg_address/@register_endbit">
         <td>
          <xsl:value-of select="$reg_address/@register_startbit"/>
          <xsl:text>:</xsl:text>
          <xsl:value-of select="$reg_address/@register_endbit"/>
        </td>
      </xsl:if>
    </tr>
  </table>
  <xsl:choose>
    <xsl:when test="count($reg_address/reg_access/reg_access_state) = 1 and $reg_address/reg_access/reg_access_state/reg_access_level">
      <p>When <xsl:value-of select="$reg_address/reg_access/reg_access_state/reg_access_level"/><xsl:text> access on this interface </xsl:text><xsl:apply-templates select="$reg_address/reg_access/reg_access_state/reg_access_type"/>.</p>
    </xsl:when>
    <xsl:when test="count($reg_address/reg_access/reg_access_state) > 1">
      <p>This interface is accessible as follows:</p>
      <ul>
        <xsl:for-each select="$reg_address/reg_access/reg_access_state">
          <li>
            <xsl:choose>
              <xsl:when test="reg_access_level">
                <xsl:value-of select="reg_access_level"/>
              </xsl:when>
              <xsl:when test="../reg_access_state/reg_access_level">Otherwise </xsl:when>
              <xsl:otherwise>The </xsl:otherwise>
            </xsl:choose>
            accesses to this register <xsl:apply-templates select="reg_access_type"/>.
          </li>
        </xsl:for-each>
      </ul>
    </xsl:when>
    <xsl:otherwise><p>Accesses on this interface <xsl:apply-templates select="$reg_address/reg_access/reg_access_state/reg_access_type"/>.</p></xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="reg_access_type">
  <xsl:choose>
    <xsl:when test="text() = 'ERROR'">generate an error response</xsl:when>
    <xsl:otherwise>are <span class="access_level"><xsl:value-of select="."/></span></xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="reg_address_preamble">
  <xsl:param name="whole_register"/>
  <xsl:param name="startbit"/>
  <xsl:param name="endbit"/>
  <!-- Note: Since we've been calling templates by name rather than applying them, current node is still register. -->
  <xsl:variable name="REG_NAME">
    <xsl:choose>
      <xsl:when test="$whole_register = 'True'">
        <xsl:value-of select="./reg_short_name"/>
      </xsl:when>
      <xsl:when test="$whole_register = 'False'">
        <xsl:value-of select="./reg_short_name"/>[<xsl:value-of select="$startbit"/>:<xsl:value-of select="$endbit"/>]
      </xsl:when>
    </xsl:choose>
  </xsl:variable>
  <xsl:choose> <!-- These tests rely on the first reg_address having the same values of these attributes as every other reg_address. -->
    <xsl:when test="reg_address[1]/@external_access = 'False' and reg_address[1]/@mem_map_access = 'True' and reg_address[1]/@power_domain = 'Debug'">
      <!-- CTILAR/LSR, PMLAR/LSR, and EDLAR/LSR -->
      <h4><xsl:value-of select="$REG_NAME"/> can be accessed through a memory-mapped access to the external debug interface:</h4>
    </xsl:when>
    <xsl:when test="reg_address[1]/@external_access = 'True'">
      <!-- All remaining CTI, Debug and PMU registers -->
      <h4><xsl:value-of select="$REG_NAME"/> can be accessed through the external debug interface:</h4>
    </xsl:when>
    <xsl:otherwise>
      <!-- Everything else (e.g. GIC, CNT*) -->
      <h4><xsl:value-of select="$REG_NAME"/> can be accessed through the memory-mapped interfaces:</h4>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="reg_address">
  <tr>
    <td><xsl:value-of select="reg_component"/></td>
    <xsl:if test="./reg_frame"><td><xsl:value-of select="reg_frame"/></td></xsl:if>
    <td><xsl:apply-templates select="reg_offset"/></td>
  </tr>
</xsl:template>

<xsl:template match="reg_offset">
  <xsl:apply-templates/> <!-- So as to pick up text formatting on the hex number in the offset. -->
</xsl:template>

<xsl:template match="reg_purpose">
  <xsl:for-each select="purpose_text">
    <xsl:apply-templates/>
  </xsl:for-each>
</xsl:template>

<xsl:template match="reg_reverse_traps_and_enables">
  <xsl:for-each select="reverse_trap_or_enable_text">
    <xsl:apply-templates/>
  </xsl:for-each>
</xsl:template>

<xsl:template match="reg_configuration">
  <xsl:for-each select="configuration_text">
    <xsl:apply-templates/>
  </xsl:for-each>
</xsl:template>

<xsl:template match="reg_attributes">
  <xsl:for-each select="attributes_text">
    <xsl:apply-templates/>
  </xsl:for-each>
</xsl:template>

<xsl:template match="reg_banking">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="reg_mappings">
  <xsl:if test="./reg_mapping">
    <xsl:for-each select="reg_mapping">
      <xsl:variable name="SOURCE">
        <xsl:choose>
        <xsl:when test="./mapped_from_startbit">
          <xsl:choose>
            <xsl:when test="mapped_from_startbit = mapped_from_endbit">
              <xsl:value-of select="../../reg_short_name"/> bit [<xsl:value-of select="mapped_from_startbit"/>]
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="../../reg_short_name"/> bits [<xsl:value-of select="mapped_from_startbit"/>:<xsl:value-of select="mapped_from_endbit"/>]
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="../../reg_short_name"/>
        </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="SOURCE_SEC_STATE">
        <xsl:if test="./mapped_from_sec_state">
          (<xsl:value-of select="./mapped_from_sec_state"/>)
        </xsl:if>
      </xsl:variable>
      <xsl:variable name="SOURCE_EXEC_STATE">
        <xsl:choose>
          <xsl:when test="../../@is_internal = 'False'">
            <xsl:text>External register </xsl:text>
          </xsl:when>
          <xsl:when test="../../@is_internal = 'True'">
            <xsl:value-of select="../../@execution_state"/>
            <xsl:text> System </xsl:text>
            <xsl:choose>
              <xsl:when test="/register_page/registers/register/@is_register = 'False'"> <!-- System instructions vs. registers-->
                <xsl:text>instruction </xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>register </xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="TARGET">
        <xsl:choose>
        <xsl:when test="./mapped_to_startbit">
          <xsl:choose>
            <xsl:when test="mapped_to_startbit = mapped_to_endbit">
              <xsl:value-of select="mapped_name"/>[<xsl:value-of select="mapped_to_startbit"/>]
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="mapped_name"/>[<xsl:value-of select="mapped_to_startbit"/>:<xsl:value-of select="mapped_to_endbit"/>]
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="mapped_name"/>
        </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="TARGET_SEC_STATE">
        <xsl:if test="./mapped_to_sec_state">
          (<xsl:value-of select="./mapped_to_sec_state"/>)
        </xsl:if>
      </xsl:variable>
      <xsl:variable name="TARGET_EXEC_STATE">
        <xsl:choose>
          <xsl:when test="./mapped_execution_state/text() = 'External'">
            <xsl:text>External register </xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="./mapped_execution_state/text()"/>
            <xsl:text> System </xsl:text>
            <xsl:choose>
              <xsl:when test="/register_page/registers/register/@is_register = 'False'"> <!-- System instructions vs. registers-->
                <xsl:text>instruction </xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>register </xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="CONDITION">
        <xsl:choose>
        <xsl:when test="./mapped_from_condition">
          <xsl:text disable-output-escaping="yes"> </xsl:text><xsl:value-of select="mapped_from_condition"/>
        </xsl:when>
        <xsl:when test="./mapped_to_condition">
          <xsl:text disable-output-escaping="yes"> </xsl:text><xsl:value-of select="mapped_to_condition"/>
        </xsl:when>
        <xsl:otherwise>
        </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:choose>
        <xsl:when test="./mapped_type/text() = 'Architectural'">
          <p>
            <xsl:value-of select="$SOURCE_EXEC_STATE"/><xsl:value-of select="$SOURCE"/><xsl:value-of select="$SOURCE_SEC_STATE"/>
            <xsl:choose>
              <xsl:when test="./mapped_from_startbit and ./mapped_from_endbit and mapped_from_startbit != mapped_from_endbit">
                are architecturally mapped to
              </xsl:when>
              <xsl:otherwise>
                is architecturally mapped to
              </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$TARGET_EXEC_STATE"/>
            <a>
              <xsl:if test="mapped_name/@filename">
                <xsl:attribute name="href">
                  <xsl:value-of select="mapped_name/@filename"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="$TARGET"/><xsl:value-of select="$TARGET_SEC_STATE"/>
            </a><xsl:value-of select="$CONDITION"/>.
          </p>
        </xsl:when>
        <xsl:when test="./mapped_type/text() = 'Optional'">
          <p>
            <xsl:value-of select="$SOURCE_EXEC_STATE"/><xsl:value-of select="$SOURCE"/><xsl:value-of select="$SOURCE_SEC_STATE"/>
            can be mapped to
            <xsl:value-of select="$TARGET_EXEC_STATE"/>
            <a>
              <xsl:if test="mapped_name/@filename">
                <xsl:attribute name="href">
                  <xsl:value-of select="mapped_name/@filename"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="$TARGET"/><xsl:value-of select="$TARGET_SEC_STATE"/>
            </a><xsl:value-of select="$CONDITION"/>, but this is not architecturally mandated.
          </p>
        </xsl:when>
        <xsl:when test="./mapped_type/text() = 'Functional'">
          <p>
            <xsl:value-of select="$SOURCE_EXEC_STATE"/><xsl:value-of select="$SOURCE"/><xsl:value-of select="$SOURCE_SEC_STATE"/>
            performs the same function as
            <xsl:value-of select="$TARGET_EXEC_STATE"/>
            <a>
              <xsl:if test="mapped_name/@filename">
                <xsl:attribute name="href">
                  <xsl:value-of select="mapped_name/@filename"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="$TARGET"/><xsl:value-of select="$TARGET_SEC_STATE"/>
            </a><xsl:value-of select="$CONDITION"/>.
          </p>
        </xsl:when>
      </xsl:choose>
    </xsl:for-each>
  </xsl:if>
</xsl:template>

<xsl:template name="memory_mapped_register_power_domain"> <!-- context: register -->
  <!-- Render the statement indicating the power domain of the register. -->
  <xsl:if test="@is_internal = 'False' and reg_address/@power_domain != 'None'">
    <p>
      <xsl:choose>
        <xsl:when test="reg_address/@power_domain = 'Core'">
          <xsl:value-of select="reg_short_name"/> is in the Core power domain.
        </xsl:when>
        <xsl:when test="reg_address/@power_domain = 'Debug'">
          <xsl:value-of select="reg_short_name"/> is in the Debug power domain.
        </xsl:when>
        <xsl:when test="reg_address/@power_domain = 'IMP DEF'">
          <!-- IMP DEF means it is an implementation defined choice
               between Core and Debug power domains. -->
          It is <span class="arm-defined-word">IMPLEMENTATION DEFINED</span> whether <xsl:value-of select="reg_short_name"/> is implemented in the Core power domain or in the Debug power domain.
        </xsl:when>
        <xsl:when test="reg_address/@power_domain = 'Mixed'">
          <xsl:value-of select="reg_short_name"/> contains fields that are in the Core power domain and fields that are in the Debug power domain.
        </xsl:when>
        <xsl:when test="reg_address/@power_domain = 'Any'">
          <!-- Any means that it can be any power domain, including
               those outside the architecture definition. -->
          The power domain of <xsl:value-of select="reg_short_name"/> is <span class="arm-defined-word">IMPLEMENTATION DEFINED</span>.
        </xsl:when>
     </xsl:choose>
   </p>
  </xsl:if>
</xsl:template>

<xsl:template match="reg_fieldsets">
  <xsl:choose>
    <xsl:when test="./fields">
      <xsl:choose>
        <xsl:when test="../@is_register = 'False'"> <!-- System instructions vs. registers-->
          <p>The <xsl:value-of select="../reg_short_name"/> input value bit assignments are:</p>
        </xsl:when>
        <xsl:otherwise>
          <p>The <xsl:value-of select="../reg_short_name"/> bit assignments are:</p>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="./shared_fields">
        <h3>For all register layouts:</h3>
        <xsl:for-each select="shared_fields"> <!-- Change context to shared_fields so we can access the field elements. -->
          <xsl:call-template name="fields_descs"/>
        </xsl:for-each>
      </xsl:if>
      <xsl:apply-templates select="reg_fieldset"/>
    </xsl:when>
    <xsl:otherwise>
      <p><xsl:value-of select="../reg_short_name"/> ignores the value in the register specified by the instruction encoding. Software does not have to write a value to the register before issuing this instruction.</p>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="reg_pseudocode">
  The following pseudocode shows the operation of this register.
  <p class="pseudocode">
    <xsl:value-of select="."/>
  </p>
</xsl:template>

<xsl:template match="reg_encoding">
  <xsl:choose>
    <xsl:when test="../@is_register = 'False'"> <!-- System instructions vs. registers-->
      <xsl:choose>
        <xsl:when test="./reg_condition">
          <p>To execute the <xsl:value-of select="../reg_short_name"/> instruction when <xsl:value-of select="reg_condition"/>:</p>
        </xsl:when>
        <xsl:otherwise>
          <p>The <xsl:value-of select="../reg_short_name"/> instruction is executed as:</p>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <p>To access the <xsl:value-of select="../reg_short_name"/><xsl:if test="./reg_condition"> when <xsl:value-of select="reg_condition"/></xsl:if>:</p>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:apply-templates select="reg_read_instruction"/>
  <xsl:apply-templates select="reg_write_instruction"/>
  <xsl:choose>
    <xsl:when test="../@is_register = 'False'"> <!-- System instructions vs. registers-->
      <p>The instruction is encoded in the System instruction encoding space as follows:</p>
    </xsl:when>
    <xsl:otherwise>
      <p>Register access is encoded as follows:</p>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:apply-templates select="reg_encoding_params"/>
  <xsl:apply-templates select="reg_encoding_text"/>
</xsl:template>

<xsl:template match="reg_read_instruction">
  <p class="asm-code"><xsl:value-of select="../reg_read_instruction"/></p>
</xsl:template>

<xsl:template match="reg_write_instruction">
  <p class="asm-code"><xsl:value-of select="../reg_write_instruction"/></p>
</xsl:template>

<xsl:template match="reg_encoding_params">
  <table class="info">
    <tr>
      <xsl:for-each select="encoding_param">
        <th><xsl:value-of select="encoding_fieldname"/></th>
      </xsl:for-each>
    </tr>
    <tr>
      <xsl:for-each select="encoding_param">
        <td><xsl:value-of select="encoding_fieldvalue"/></td>
      </xsl:for-each>
    </tr>
  </table>
</xsl:template>

<xsl:template match="reg_encoding_text">
  <xsl:apply-templates/>
</xsl:template>

<!-- The following renders the register diagram and the field
     descriptions for the named fields within it.

     It will optionally also render the heading (e.g. "When
     DBGBCR<n>_EL1.BT==0b0x0x:") for the diagram, but this is manually
     configurable using $apply_condition. This is needed for partial
     fieldsets (ESR_ELx) where the caller generates the heading.
-->
<xsl:template match="reg_fieldset">
  <xsl:param name="apply_condition" select="1"/>
  <xsl:variable name="FIELDS-CONDITION" select="fields_condition"/>
  <xsl:variable name="CONDITION">
    <xsl:choose>
      <xsl:when test="$FIELDS-CONDITION != ''"><xsl:value-of select="$FIELDS-CONDITION"/></xsl:when>
      <xsl:otherwise>Otherwise</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:choose>
    <xsl:when test="fields_condition">
      <xsl:if test="$apply_condition != 0">
        <h3><xsl:value-of select="$CONDITION"/>:</h3>
      </xsl:if>
      <xsl:call-template name="reg_diagram">
        <xsl:with-param name="fieldset" select="."/>
      </xsl:call-template>
      <xsl:apply-templates select="../fields[./fields_condition and ./fields_condition = $FIELDS-CONDITION]"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="reg_diagram">
        <xsl:with-param name="fieldset" select="."/>
      </xsl:call-template>
      <xsl:apply-templates select="../fields[not(./fields_condition)]"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- Render a register diagram. The <reg_fieldset> is passed in
     $fieldset.

     The "diagram_number_countdown" template is called to render the
     header and footer for a register diagram. The "reg_field"
     template is called on the first field in the register to render
     it, which will recursively render the subsequent fields.
-->
<xsl:template name="reg_diagram">
  <xsl:param name="fieldset"/>
  <xsl:choose>
    <xsl:when test="@length &gt; 64"></xsl:when>
    <xsl:otherwise>
      <table class="regdiagram">
      <xsl:choose>
        <xsl:when test="@length = '64'">
          <!-- If the register is 64-bit in length, we need to print the
               register over two rows, with a header and footer like this:

                63 62 61       32
               +==+==+==+=====+==+
               |        | ... |  |
               +==+==+==+=====+==+
               |  |     | ... |  |
               +==+==+==+=====+==+
                31 30 29        0
          -->
          <thead>
            <tr>
              <xsl:call-template name="diagram_number_countdown">
                <xsl:with-param name="current_num" select="63"/>
                <xsl:with-param name="last_num" select="32"/>
              </xsl:call-template>
            </tr>
          </thead>
          <tbody>
            <tr class="firstrow">
              <xsl:call-template name="reg_field">
                <xsl:with-param name="fieldset" select="$fieldset"/>
                <xsl:with-param name="msb" select="63"/>
                <xsl:with-param name="min_lsb" select="32"/>
              </xsl:call-template>
            </tr>
            <tr class="firstrow">
              <xsl:call-template name="reg_field">
                <xsl:with-param name="fieldset" select="$fieldset"/>
                <xsl:with-param name="msb" select="31"/>
                <xsl:with-param name="min_lsb" select="0"/>
              </xsl:call-template>
            </tr>
          </tbody>
          <tfoot>
            <tr>
              <xsl:call-template name="diagram_number_countdown">
                <xsl:with-param name="current_num" select="31"/>
                <xsl:with-param name="last_num" select="0"/>
              </xsl:call-template>
            </tr>
          </tfoot>
        </xsl:when>
        <xsl:otherwise>
          <!-- If the register is not 64-bit in length, we need to print
               the register over a single row with one header.

                31 30 29        0
               +==+==+==+=====+==+
               |        | ... |  |
               +==+==+==+=====+==+

               Note: Registers that are larger than 32-bits, and not
               64-bit length, also end up here, and will effectively be a
               long row. This may be better done in another way, but this
               does not occur (yet), so is not handled.
          -->
          <thead>
            <tr>
              <xsl:call-template name="diagram_number_countdown">
                <xsl:with-param name="current_num" select="@length - 1"/>
                <xsl:with-param name="last_num" select="0"/>
              </xsl:call-template>
            </tr>
          </thead>
          <tbody>
            <tr class="firstrow">
              <xsl:call-template name="reg_field">
                <xsl:with-param name="fieldset" select="$fieldset"/>
                <xsl:with-param name="msb" select="@length - 1"/>
                <xsl:with-param name="min_lsb" select="0"/>
              </xsl:call-template>
            </tr>
          </tbody>
        </xsl:otherwise>
      </xsl:choose>
      </table>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- Render a field located at $msb within $fieldset, and then go onto
     the next one.

     $msb is the most-significant bit of the current field.

     $min_lsb is the least-significant bit at which to stop rendering fields.
-->
<xsl:template name="reg_field">
  <xsl:param name="fieldset"/>
  <xsl:param name="msb"/>
  <xsl:param name="min_lsb"/>
  <!-- get the <fieldat> element that contains the $msb. -->
  <xsl:variable name="FIELDAT" select="$fieldset/fieldat[@msb &gt;= $msb and @lsb &lt;= $msb]"/>
  <xsl:variable name="FIELD" select="$fieldset/../fields/field[@id = $FIELDAT/@id]"/>
  <xsl:variable name="FIELD_MSB" select="$msb"/>
  <xsl:variable name="FIELD_LSB">
    <xsl:choose>
      <xsl:when test="not($FIELDAT)">
        <!-- When there is no <fieldat> covering this bit, we don't
             have a field, so assume a single bit field. The
             $FIELD_NAME will be set to "*ERR*" which visually
             indicates an error to the reader.
        -->
        <xsl:value-of select="$FIELD_MSB"/>
      </xsl:when>
      <!-- Otherwise the LSB is the largest of the $min_lsb and the
           field's LSB.
      -->
      <xsl:when test="$FIELDAT/@lsb &gt;= $min_lsb">
        <xsl:value-of select="$FIELDAT/@lsb"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$min_lsb"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="FIELD_WIDTH" select="$FIELD_MSB - $FIELD_LSB + 1"/>
  <xsl:variable name="FIELD_NAME">
    <xsl:choose>
      <xsl:when test="$FIELD/field_name">
        <xsl:value-of select="$FIELD/field_name"/>
      </xsl:when>
      <xsl:when test="$FIELD/field_shortdesc">
        <xsl:value-of select="$FIELD/field_shortdesc"/>
      </xsl:when>
      <xsl:otherwise>
        *ERR*
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <!-- ID for the field, which is used as the anchor for the field
       description.
  -->
  <xsl:variable name="ID">
    <xsl:choose>
      <xsl:when test="$FIELDAT/../fields_condition != ''">
        <!-- Incorporate the condition, since there may be multiple
             fields with the same name.
        -->
        <xsl:value-of select="translate($FIELDAT/../fields_condition/text(),'[]= ','')"/>_<xsl:value-of select="translate($FIELD_NAME,'[]= ','')"/>
      </xsl:when>
      <xsl:when test="$FIELDAT/../fields_condition">
        <!-- Incorporate the OTHERWISE condition.
        -->
        <xsl:text>Otherwise_</xsl:text><xsl:value-of select="translate($FIELD_NAME,'[]= ','')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="translate($FIELD_NAME,'[]= ','')"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <!-- Now output the field -->  
  <xsl:variable name="RESERVED_TYPE">
    <xsl:if test="$FIELD/@rwtype"><xsl:value-of select="$FIELD/@rwtype"/></xsl:if>
  </xsl:variable>
  <xsl:choose>
    <xsl:when test="$FIELD/field_array and $FIELD/@is_variable_length = 'False'">
      <!-- This an array field, where the overall size is fixed and
           the number of elements can be statically determined.
           (e.g. "P<x>, where x = 0 to 31".)
      -->
      <xsl:variable name="FULL_FIELD_WIDTH">
        <xsl:value-of select="$FIELD/field_msb - $FIELD/field_lsb + 1"/>
      </xsl:variable>
      <xsl:variable name="ELEMENT_WIDTH">
        <xsl:value-of select="$FULL_FIELD_WIDTH div ($FIELD/field_array/field_array_start - $FIELD/field_array/field_array_end + 1)"/>
      </xsl:variable>
      <xsl:variable name="ELEMENT_START">
        <xsl:choose>
          <!-- We can either be rendering from the start (MSB) of the
               field, or from within it. (e.g. When the register is 64
               bits in size, and the we have crossed the 32-bit boundary.)
          -->
          <xsl:when test="$FIELD/field_msb &gt; $FIELD_MSB">
            <xsl:value-of select="$FIELD/field_array/field_array_start - (($FIELD/field_msb - $FIELD_MSB) div $ELEMENT_WIDTH)"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$FIELD/field_array/field_array_start"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="ELEMENT_END">
        <xsl:choose>
          <!-- We can either be rendering to the end (LSB) of the
               field, or somewhere within it. (e.g. When the register is 64
               bits in size, and the we have crossed the 32-bit boundary.)
          -->
          <xsl:when test="$FIELD/field_lsb &lt; $FIELD_LSB">
            <xsl:value-of select="$FIELD/field_array/field_array_end + (($FIELD_LSB - $FIELD/field_lsb) div $ELEMENT_WIDTH)"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$FIELD/field_array/field_array_end"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:call-template name="reg_field_array">
        <xsl:with-param name="id" select="$ID"/>
        <xsl:with-param name="field" select="$FIELD"/>
        <xsl:with-param name="width" select="$FIELD_WIDTH"/>
        <xsl:with-param name="element_count_start" select="$ELEMENT_START"/>
        <xsl:with-param name="element_count_end" select="$ELEMENT_END"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="$FIELD/field_array and $FIELD/@is_variable_length = 'True'">
      <!-- This an array field, where the overall size is fixed, but
           the total number of elements cannot be statically
           determined. (e.g. "P<x>, where x < PMCR_EL0.N".)
      -->
      <xsl:variable name="MODIFIED_FIELD_NAME">
        <xsl:variable name="ARRAY_OFFSET">
          <xsl:if test="$FIELD/field_lsb > 0">+<xsl:value-of select="$FIELD/field_lsb"/></xsl:if>
        </xsl:variable>
        <xsl:value-of select="$FIELD_NAME"/>, bit [<xsl:value-of select="$FIELD/field_array/field_array_description"/>]
      </xsl:variable>
      <xsl:call-template name="reg_field_single">
        <xsl:with-param name="id"><xsl:value-of select="$ID"/>_<xsl:value-of select="$FIELD_MSB"/></xsl:with-param>
        <xsl:with-param name="width" select="$FIELD_WIDTH"/>
        <xsl:with-param name="name" select="$MODIFIED_FIELD_NAME"/>
        <xsl:with-param name="reservedvaluetype" select="$RESERVED_TYPE"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <!-- All other fields are simple. -->
      <xsl:call-template name="reg_field_single">
        <xsl:with-param name="id"><xsl:value-of select="$ID"/>_<xsl:value-of select="$FIELD/field_msb"/></xsl:with-param>
        <xsl:with-param name="width" select="$FIELD_WIDTH"/>
        <xsl:with-param name="name" select="$FIELD_NAME"/>
        <xsl:with-param name="reservedvaluetype" select="$RESERVED_TYPE"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
  <!-- Move onto the next field... -->
  <xsl:if test="$FIELD_LSB &gt; $min_lsb">
    <xsl:call-template name="reg_field">
      <xsl:with-param name="fieldset" select="$fieldset"/>
      <xsl:with-param name="msb" select="$FIELD_LSB - 1"/>
      <xsl:with-param name="min_lsb" select="$min_lsb"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<!-- Render a single field, with a link to the description if given
     $id.
-->
<xsl:template name="reg_field_single">
  <xsl:param name="id"/>
  <xsl:param name="width"/>
  <xsl:param name="name"/>
  <xsl:param name="reservedvaluetype"/>
  
  <xsl:variable name="LABEL">
    <xsl:choose>
      <xsl:when test="$reservedvaluetype != ''"><xsl:value-of select="$reservedvaluetype"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$name"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <td class="lr" colspan="{ $width }">
    <xsl:choose>
      <xsl:when test="$id">
        <a href="#{ $id }">
          <xsl:value-of select="$LABEL"/>
        </a>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$LABEL"/>
      </xsl:otherwise>
    </xsl:choose>
  </td>
</xsl:template>

<!-- Render a set of elements in a field array. This will be either a
     single field with a description indicating that there are
     multiple elements, or as a set of elements, e.g.P<x> becomes...

     +=====+=====+=====+
     | P31 | P30 | P29 | ...
     +=====+=====+=====+
-->
<xsl:template name="reg_field_array">
  <xsl:param name="id"/>
  <xsl:param name="field"/>
  <xsl:param name="width"/>
  <xsl:param name="element_count_start"/>
  <xsl:param name="element_count_end"/>
  <xsl:variable name="FIELD_ELEMENT_SIZE">
    <xsl:value-of select="$width div ($element_count_start - $element_count_end + 1)"/>
  </xsl:variable>

  <xsl:variable name="FIELD_NAME" select="$field/field_name"/>
  <xsl:variable name="FIELD_NAME_PREFIX">
    <xsl:value-of select="substring-before($FIELD_NAME,'&lt;')"/>
  </xsl:variable>
  <xsl:variable name="INDEX_LETTER"> <!-- e.g. in "Status<x>", this returns 'x'. -->
    <xsl:value-of select="substring-before(substring-after($FIELD_NAME,'&lt;'),'&gt;')"/>
  </xsl:variable>
  <!-- Heuristic to choose when to join all elements in the diagram as
       a single entry, e.g.

         SGI_clear_pending_bits<x>, bits [8x+7:8x], for x = 0 to 3
  -->
  <xsl:choose>
    <xsl:when test="(string-length($FIELD_NAME_PREFIX) div $FIELD_ELEMENT_SIZE) &gt; 2 and $width &gt; 8">
      <xsl:variable name="EXPANDED_NAME">
        <xsl:choose>
          <xsl:when test="$FIELD_ELEMENT_SIZE &gt; 1">
            <xsl:value-of select="$FIELD_NAME"/>, bits [<xsl:value-of select="$field/field_array/field_array_description"/>], for <xsl:value-of select="$INDEX_LETTER"/> = <xsl:value-of select="$element_count_end"/> to <xsl:value-of select="$element_count_start"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$FIELD_NAME"/>, bit [<xsl:value-of select="$field/field_array/field_array_description"/>], for <xsl:value-of select="$INDEX_LETTER"/> = <xsl:value-of select="$element_count_end"/> to <xsl:value-of select="$element_count_start"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:call-template name="reg_field_single">
        <xsl:with-param name="id"><xsl:value-of select="$id"/>_<xsl:value-of select="$field/field_msb"/></xsl:with-param>
        <xsl:with-param name="width" select="$width"/>
        <xsl:with-param name="name" select="$EXPANDED_NAME"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <!-- Render the first element, and then recursively do the next
           element until the end.
      -->
      <xsl:call-template name="reg_field_single">
        <xsl:with-param name="id"><xsl:value-of select="$id"/>_<xsl:value-of select="$field/field_msb"/></xsl:with-param>
        <xsl:with-param name="width" select="$FIELD_ELEMENT_SIZE"/>
        <xsl:with-param name="name" select="concat($FIELD_NAME_PREFIX,$element_count_start)"/>
      </xsl:call-template>
      <xsl:if test="$element_count_start &gt; $element_count_end">
        <xsl:call-template name="reg_field_array">
          <xsl:with-param name="id" select="$id"/>
          <xsl:with-param name="field" select="$field"/>
          <xsl:with-param name="width" select="$width - $FIELD_ELEMENT_SIZE"/>
          <xsl:with-param name="element_count_start" select="$element_count_start - 1"/>
          <xsl:with-param name="element_count_end" select="$element_count_end"/>
        </xsl:call-template>
      </xsl:if>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="fields">
  <xsl:apply-templates select="text_before_fields"/>
  <xsl:call-template name="fields_descs"/>
  <xsl:apply-templates select="text_after_fields"/>
</xsl:template>

<xsl:template name="fields_diagram">
  <table class="regdiagram">
  <xsl:choose>
    <xsl:when test="@length = '32'"> <!-- 32-bit encodings are one of the default ones. -->
      <thead>
        <tr>
          <xsl:call-template name="diagram_number_countdown">
            <xsl:with-param name="current_num" select="31"/>
            <xsl:with-param name="last_num" select="0"/>
          </xsl:call-template>
        </tr>
      </thead>
      <tbody>
        <tr class="firstrow">
          <xsl:apply-templates select="field">
            <xsl:sort select="field_msb" data-type="number" order="descending"/>
          </xsl:apply-templates>
        </tr>
      </tbody>
    </xsl:when>
    <xsl:when test="@length = '64'"> <!-- 64-bit encodings are one of the default ones, but need some extra handling. -->
      <thead>
        <tr>
          <xsl:call-template name="diagram_number_countdown">
            <xsl:with-param name="current_num" select="63"/>
            <xsl:with-param name="last_num" select="32"/>
          </xsl:call-template>
        </tr>
      </thead>
      <tbody>
        <tr class="firstrow">
          <xsl:apply-templates select="field[field_msb &gt; 31]">
            <xsl:with-param name="row" select="1"/>
          </xsl:apply-templates>
        </tr>
        <tr class="firstrow">
          <xsl:apply-templates select="field[field_lsb &lt; 32]">
            <xsl:with-param name="row" select="2"/>
          </xsl:apply-templates>
        </tr>
      </tbody>
      <tfoot>
        <tr>
          <xsl:call-template name="diagram_number_countdown">
            <xsl:with-param name="current_num" select="31"/>
            <xsl:with-param name="last_num" select="0"/>
          </xsl:call-template>
        </tr>
      </tfoot>
    </xsl:when>
    <xsl:otherwise>
      <thead>
        <tr>
          <xsl:call-template name="diagram_number_countdown">
            <xsl:with-param name="current_num" select="number(@length) - 1"/>
            <xsl:with-param name="last_num" select="0"/>
          </xsl:call-template>
        </tr>
      </thead>
      <tbody>
        <tr class="firstrow">
          <xsl:apply-templates select="field">
            <xsl:sort select="field_msb" data-type="number" order="descending"/>
          </xsl:apply-templates>
        </tr>
      </tbody>
    </xsl:otherwise>
  </xsl:choose>
  </table>
</xsl:template>

<xsl:template name="diagram_number_countdown">
  <xsl:param name="current_num"/>
  <xsl:param name="last_num"/>
  <xsl:if test="$current_num &gt;= $last_num">
    <td><xsl:value-of select="$current_num"/></td>
    <xsl:call-template name="diagram_number_countdown">
      <xsl:with-param name="current_num" select="$current_num - 1"/>
      <xsl:with-param name="last_num" select="$last_num"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xsl:template match="field">
  <xsl:param name="row"/>
  <!-- Display only the first field at each position on the diagram.

       This would be better done by a recursive template, which will
       go across the register from the most-significant-bit to the
       least-significant-bit.
  -->
  <xsl:variable name="MSB" select="field_msb"/>
  <xsl:variable name="LSB" select="field_lsb"/>
  <xsl:if test=". = ../field[field_msb/text() = $MSB][1] and . = ../field[field_lsb/text() = $LSB][1]">
    <xsl:choose>
      <xsl:when test="$row = 1 and field_lsb &lt; 32">
        <!-- Row is first, field_lsb less than 32, calling field template with adjusted width. -->
        <xsl:call-template name="field_width_adjust">
          <xsl:with-param name="width" select="field_msb - 31"/>
          <xsl:with-param name="adjusted_lsb" select="32"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$row = 2 and field_msb &gt; 31">
        <!-- Row is last, field_msb more than 31, calling field template with adjusted width. -->
        <xsl:call-template name="field_width_adjust">
          <xsl:with-param name="width" select="32 - field_lsb"/>
          <xsl:with-param name="adjusted_msb" select="31"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="field_width_adjust"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:if>
</xsl:template>

<xsl:template name="field_width_adjust">
  <xsl:param name="width" select="field_msb - field_lsb + 1"/>
  <xsl:param name="adjusted_msb" select="field_msb"/>
  <xsl:param name="adjusted_lsb" select="field_lsb"/>
  <!--<xsl:param name="l_class" select="l"/>  use to override the border setting for left side of recursive fields (e.g. 0/1)-->
  <!--<xsl:param name="r_class" select="r"/>  use to override the border setting for right side of recursive fields -->
  <!--<xsl:param name="whole_class" select="lr"/>  use to override the border setting for left or right side of non-recursive fields -->
  <xsl:variable name="field_name">
    <xsl:choose>
      <xsl:when test="field_name">
        <xsl:value-of select="field_name"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="field_shortdesc"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <!--If our field is one of 0,1,(0),(1) - we want to treat it specially. -->
  <xsl:choose>
    <xsl:when test="translate($field_name,'1()','0') = 0">
      <xsl:choose>
        <!-- If it's only 1 bit wide, treat it like the normal fields. -->
        <xsl:when test="$width = 1">
          <td class="lr">
            <xsl:value-of select="field_name"/>
          </td>
        </xsl:when>
        <!-- Otherwise, add the leftmost field, then recurse until we're done. -->
        <xsl:otherwise>
          <td class="l">
            <xsl:value-of select="field_name"/>
          </td>
          <xsl:call-template name="field_recurse">
            <xsl:with-param name="count" select="$width - 1"/>
          <!--  <xsl:with-param name="r_class" select="$r_class"/> -->
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <!-- If this field is not 0 or 1, just sort it out normally. -->
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="field_array and @is_variable_length='False'">
          <xsl:variable name="original_width"> <!-- i.e. width of each of the smaller fields in the array -->
            <xsl:value-of select="(field_msb - field_lsb + 1) div (field_array/field_array_start - field_array/field_array_end + 1)"/>
          </xsl:variable>
          <xsl:variable name="array_start">
            <xsl:choose>
              <xsl:when test="field_msb = $adjusted_msb">
                <xsl:value-of select="field_array/field_array_start"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="(($adjusted_msb + 1) div $original_width) - 1"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <xsl:variable name="array_end">
            <xsl:choose>
              <xsl:when test="field_lsb = $adjusted_lsb">
                <xsl:value-of select="field_array/field_array_end"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$adjusted_lsb div $original_width"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <!-- In most cases we will render these array fields as a succession of fields with numbers in the name. -->
          <!-- There are two cases where we won't, and will instead render them as "FOO<n>, n=31 to 0" or similar:
           1) if the field has more than 2 characters in its name per bit of the small fields (not including the <n> at the end).
           2) if the array field as a whole is smaller than 8 bits (as in this case the "FOO<n>, n=31 to 0" might not fit). -->
          <xsl:variable name="field_name_prefix">
            <xsl:value-of select="substring-before($field_name,'&lt;')"/>
          </xsl:variable>
          <xsl:variable name="index_letter"> <!-- e.g. in "Status<x>", this returns 'x'. -->
            <xsl:value-of select="substring-before(substring-after($field_name,'&lt;'),'&gt;')"/>
          </xsl:variable>
          <xsl:choose>
            <xsl:when test="(string-length($field_name_prefix) div $original_width) &gt; 2 and $width &gt; 8">
              <xsl:variable name="expanded_array_field_name">
                <xsl:choose>
                  <xsl:when test="$width div ($array_start - $array_end + 1) &gt; 1">
                    <xsl:value-of select="field_name"/>, bits [<xsl:value-of select="field_array/field_array_description"/>], for <xsl:value-of select="$index_letter"/> = <xsl:value-of select="field_array/field_array_end"/> to <xsl:value-of select="field_array/field_array_start"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="field_name"/>, bit [<xsl:value-of select="field_array/field_array_description"/>], for <xsl:value-of select="field_array/field_array_description"/> = <xsl:value-of select="field_array/field_array_end"/> to <xsl:value-of select="field_array/field_array_start"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
              <xsl:call-template name="field_single">
                <xsl:with-param name="width" select="$width"/>
                <xsl:with-param name="field_name" select="$expanded_array_field_name"/>
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="field_array_recurse">
                <xsl:with-param name="prefix" select="$field_name_prefix"/>
                <xsl:with-param name="current_number" select="$array_start"/>
                <xsl:with-param name="last_number" select="$array_end"/>
                <xsl:with-param name="subwidth" select="$original_width"/>
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <!-- We are just rendering this field as a single field with a single name. -->
          <xsl:call-template name="field_single">
            <xsl:with-param name="width" select="$width"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="field_single">
  <xsl:param name="width"/>
  <xsl:param name="field_name"/>
  <xsl:variable name="ID"> <!-- Use the node's original field_name for this, not whatever we've assigned to the $field_name param. -->
    <xsl:choose>
      <xsl:when test="../fields_condition != ''">
       <xsl:value-of select="translate(../fields_condition/text(),'[]= ','')"/>_<xsl:value-of select="field_name"/>
      </xsl:when>
      <xsl:when test="../fields_condition">
       <xsl:text>Otherwise_</xsl:text><xsl:value-of select="translate(field_name,'[]= ','')"/>
      </xsl:when>
      <xsl:when test="field_name">
        <xsl:value-of select="translate(field_name,'[]= ','')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="translate(field_shortdesc/text(),'[]= ','')"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <td colspan="{$width}" class="lr">
    <a>
      <xsl:attribute name="href">#<xsl:value-of select="$ID"/></xsl:attribute>
      <xsl:choose>
        <xsl:when test="$field_name"> <!-- If we manually passed in a name for this field, use that. -->
          <xsl:value-of select="$field_name"/>
        </xsl:when>
        <xsl:when test="@is_variable_length='True'">
          <xsl:value-of select="field_name"/>, bit [<xsl:value-of select="field_array/field_array_description"/>]
        </xsl:when>
        <xsl:when test="field_name">
          <xsl:value-of select="field_name"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="field_shortdesc"/>
        </xsl:otherwise>
      </xsl:choose>
    </a>
  </td>
</xsl:template>

<xsl:template name="field_array_recurse">
  <xsl:param name="prefix"/>
  <xsl:param name="current_number"/>
  <xsl:param name="last_number"/>
  <xsl:param name="subwidth"/>
  <xsl:variable name="ID">
    <xsl:choose>
      <xsl:when test="../fields_condition != ''">
       <xsl:value-of select="translate(../fields_condition/text(),'[]= ','')"/>_<xsl:value-of select="translate($prefix,'[]= ','')"/>
      </xsl:when>
      <xsl:when test="../fields_condition">
        <xsl:text>Otherwise_</xsl:text><xsl:value-of select="translate($prefix,'[]= ','')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="translate($prefix,'[]= ','')"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <td colspan="{$subwidth}" class="lr">
    <a>
    <xsl:attribute name="href">#<xsl:value-of select="$ID"/></xsl:attribute>
    <xsl:value-of select="$prefix"/><xsl:value-of select="$current_number"/>
    </a>
  </td>
  <xsl:if test="$current_number &gt; $last_number">
    <xsl:call-template name="field_array_recurse">
      <xsl:with-param name="prefix" select="$prefix"/>
      <xsl:with-param name="current_number" select="$current_number - 1"/>
      <xsl:with-param name="last_number" select="$last_number"/>
      <xsl:with-param name="subwidth" select="$subwidth"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xsl:template name="field_recurse">
  <xsl:param name="count" select="1"/>
  <!-- <xsl:param name="r_class" select="r"/> use to override the border setting for right side of recursive fields -->
  <xsl:choose>
    <xsl:when test="$count = 1">
      <td class="r">
        <xsl:value-of select="field_name"/>
      </td>
    </xsl:when>
    <xsl:otherwise>
      <td>
        <xsl:value-of select="field_name"/>
      </td>
      <xsl:call-template name="field_recurse">
        <xsl:with-param name="count" select="$count - 1"/>
        <!--<xsl:with-param name="r_class" select="$r_class"/>-->
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="fields_descs">
  <xsl:for-each select="field">
    <xsl:if test="field_description">
      <xsl:variable name="MSB">
        <xsl:value-of select="field_msb"/>
      </xsl:variable>
      <xsl:variable name="LSB">
        <xsl:value-of select="field_lsb"/>
      </xsl:variable>
      <xsl:variable name="IDNAME">
        <xsl:choose>
          <xsl:when test="field_name">
            <xsl:value-of select="translate(field_name,'[]= ','')"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="translate(field_shortdesc/text(),'[]= ','')"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="ID">
        <xsl:choose>
          <xsl:when test="../fields_condition != ''">
            <xsl:value-of select="translate(../fields_condition/text(),'[]= ','')"/>_<xsl:value-of select="$IDNAME"/>_<xsl:value-of select="$MSB"/>
          </xsl:when>
          <xsl:when test="../fields_condition">
            <xsl:text>Otherwise_</xsl:text><xsl:value-of select="$IDNAME"/>_<xsl:value-of select="$MSB"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$IDNAME"/>_<xsl:value-of select="$MSB"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="HEADER">
        <xsl:choose>
          <xsl:when test="$MSB &gt; $LSB">
            <xsl:choose>
              <!--As earlier, if our field is one of 0,1,(0),(1) - we want to treat it specially. -->
              <xsl:when test="@rwtype != ''">
                Bits [<xsl:value-of select="field_msb"/>:<xsl:value-of select="field_lsb"/>]
              </xsl:when>
              <!-- We also treat it specially if it's an anonymous field. -->
              <xsl:when test="not(field_name)">
                Bits [<xsl:value-of select="field_msb"/>:<xsl:value-of select="field_lsb"/>]
              </xsl:when>
              <xsl:otherwise>
                <xsl:choose>
                  <xsl:when test="field_array">
                    <xsl:variable name="array_start">
                      <xsl:value-of select="field_array/field_array_start"/>
                    </xsl:variable>
                    <xsl:variable name="array_end">
                      <xsl:value-of select="field_array/field_array_end"/>
                    </xsl:variable>
                    <xsl:variable name="index_letter"> <!-- e.g. in "Status<x>", this returns 'x'. -->
                      <xsl:value-of select="substring-before(substring-after(field_name,'&lt;'),'&gt;')"/>
                    </xsl:variable>
                    <xsl:choose>
                      <xsl:when test="($MSB - $LSB + 1) div ($array_start - $array_end + 1) &gt; 1">
                        <xsl:value-of select="field_name"/>, bits [<xsl:value-of select="field_array/field_array_description"/>], for <xsl:value-of select="$index_letter"/> = <xsl:value-of select="field_array/field_array_end"/> to <xsl:value-of select="field_array/field_array_start"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="field_name"/>, bit [<xsl:value-of select="field_array/field_array_description"/>], for <xsl:value-of select="$index_letter"/> = <xsl:value-of select="field_array/field_array_end"/> to <xsl:value-of select="field_array/field_array_start"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="field_name"/>, bits [<xsl:value-of select="field_msb"/>:<xsl:value-of select="field_lsb"/>]
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:otherwise>
            <xsl:choose>
              <!--Again, if our field is 0,1,(0) or (1) we treat it differently. -->
              <xsl:when test="@rwtype != ''">
                Bit [<xsl:value-of select="field_msb"/>]
              </xsl:when>
              <!-- We also treat it specially if it's an anonymous field. -->
              <xsl:when test="not(field_name)">
                Bit [<xsl:value-of select="field_msb"/>]
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="field_name"/>, bit [<xsl:value-of select="field_msb"/>]
              </xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <h4>
        <xsl:attribute name="id">
          <xsl:value-of select="translate($ID,'[]= ','')"/>
        </xsl:attribute>
        <xsl:choose>
        <!-- Print out a "header" if the previously printed field has a different
             bit range to the current one, or if the current field is the first one
             in the list. If the current field shares the same bit range as the
             previous one, then a "header" would be redundant, since one will already
             have been printed. -->
          <xsl:when test="preceding-sibling::*[1] and preceding-sibling::*[1]/field_description">
            <xsl:if test="$MSB!=preceding-sibling::*[1]/field_msb or $LSB!=preceding-sibling::*[1]/field_lsb">
              <xsl:value-of select="$HEADER"/>
            </xsl:if>
            </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$HEADER"/>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="./fields_condition">
            <div style="font-size:smaller;">
              <br/>
              <xsl:choose>
                <xsl:when test="substring(./fields_condition,1,8)='From ARM'">
                  <xsl:text>From Arm</xsl:text><xsl:value-of select="substring(./fields_condition,9)"/>:
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="./fields_condition"/>:
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </xsl:when>
          <xsl:when test="not(./fields_condition) and ../field[field_msb = $MSB and field_lsb = $LSB]/fields_condition">
            <div style="font-size:smaller;">
              <br />
              Otherwise:
            </div>
          </xsl:when>
        </xsl:choose>
      </h4>
      <xsl:apply-templates select="field_description[@order='before']"/>
      <xsl:apply-templates select="field_values"/>
      <xsl:apply-templates select="field_description[@order='after']"/>
      <xsl:apply-templates select="field_resets"/>
      <xsl:if test="field_access">
        <xsl:apply-templates select="field_access"/>
      </xsl:if>
      <!-- And if it has further definitions in the form of partial fieldsets, include them. -->
      <xsl:if test="./partial_fieldset">
        <xsl:apply-templates select="partial_fieldset"/>
      </xsl:if>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<xsl:template match="field_description">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="field_resets">
  <xsl:choose>
    <!-- If there are multiple resets, display them in a bulleted list.
         In this case, if there is an IMP DEF reset it must be displayed
         after all non-IMP DEF resets.

         If there is only a single reset, display it as a paragraph. -->
    <xsl:when test="count(field_reset) > 1">
      <p>The following resets apply:</p>
      <ul>
        <xsl:for-each select="field_reset[not(@reset_type = 'impdef')]">
          <li><xsl:apply-templates select="."/></li>
        </xsl:for-each>
        <xsl:for-each select="field_reset[@reset_type = 'impdef']">
          <li><xsl:apply-templates select="."/></li>
        </xsl:for-each>
      </ul>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates select="field_reset"/> <!-- For all types of reset including IMP DEF. -->
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="field_reset[count(../*) = 1]"> <!-- Single field reset. -->
  <xsl:choose>
    <!-- Either render an authored 'special text' or a generated 'standard text'.
         Word order is determined by reset type (IMP DEF type resets require the IMP DEF
         statement to be at the start of the sentence).-->
    <xsl:when test="field_reset_special_text"> <!-- Reset has custom text. -->
      <xsl:apply-templates select="field_reset_special_text"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="not(parent::field_reset_condition)">
          <p><xsl:call-template name="single-reset"/></p>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="single-reset"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="single-reset"> <!-- context: field_reset -->
  <xsl:if test="@in_domain">When implemented in the <xsl:value-of select="@in_domain"/> domain, </xsl:if>
  <xsl:choose>
    <xsl:when test="@reset_type = 'impdef'"> <!-- Reset occurs under IMP DEF circumstances. -->
      <xsl:text>It is </xsl:text>
      <span class="arm-defined-word">IMPLEMENTATION DEFINED</span>
      <xsl:text> when this field resets to</xsl:text>
    </xsl:when>
    <xsl:otherwise> <!-- Reset occurs always. -->
      <xsl:if test="@reset_type or ancestor::register/reg_reset_value/@type != ''">
        <xsl:variable name="reset-type">
          <xsl:choose>
            <xsl:when test="@reset_type and @reset_type != ''">
              <xsl:value-of select="@reset_type"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="ancestor::register/reg_reset_value/@type"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="@in_domain">on a </xsl:when>
          <xsl:otherwise>On a </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="$reset-type"/><xsl:text> reset, </xsl:text>
      </xsl:if>
      <xsl:if test="@reset_instance">
        <xsl:choose>
          <xsl:when test="@in_domain or @reset_type or ancestor::register/reg_reset_value/@type != ''">
            <xsl:text>in the </xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>In the </xsl:text>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="@reset_instance"/><xsl:text> instance, </xsl:text>
      </xsl:if>
      <xsl:call-template name="reset_using_el"/>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:choose> <!-- Multiple reset values - IMP DEF choice between them. -->
    <xsl:when test="count(child::*) > 1">
      <xsl:text> an </xsl:text><span class="arm-defined-word">IMPLEMENTATION DEFINED</span><xsl:text> choice between:</xsl:text>
      <ul>
        <xsl:for-each select="./*">
          <li>
            <xsl:apply-templates select=".">
              <xsl:with-param name="initial-caps" select="'True'"/>
            </xsl:apply-templates>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="field_reset_conditions">
          <xsl:text>:</xsl:text>
          <ul>
            <xsl:for-each select="field_reset_conditions/*">
              <li>
                <xsl:choose>
                  <xsl:when test="name() = 'field_reset_condition'">
                    <xsl:text>If </xsl:text><xsl:value-of select="@condition"/><xsl:text>, </xsl:text>
                  </xsl:when>
                  <xsl:otherwise> <!-- not compatible with @in_domain -->
                    <xsl:text>Otherwise, </xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:apply-templates select=".">
                  <xsl:with-param name="initial-caps" select="'False'"/>
                </xsl:apply-templates>
              </li>
            </xsl:for-each>
          </ul>
        </xsl:when>
        <xsl:when test="not(field_reset_standard_text) or field_reset_standard_text != 'UC'">
          <xsl:text> </xsl:text>
          <xsl:apply-templates select="./*"/>
        </xsl:when>
        <xsl:otherwise>.</xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="field_reset[count(../*) > 1]"> <!-- Multiple field resets. -->
  <xsl:choose>
    <!-- Either render an authored 'special text' or a generated 'standard text'.
         Word order is determined by reset type (IMP DEF type resets require the IMP DEF
         statement to be near the start of the sentence).-->
    <xsl:when test="field_reset_special_text"> <!-- Reset has custom text. -->
      <xsl:apply-templates select="field_reset_special_text"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="not(parent::field_reset_condition)">
          <p><xsl:call-template name="multiple-reset"/></p>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="multiple-reset"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="multiple-reset"> <!-- context: field_reset -->
  <xsl:if test="@in_domain">When implemented in the <xsl:value-of select="@in_domain"/> domain, </xsl:if>
  <xsl:choose>
    <xsl:when test="@reset_type = 'impdef'"> <!-- Reset occurs under IMP DEF circumstances. Incompatible with in_domain -->
      Otherwise it is <span class="arm-defined-word">IMPLEMENTATION DEFINED</span> when this field resets to
    </xsl:when>
    <xsl:otherwise> <!-- Reset is not IMP DEF. -->
      <xsl:if test="@reset_type or ancestor::register/reg_reset_value/@type != ''">
        <xsl:variable name="reset-type">
          <xsl:choose>
            <xsl:when test="@reset_type and @reset_type != ''">
              <xsl:value-of select="@reset_type"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="ancestor::register/reg_reset_value/@type"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>

        <xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
        <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
        <xsl:variable name="type-test" select="translate(substring($reset-type,1,1),$uppercase,$lowercase)"/>

        <xsl:choose>
          <xsl:when test="$type-test = 'a' or $type-test = 'e' or $type-test = 'i' or $type-test = 'o' or $type-test = 'u' or $type-test = '1'">
            <xsl:choose>
              <xsl:when test="@in_domain">on an </xsl:when>
              <xsl:otherwise>On an </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:otherwise>
            <xsl:choose>
              <xsl:when test="@in_domain">on a </xsl:when>
              <xsl:otherwise>On a </xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="$reset-type"/><xsl:text> reset, </xsl:text>
      </xsl:if>
      <xsl:if test="@reset_instance">
        <xsl:choose>
          <xsl:when test="@in_domain or @reset_type or ancestor::register/reg_reset_value/@type != ''">
            <xsl:text>in the </xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>In the </xsl:text>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="@reset_instance"/><xsl:text> instance, </xsl:text>
      </xsl:if>
      <xsl:call-template name="reset_using_el"/>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:choose> <!-- Multiple reset values - IMP DEF choice between them. -->
    <xsl:when test="count(child::*) > 1">an <span class="arm-defined-word">IMPLEMENTATION DEFINED</span> choice between:
      <ul>
        <xsl:for-each select="./*">
          <li>
            <xsl:apply-templates select=".">
              <xsl:with-param name="initial-caps" select="'True'"/>
            </xsl:apply-templates>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="field_reset_conditions">
          <xsl:text>:</xsl:text>
          <ul>
            <xsl:for-each select="field_reset_conditions/*">
              <li>
                <xsl:choose>
                  <xsl:when test="name() = 'field_reset_condition'">
                    <xsl:text>If </xsl:text><xsl:value-of select="@condition"/><xsl:text>, </xsl:text>
                  </xsl:when>
                  <xsl:otherwise> <!-- not compatible with @in_domain -->
                    <xsl:text>Otherwise, </xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:apply-templates select=".">
                  <xsl:with-param name="initial-caps" select="'False'"/>
                </xsl:apply-templates>
              </li>
            </xsl:for-each>
          </ul>
        </xsl:when>
        <xsl:when test="not(field_reset_standard_text) or field_reset_standard_text != 'UC'">
          <xsl:text> </xsl:text>
          <xsl:apply-templates select="./*"/>
        </xsl:when>
        <xsl:otherwise>.</xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<xsl:template name="reset_using_el"> <!-- context: field_reset -->
  <xsl:choose>
    <xsl:when test="count(../../../../../reg_reset_value/reg_reset_limited_to_el) > 0">
      <xsl:choose>
        <xsl:when test="@in_domain or @reset_type or ancestor::register/reg_reset_value/@type != ''">
          <xsl:text>in a system where the PE resets into </xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>In a system where the PE resets into </xsl:text>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:for-each select="../../../../../reg_reset_value/reg_reset_limited_to_el">
        <xsl:if test="preceding-sibling::reg_reset_limited_to_el"> or </xsl:if>
        <xsl:value-of select="./text()"/>
      </xsl:for-each>
      <xsl:choose>
        <xsl:when test="field_reset_standard_text/text() = 'UC'">
          <xsl:text>, the value of this field is unchanged</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>, this field resets to</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="@in_domain or @reset_type or ancestor::register/reg_reset_value/@type != '' or parent::field_reset_condition">
          <xsl:choose>
            <xsl:when test="field_reset_standard_text/text() = 'UC'">
              <xsl:text>the value of this field is unchanged</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>this field resets to</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:choose>
            <xsl:when test="field_reset_standard_text/text() = 'UC'">
              <xsl:text>On a reset, the value of this field is unchanged</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>This field resets to</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<!-- Reset values that are just numbers are rendered with the same classes we use for <binarynumber>. -->
<xsl:template match="field_reset_number">
  <span class="binarynumber"><xsl:value-of select="."/></span>.
</xsl:template>

<!-- Reset values that are a field in another register are rendered with a link to the register. -->
<xsl:template match="field_reset_other_field">
  <xsl:param name="initial-caps" select="'False'"/> <!-- Only want initial caps when we have 2+ reset values for a field. -->
  <!-- Register name is in upper-case, but file name is lower-case. -->
  <xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
  <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
  <xsl:choose>
    <xsl:when test="$initial-caps = 'True'"><xsl:text>The value in </xsl:text></xsl:when>
    <xsl:otherwise><xsl:text>the value in </xsl:text></xsl:otherwise>
  </xsl:choose>
  <xsl:choose>
    <xsl:when test="./field_reset_other_field_regname/@state != ''">
      <a>
        <xsl:attribute name="href"><xsl:value-of select="./field_reset_other_field_regname/@state"/>-<xsl:value-of select="translate(translate(./field_reset_other_field_regname,'&lt;&gt;',''), $uppercase, $lowercase)"/>.xml</xsl:attribute>
        <xsl:value-of select="./field_reset_other_field_regname"/>
      </a>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="./field_reset_other_field_regname"/>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:text>.</xsl:text>
  <xsl:value-of select="./field_reset_other_field_fieldname"/>
  <xsl:text>.</xsl:text>
</xsl:template>

<!-- Reset values that use standard text have Arm-defined terms rendered with the same classes we use for <arm-defined-word>. -->
<xsl:template match="field_reset_standard_text">
  <xsl:param name="initial-caps" select="'False'"/> <!-- Only want initial caps when we have 2+ reset values for a field. -->
  <xsl:choose>
    <xsl:when test="./text() = 'AU'">
      <!-- architecturally UNKNOWN -->
      <xsl:choose>
        <xsl:when test="$initial-caps = 'True'"><xsl:text>An architecturally </xsl:text></xsl:when>
        <xsl:otherwise><xsl:text>an architecturally </xsl:text></xsl:otherwise>
      </xsl:choose>
      <span class="arm-defined-word">UNKNOWN</span><xsl:text> value.</xsl:text>
    </xsl:when>
    <xsl:when test="./text() = 'U'">
      <!-- UNKNOWN -->
      <xsl:choose>
        <xsl:when test="$initial-caps = 'True'"><xsl:text>An </xsl:text></xsl:when>
        <xsl:otherwise><xsl:text>an </xsl:text></xsl:otherwise>
      </xsl:choose>
      <span class="arm-defined-word">UNKNOWN</span><xsl:text> value.</xsl:text>
    </xsl:when>
    <xsl:when test="./text() = 'UC'">
      <!-- unchanged -->
      <xsl:choose>
        <xsl:when test="$initial-caps = 'True'"><xsl:text>An unchanged value.</xsl:text></xsl:when>
        <xsl:otherwise><xsl:text>an unchanged value.</xsl:text></xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:when test="./text() = 'ID'">
      <!-- IMPLEMENTATION DEFINED -->
      <xsl:choose>
        <xsl:when test="$initial-caps = 'True'"><xsl:text>An </xsl:text></xsl:when>
        <xsl:otherwise><xsl:text>an </xsl:text></xsl:otherwise>
      </xsl:choose>
      <span class="arm-defined-word">IMPLEMENTATION DEFINED</span><xsl:text> value.</xsl:text>
    </xsl:when>
    <xsl:when test="./text() = 'C'">
      <!-- Configurable -->
      <xsl:choose>
        <xsl:when test="$initial-caps = 'True'"><xsl:text>A value determined by an input configuration signal.</xsl:text></xsl:when>
        <xsl:otherwise><xsl:text>a value determined by an input configuration signal.</xsl:text></xsl:otherwise>
      </xsl:choose>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="field_values">
  <xsl:if test="./field_value_instance">
    <table class="valuetable">
      <tr>
        <th>
          <xsl:choose>
            <xsl:when test="./field_value_name">
              <xsl:value-of select="./field_value_name"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="../field_name"/>
            </xsl:otherwise>
          </xsl:choose>
        </th>
        <th>Meaning</th>
        <xsl:if test="./field_value_instance/field_value_links_to">
          <th><xsl:value-of select="./field_value_instance[1]/field_value_links_to[1]/@linked_field_name"/></th>
        </xsl:if>
        <xsl:if test="./field_value_instance/field_value_condition">
          <th>Applies when</th>
        </xsl:if>
      </tr>
      <xsl:for-each select="field_value_instance">
        <tr>
          <td class="bitfield"><xsl:value-of select="field_value"/></td>
          <td>
            <xsl:for-each select="field_value_description">
              <xsl:apply-templates select="."/>
            </xsl:for-each>
          </td>
          <xsl:if test="./field_value_links_to">
          <td>
            <a>
              <!-- Link target to a partial_fieldset instance -->
              <xsl:attribute name="href">
                #<xsl:value-of select="./field_value_links_to[1]/@linked_field_name"/>_<xsl:value-of select="translate(./field_value_links_to[1]/@linked_field_condition,'[]= ','')"/>
              </xsl:attribute>
              <!-- Link text -->
              <xsl:value-of select="./field_value_links_to[1]/@linked_field_name"/>
              <xsl:text> encoding for </xsl:text>
              <xsl:value-of select="./field_value_links_to[1]/@linked_field_condition"/>
            </a>
          </td>
          </xsl:if>
          <xsl:if test="./field_value_condition">
            <td><xsl:value-of select="field_value_condition"/></td>
          </xsl:if>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:if>
</xsl:template>

<xsl:template match="field_value_description">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="field_access">
  <xsl:choose>
    <xsl:when test="count(field_access_state) > 1">
      <p>Accessing this field has the following behavior:</p>
      <ul>
        <xsl:for-each select="field_access_state">
          <li>
            <xsl:choose>
              <xsl:when test="field_access_level">
                <xsl:value-of select="field_access_level"/>,
              </xsl:when>
              <xsl:otherwise>Otherwise, </xsl:otherwise>
            </xsl:choose> access to this field <xsl:apply-templates select="field_access_type"/>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:when>
    <xsl:otherwise><p>Access to this field <xsl:apply-templates select="field_access_state/field_access_type"/></p></xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="field_access_type">
  <xsl:choose>
    <xsl:when test="text() = 'ERROR'">returns an Error.</xsl:when>
    <xsl:otherwise>is <span class="access_level"><xsl:value-of select="."/></span>.</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="partial_fieldset">
  <div class="partial_fieldset">
    <h3>
      <xsl:attribute name="id">
        <!-- Provide a link target for a field_value_instance -->
        <xsl:value-of select="../field_name"/>_<xsl:value-of select="translate(fields[1]/fields_instance/text(),'[]= ','')"/>
      </xsl:attribute>
      <!-- Print the partial fieldset name -->
      <xsl:value-of select="../field_name"/>
      <xsl:text> encoding for </xsl:text>
      <xsl:value-of select="fields[1]/fields_instance"/>
    </h3>
    <ul>
      <xsl:for-each select="linked_value">
        <li><xsl:value-of select="./@value"/>, <xsl:value-of select="."/>.</li>
      </xsl:for-each>
    </ul>
    <xsl:apply-templates select="reg_fieldset">
      <xsl:with-param name="apply_condition" select="0"/>
    </xsl:apply-templates>
  </div>
</xsl:template>

<xsl:template match="text_before_fields">
  <div class="text_before_fields">
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="text_after_fields">
  <div class="text_after_fields">
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="access_mechanisms">
  <div class="access_mechanisms">
    <xsl:choose>
      <xsl:when test="../@is_register = 'False'">
        <h2>Executing the <xsl:value-of select="../reg_short_name"/> instruction</h2>
      </xsl:when>
      <xsl:otherwise>
        <h2>Accessing the <xsl:value-of select="../reg_short_name"/></h2>
      </xsl:otherwise>
    </xsl:choose>
  <xsl:apply-templates select="access_mechanism_text"/>
  <xsl:apply-templates select="access_permission_text"/>
  <xsl:if test="count(access_mechanism) > 0">
    <xsl:choose>
      <xsl:when test="../@is_register = 'False'">
        <p>Accesses to this instruction use the following encodings:</p>
      </xsl:when>
      <xsl:otherwise>
        <p>Accesses to this register use the following encodings:</p>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:for-each select="access_mechanism">
      <h4 class="assembler"><xsl:value-of select="encoding/access_instruction"/></h4>
      <table class="access_instructions">
        <tr>
          <xsl:for-each select="encoding/enc">
            <th><xsl:value-of select="@n"/></th>
          </xsl:for-each>
        </tr>
        <tr>
          <xsl:for-each select="encoding/enc">
            <td><xsl:value-of select="@v"/></td>
          </xsl:for-each>
        </tr>
      </table>
      <xsl:apply-templates select="access_permission/ps/pstext"/>
    </xsl:for-each>
  </xsl:if>
  </div>
</xsl:template>

<xsl:template match="pstext">
  <xsl:if test="not(../@secttype)">
    <h4 class="pseudocode">
      <xsl:value-of select="@section"/> pseudocode
    </h4>
  </xsl:if>
  <xsl:choose>
    <xsl:when test="@mayhavelinks">
      <p class="pseudocode">
        <xsl:apply-templates/>
      </p>
    </xsl:when>
    <xsl:otherwise>
      <p class="pseudocode">
        <xsl:value-of select="."/>
      </p>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="pstext/anchor">
  <a name="{@link}"><xsl:value-of select="."/></a>
</xsl:template>

<xsl:template match="a">
  <xsl:choose>
    <xsl:when test="@class = 'iclass'">
      <a href="encodingindex.xml#{../../@id}"><xsl:value-of select="."/></a>
    </xsl:when>
    <xsl:when test="@link">
      <a href="{@file}#{@link}" title="{@hover}"><xsl:value-of select="."/></a>
    </xsl:when>
    <xsl:otherwise>
      <a href="{@href}"><xsl:value-of select="."/></a>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="access_instructions_operand_table_headers">
  <!-- Given a <defvar> node for an operand, render the header to be
       used in the Access Mechanisms or Accessibility table. -->
  <xsl:param name="defvar_node"/>
  <xsl:param name="rowspan" select="1"/>
  <xsl:variable name="EXECSTATE" select="/register_page/registers/register/@execution_state"/>
  <xsl:variable name="ID" select="$defvar_node/../access_instruction[1]/@id"/>
  <xsl:for-each select="document('instructions.xml')/access_instruction_defs/access_instruction_def[@execution_state = $EXECSTATE and @id = $ID]/access_syntax[not(@variant)]/var">
    <xsl:variable name="INSTR_ASMFIELD" select="@n"/>
    <!-- Only require operands where the value is described in the XML,
         (e.g. <systemreg> = "SCTLR_EL1"), or cases where multiple
         operands are combined to define the syntax for this register
         (e.g. AArch32 MCR/MCRR/MRC/MRRC instructions.) -->
    <xsl:if test="$defvar_node/def[@asmname = $INSTR_ASMFIELD]/@asmvalue or count(var) &gt; 0">
      <th>
        <xsl:attribute name="rowspan">
          <xsl:value-of select="$rowspan"/>
        </xsl:attribute>
        &lt;<xsl:value-of select="@n"/>&gt;
      </th>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<xsl:template name="access_instructions_operand_table_value">
  <!-- Given a <defvar> node for an operand, render the cell to be
       used in the Access Mechanisms or Accessibility table. -->
  <xsl:param name="defvar_node"/>
  <xsl:variable name="EXECSTATE" select="/register_page/registers/register/@execution_state"/>
  <xsl:variable name="ID" select="$defvar_node/../access_instruction[1]/@id"/>
  <xsl:for-each select="document('instructions.xml')/access_instruction_defs/access_instruction_def[@execution_state = $EXECSTATE and @id = $ID]/access_syntax[not(@variant)]/var">
    <xsl:variable name="INSTR_ASMFIELD" select="@n"/>
    <!-- Only require operands where the value is described in the XML,
         (e.g. <systemreg> = "SCTLR_EL1"), or cases where multiple
         operands are combined to define the syntax for this register
         (e.g. AArch32 MCR/MCRR/MRC/MRRC instructions.) -->
    <xsl:choose>
      <xsl:when test="$defvar_node/def[@asmname = $INSTR_ASMFIELD]/@asmvalue">
        <!-- This is a single operand with the value described in the XML.
             e.g. <spec_reg> = "SCTLR_EL1". -->
        <td><xsl:value-of select="$defvar_node/def[@asmname = $INSTR_ASMFIELD]/@asmvalue"/></td>
      </xsl:when>
      <xsl:when test="count(var) &gt; 0">
        <!-- Multiple operands need to be combined for the syntax.
             e.g. <syntax> = "p15,#0,c1,c2,#3". -->
        <td>
          <xsl:for-each select="var">
            <xsl:variable name="ASMFIELD" select="@n"/>
            <xsl:variable name="COMMA">
              <xsl:if test="position() &lt; last()">
                <xsl:text>, </xsl:text>
              </xsl:if>
            </xsl:variable>
            <xsl:choose>
              <xsl:when test="$defvar_node/def[@asmname = $ASMFIELD] and $defvar_node/def[@asmname = $ASMFIELD]/@asmvalue">
                <!-- The value for this field has been specified in the
                     XML, so print it. -->
                <xsl:value-of select="$defvar_node/def[@asmname = $ASMFIELD]/@asmvalue"/><xsl:value-of select="$COMMA"/>
              </xsl:when>
              <xsl:otherwise>
                <!-- The value for this field is not specified, so print
                     the operand as part of the syntax. -->
                &lt;<xsl:value-of select="$ASMFIELD"/>&gt;<xsl:value-of select="$COMMA"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </td>
      </xsl:when>
    </xsl:choose>
  </xsl:for-each>
</xsl:template>

<xsl:template name="access_instructions_operand_table_value_is_single_operand">
  <!-- Given a <defvar> node for an operand, check to see if this is a single operand
       with the value described in the XML. Returns an empty string if multiple
       operands are found. -->
  <xsl:param name="defvar_node"/>
  <xsl:param name="rowspan" select="1"/>
  <xsl:variable name="EXECSTATE" select="/register_page/registers/register/@execution_state"/>
  <xsl:variable name="ID" select="$defvar_node/../access_instruction[1]/@id"/>
  <xsl:for-each select="document('instructions.xml')/access_instruction_defs/access_instruction_def[@execution_state = $EXECSTATE and @id = $ID]/access_syntax[not(@variant)]/var">
    <xsl:variable name="INSTR_ASMFIELD" select="@n"/>
    <xsl:if test="$defvar_node/def[@asmname = $INSTR_ASMFIELD]">
      'True'
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<xsl:template name="get_encoding_prefix">
  <xsl:param name="defvar_node"/>
  <xsl:param name="encname"/>
  <xsl:variable name="EXECSTATE" select="/register_page/registers/register/@execution_state"/>
  <xsl:variable name="ID" select="$defvar_node/../access_instruction[1]/@id"/>
  <xsl:variable name="var" select="document('instructions.xml')/access_instruction_defs/access_instruction_def[@execution_state = $EXECSTATE and @id = $ID]/access_syntax[not(@variant)]/var/var[@n = $encname]"/>
  <xsl:if test="$var[1]/@prefix">
    <xsl:value-of select="$var[1]/@prefix"/>
  </xsl:if>
</xsl:template>

<xsl:template name="access_instructions_operand_table_encoding">
  <!-- The <enc> element holds the information about
       an encoding. -->
  <xsl:param name="enc"/>
  <xsl:choose>
    <xsl:when test="$enc/@varname or $enc/encbits">
      <!-- The value for this encoding contains constraints. -->
      <xsl:if test="$enc/@varname and $enc/@width">
        <!-- A simple slice over a variable, starting at bit 0. -->
        <xsl:value-of select="$enc/@varname"/>&lt;<xsl:value-of select="$enc/@width - 1"/>:0&gt;
      </xsl:if>
      <xsl:if test="$enc/encbits">
        <!-- The encbits tags contain information about parts of an encoding. These are
             assembled by concatenating each part with a ":". -->
        <xsl:for-each select="$enc/encbits">
          <xsl:if test="@v">
            <!-- The part is a plain bitstring -->
            <xsl:value-of select="@v"/>
          </xsl:if>
          <xsl:if test="encvar">
            <!-- The part is a slice over a variable. The encvar tag is used for this.
                 Only one such tag is expected. -->
            <xsl:value-of select="encvar/@name"/>&lt;<xsl:value-of select="encvar/@msb"/><xsl:if test="encvar/@msb != encvar/@lsb">:<xsl:value-of select="encvar/@lsb"/></xsl:if>&gt;
          </xsl:if>
          <xsl:if test="position() != last()">
             <xsl:text>:</xsl:text>
          </xsl:if>
        </xsl:for-each>
      </xsl:if>
    </xsl:when>
    <xsl:otherwise>
      <!-- The value for this encoding is a plain bitstring. -->
      <xsl:value-of select="$enc/@v"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="access_instructions">
  <!-- The <access_instructions> element holds the information about
       how the register/instruction is encoded. -->
  <div class="access_instructions">
    <xsl:variable name="EXECSTATE" select="/register_page/registers/register/@execution_state"/>
    <xsl:variable name="ID" select="access_instruction[1]/@id"/>
    <!-- Instrution syntax -->
    <xsl:apply-templates select="access_instruction"/>
    <!-- Instruction encoding -->
    <p>This syntax uses the following encoding in the System instruction encoding space:</p>
    <table class="access_instructions">
      <tr>
        <!-- Render the headers... -->
        <!-- First the Assembler operands -->
        <xsl:call-template name="access_instructions_operand_table_headers">
          <xsl:with-param name="defvar_node" select="defvar[1]"/>
        </xsl:call-template>
        <!-- Then the encoding fields -->
        <xsl:for-each select="defvar[1]/def/enc">
          <th><xsl:value-of select="@n"/></th>
        </xsl:for-each>
      </tr>
      <xsl:for-each select="defvar">
        <!-- Each row describes a new instruction -->
        <tr>
          <!-- First the Assembler operands -->
          <xsl:call-template name="access_instructions_operand_table_value">
            <xsl:with-param name="defvar_node" select="."/>
          </xsl:call-template>
          <!-- Then the encoding fields -->
          <xsl:for-each select="./def/enc">
            <td>
              <xsl:call-template name="access_instructions_operand_table_encoding">
                <xsl:with-param name="enc" select="."/>
              </xsl:call-template>
            </td>
          </xsl:for-each>
        </tr>
      </xsl:for-each>
    </table>
    <xsl:variable name="is_single_operand">
      <xsl:call-template name="access_instructions_operand_table_value_is_single_operand">
        <xsl:with-param name="defvar_node" select="defvar[1]"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:if test="$is_single_operand = ''">
      <xsl:call-template name="access_instructions_operand_encoding_explanations">
        <xsl:with-param name="defvar" select="defvar"/>
      </xsl:call-template>
    </xsl:if>
  </div>
</xsl:template>


<xsl:template name="access_instructions_operand_encoding_explanations">
  <!-- Produces a bulleted list of encodings and their limiting values. -->
  <xsl:param name="defvar"/>
  <ul>
  <!-- Loop over register variables, and if they match something found in an encoding,
       do something. -->
  <xsl:for-each select="/register_page/registers/register/reg_variables/reg_variable">
    <!-- Pull relevant information from the current register variable definition and
         put it into handy variables. -->
    <xsl:variable name="var_name" select="./@variable"/>
    <xsl:variable name="var_max" select="./@max"/>
    <xsl:variable name="var_min">
      <xsl:choose>
        <xsl:when test="./@min">
          <xsl:value-of select="./@min"/>
        </xsl:when>
        <xsl:otherwise>
          0
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="var_vals" select="./reg_variable_val"/>
    <xsl:for-each select="$defvar[1]/def/enc">
      <xsl:if test="@varname or encbits">
        <xsl:variable name="ENCNAME" select="@n"/>
        <xsl:variable name="ENCPREFIX">
          <xsl:call-template name="get_encoding_prefix">
            <xsl:with-param name="defvar_node" select="$defvar[1]"/>
            <xsl:with-param name="encname" select="$ENCNAME"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="@varname">
            <!-- Width and variable name are specified in the 'enc' tag. This means
                 that we have an encoding comprising of a variable slice only, with
                 an lsb of 0. -->
            <xsl:if test="$var_name=@varname">
              <xsl:if test="@width">
                <!-- Output the values that the encoding can take, given the slice on the
                     variable and the variable's limiting values. -->
                <xsl:call-template name="output_max_min_or_vals">
                  <xsl:with-param name="var_max" select="$var_max"/>
                  <xsl:with-param name="var_min" select="$var_min"/>
                  <xsl:with-param name="var_vals" select="$var_vals"/>
                  <xsl:with-param name="slice_msb" select="@width - 1"/>
                  <xsl:with-param name="slice_lsb" select="0"/>
                  <xsl:with-param name="encname" select="$ENCNAME"/>
                  <xsl:with-param name="encprefix" select="$ENCPREFIX"/>
                  <xsl:with-param name="variable_offset" select="0"/>
                </xsl:call-template>
              </xsl:if>
            </xsl:if>
          </xsl:when>
          <xsl:otherwise>
            <!-- The 'enc' tag contains substructure, specifically, 'encvar' and 'encbits' tags.
                 This means that we either have an encoding containing a variable slice that
                 does not start at 0, or there are additional bit value specifiers. -->
            <!-- First, check if there are any bit value parts of the encoding (e.g. '110:'),
                 and if so, work out a corresponding offset. -->
            <xsl:variable name="variable_offset">
              <xsl:call-template name="build_variable_offset">
                <xsl:with-param name="encbits" select="encbits"/>
              </xsl:call-template>
            </xsl:variable>
            <!-- Then find the maximum and minimum values for the encoding, given the size
                 and position of the variable slice, and the range of the variable. -->
            <xsl:for-each select="encbits">
              <xsl:if test="$var_name=encvar/@name">
                <!-- Output the values that the encoding can take, given the slice on the
                     variable and the variable's limiting values. -->
                <xsl:call-template name="output_max_min_or_vals">
                  <xsl:with-param name="var_max" select="$var_max"/>
                  <xsl:with-param name="var_min" select="$var_min"/>
                  <xsl:with-param name="var_vals" select="$var_vals"/>
                  <xsl:with-param name="slice_msb" select="encvar/@msb"/>
                  <xsl:with-param name="slice_lsb" select="encvar/@lsb"/>
                  <xsl:with-param name="encname" select="$ENCNAME"/>
                  <xsl:with-param name="encprefix" select="$ENCPREFIX"/>
                  <xsl:with-param name="variable_offset" select="$variable_offset"/>
                </xsl:call-template>
              </xsl:if>
            </xsl:for-each>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
    </xsl:for-each>
  </xsl:for-each>
  </ul>
</xsl:template>

<xsl:template name="output_max_min_or_vals">
  <!-- Output the values that the encoding can take, given the slice on the variable
       and the variable's limiting values. -->
  <xsl:param name="var_max"/>
  <xsl:param name="var_min"/>
  <xsl:param name="var_vals"/>
  <xsl:param name="slice_msb"/>
  <xsl:param name="slice_lsb"/>
  <xsl:param name="encname"/>
  <xsl:param name="encprefix"/>
  <xsl:param name="variable_offset"/>
  <xsl:choose>
    <xsl:when test="$var_max">
      <xsl:call-template name="output_max_min">
        <xsl:with-param name="var_max" select="$var_max"/>
        <xsl:with-param name="var_min" select="$var_min"/>
        <xsl:with-param name="slice_msb" select="$slice_msb"/>
        <xsl:with-param name="slice_lsb" select="$slice_lsb"/>
        <xsl:with-param name="encname" select="$encname"/>
        <xsl:with-param name="encprefix" select="$encprefix"/>
        <xsl:with-param name="variable_offset" select="$variable_offset"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="output_vals">
        <xsl:with-param name="var_vals" select="$var_vals"/>
        <xsl:with-param name="slice_msb" select="$slice_msb"/>
        <xsl:with-param name="slice_lsb" select="$slice_lsb"/>
        <xsl:with-param name="encname" select="$encname"/>
        <xsl:with-param name="encprefix" select="$encprefix"/>
        <xsl:with-param name="variable_offset" select="$variable_offset"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="output_max_min">
  <!-- Output the maximum and minimum values that the encoding can take, given
       the slice on the variable and the variable's limiting values. -->
  <xsl:param name="var_max"/>
  <xsl:param name="var_min"/>
  <xsl:param name="slice_msb"/>
  <xsl:param name="slice_lsb"/>
  <xsl:param name="encname"/>
  <xsl:param name="encprefix"/>
  <xsl:param name="variable_offset"/>
  <xsl:variable name="max">
    <xsl:call-template name="max_from_variable_range">
      <xsl:with-param name="var_max" select="$var_max"/>
      <xsl:with-param name="var_min" select="$var_min"/>
      <xsl:with-param name="slice_msb" select="$slice_msb"/>
      <xsl:with-param name="slice_lsb" select="$slice_lsb"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="min">
    <xsl:call-template name="min_from_variable_range">
      <xsl:with-param name="var_max" select="$var_max"/>
      <xsl:with-param name="var_min" select="$var_min"/>
      <xsl:with-param name="slice_msb" select="$slice_msb"/>
      <xsl:with-param name="slice_lsb" select="$slice_lsb"/>
    </xsl:call-template>
  </xsl:variable>
  <!-- Maximum and minimum values calculated based on the position of the slice in the
       encoding need to be augmented by the offset contributed by any bit value parts. -->
  <li>&lt;<xsl:value-of select="$encname"/>&gt; is in the range <xsl:value-of select="$encprefix"/><xsl:value-of select="$min + $variable_offset"/> - <xsl:value-of select="$encprefix"/><xsl:value-of select="$max + $variable_offset"/>.</li>
</xsl:template>

<xsl:template name="output_vals">
  <!-- Output the individial values that the encoding can take, given
       the slice on the variable and the variable's limiting values. -->
  <xsl:param name="var_vals"/>
  <xsl:param name="slice_msb"/>
  <xsl:param name="slice_lsb"/>
  <xsl:param name="encname"/>
  <xsl:param name="encprefix"/>
  <xsl:param name="variable_offset"/>
  <xsl:param name="vals" select="-1"/>
  <xsl:choose>
    <xsl:when test="$var_vals and count($var_vals) != 0">
      <xsl:variable name="slice_msb_plus_1_pwr2">
         <xsl:call-template name="pwr2">
          <xsl:with-param name="exponent" select="$slice_msb + 1"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="slice_lsb_pwr2">
         <xsl:call-template name="pwr2">
          <xsl:with-param name="exponent" select="$slice_lsb"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="val" select="$var_vals[1]"/>
      <xsl:variable name="new_vals">
        <xsl:choose>
          <xsl:when test="$val &lt; $slice_msb_plus_1_pwr2 and $val &gt;= $slice_lsb_pwr2">
            <!-- The variable's value lies within the slice, so shift it right by lsb
                 bits and add the offset, then append it to the list. -->
            <xsl:choose>
              <xsl:when test="$vals = '-1'">
                <xsl:value-of select="concat($encprefix, floor($val div $slice_lsb_pwr2) + $variable_offset)"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="concat($vals, ', ', $encprefix, floor($val div $slice_lsb_pwr2) + $variable_offset)"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:otherwise>
            <!-- The variable's value is outside the slice, so ignore it. -->
            <xsl:value-of select="$vals"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:call-template name="output_vals">
        <xsl:with-param name="var_vals" select="$var_vals[position() &gt; 1]"/>
        <xsl:with-param name="slice_msb" select="$slice_msb"/>
        <xsl:with-param name="slice_lsb" select="$slice_lsb"/>
        <xsl:with-param name="encname" select="$encname"/>
        <xsl:with-param name="encprefix" select="$encprefix"/>
        <xsl:with-param name="variable_offset" select="$variable_offset"/>
        <xsl:with-param name="vals" select="$new_vals"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="$vals = '-1'">
          <li>&lt;<xsl:value-of select="$encname"/>&gt; has no valid values.</li>
        </xsl:when>
        <xsl:otherwise>
          <li>&lt;<xsl:value-of select="$encname"/>&gt; can take the values: <xsl:value-of select="$vals"/>.</li>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="build_variable_offset">
  <!-- Recurse over the given encbits nodes, and from the ones that contain
       binary values, work out the total constant part of the number as
       an integer. E.g. if the encbits contain '11', n<4:3> and '10',
       then the constant part of the entire ensemble is 3 * 16 + 1 * 2 =50.
       In this example, the lsb of the '11' part is 4, hence the multiplier
       of 16. -->
  <xsl:param name="encbits"/>
  <xsl:param name="offset" select="0"/>
  <xsl:choose>
    <xsl:when test="$encbits and count($encbits) != 0">
      <xsl:variable name="lsb_pwr2">
        <xsl:call-template name="pwr2">
          <xsl:with-param name="exponent" select="$encbits[1]/@lsb"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="v_int">
        <xsl:choose>
          <xsl:when test="$encbits[1]/@v">
            <xsl:call-template name="bin_to_int">
              <xsl:with-param name="bin" select="$encbits[1]/@v"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            0
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="new_offset" select="$offset + $lsb_pwr2*$v_int"/>
      <xsl:call-template name="build_variable_offset">
        <xsl:with-param name="encbits" select="$encbits[position() &gt; 1]"/>
        <xsl:with-param name="offset" select="$new_offset"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$offset"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="max_from_variable_range">
  <!--  Given a variable with a known range of values (var_max and var min),
        which is sliced at known bit positions (slice_msb and slice lsb),
        work out the maximum value for the slice.

        We can distinguish between three cases:

        1. var_min is greater than or equal to 2^slice_msb. This is an error
           condition, since the variable never takes values within this slice.
        2. var_max is less than 2^slice_lsb. This is an error
           condition, since the variable never takes values within this slice.
        3. Otherwise:

           Calculate a 'slice_max'. This is basically the maximum value that we
           can represent with the slice given its width, offset by the minimum
           value of the variable. A special case arises if the minimum value of the
           variable lies within the slice. Here is the algorithm:

           width = msb - lsb + 1
           if var_min < 2^lsb:
             slice_max = (2^width - 1)*2^lsb + var_min
           else:
             slice_max = (2^(msb+1) - 1)

           Now calculate a maximum value within the slice. If the variable maximum is
           greater than the slice maximum, it is simply the biggest number that
           can be represented in the width of the slice. Otherwise, we have to
           right-shift the variable maximum by lsb times to get what we want. Here
           is the algorithm:

           if slice_max <= var_max:
             max = (2^width - 1)
           else:
             max = floor(var_max/2^lsb).
        -->
  <xsl:param name="var_max"/>
  <xsl:param name="var_min"/>
  <xsl:param name="slice_msb"/>
  <xsl:param name="slice_lsb"/>
  <xsl:variable name="slice_msb_pwr2">
     <xsl:call-template name="pwr2">
      <xsl:with-param name="exponent" select="$slice_msb"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="slice_lsb_pwr2">
     <xsl:call-template name="pwr2">
      <xsl:with-param name="exponent" select="$slice_lsb"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:choose>
    <xsl:when test="$var_min &gt;= $slice_msb_pwr2">
      <xsl:message terminate="yes">
        Error: slice (&lt;<xsl:value-of select="$slice_msb"/>:<xsl:value-of select="$slice_lsb"/>&gt;) is taken within a range that is below the variable's minimum value (<xsl:value-of select="$var_min"/>)!
      </xsl:message>
    </xsl:when>
    <xsl:when test="$var_max &lt; $slice_lsb_pwr2">
      <xsl:message terminate="yes">
        Error: slice (&lt;<xsl:value-of select="$slice_msb"/>:<xsl:value-of select="$slice_lsb"/>&gt;) is taken within a range that is above the variable's maximum value (<xsl:value-of select="$var_max"/>)!
      </xsl:message>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="width" select="$slice_msb - $slice_lsb + 1"/>
      <xsl:variable name="width_pwr2">
         <xsl:call-template name="pwr2">
          <xsl:with-param name="exponent" select="$width"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:choose>
        <xsl:when test="$var_min &lt; $slice_lsb_pwr2">
          <!-- Variable maximum is bigger than the slice maximum -->
          <xsl:variable name="slice_max" select="(($width_pwr2 - 1) * $slice_lsb_pwr2) + $var_min"/>
          <xsl:call-template name="max_from_var_max">
            <xsl:with-param name="var_max" select="$var_max"/>
            <xsl:with-param name="slice_max" select="$slice_max"/>
            <xsl:with-param name="width_pwr2" select="$width_pwr2"/>
            <xsl:with-param name="slice_lsb_pwr2" select="$slice_lsb_pwr2"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <!-- Variable maximum is smaller than the slice maximum -->
          <xsl:variable name="slice_max" select="($slice_msb_pwr2 * 2) - 1"/>
          <xsl:call-template name="max_from_var_max">
            <xsl:with-param name="var_max" select="$var_max"/>
            <xsl:with-param name="slice_max" select="$slice_max"/>
            <xsl:with-param name="width_pwr2" select="$width_pwr2"/>
            <xsl:with-param name="slice_lsb_pwr2" select="$slice_lsb_pwr2"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="max_from_var_max">
  <!-- Implement the second part of the above algorithm to avoid code duplication,
       viz.:

           if slice_max <= var_max:
             max = (2^width - 1)
           else:
             max = floor(var_max/2^lsb).
        -->
  <xsl:param name="var_max"/>
  <xsl:param name="slice_max"/>
  <xsl:param name="width_pwr2"/>
  <xsl:param name="slice_lsb_pwr2"/>
  <xsl:choose>
    <xsl:when test="$slice_max &lt;= $var_max">
      <xsl:value-of select="$width_pwr2 - 1"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="floor($var_max div $slice_lsb_pwr2)"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="min_from_variable_range">
  <!--  Given a variable with a known range of values (var_max and var min),
        which is sliced at known bit positions (slice_msb and slice lsb),
        work out the maximum value for the slice.

        We can distinguish between three cases:

        1. var_min is greater than or equal to 2^slice_msb. This is an error
           condition, since the variable never takes values within this slice.
        2. var_max is less than 2^slice_lsb. This is an error
           condition, since the variable never takes values within this slice.
        3. Otherwise:

           Calculate a 'slice_min'. This is basically the minimum value that we
           can represent with the slice. Here is the algorithm:

           slice_min = (2^lsb - 1)

           Now calculate a minimum value within the slice. If the slice minimum is
           greater than the variable minimum, it is simply zero. Otherwise, we have to
           right-shift the variable minimum by lsb times to get what we want. Here
           is the algorithm:

           if slice_min > var_min:
             min = 0
           else:
             min = floor(var_min/2^lsb).
        -->
  <xsl:param name="var_max"/>
  <xsl:param name="var_min"/>
  <xsl:param name="slice_msb"/>
  <xsl:param name="slice_lsb"/>
  <xsl:variable name="slice_msb_pwr2">
     <xsl:call-template name="pwr2">
      <xsl:with-param name="exponent" select="$slice_msb"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="slice_lsb_pwr2">
     <xsl:call-template name="pwr2">
      <xsl:with-param name="exponent" select="$slice_lsb"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:choose>
    <xsl:when test="$var_min &gt;= $slice_msb_pwr2">
      <xsl:message terminate="yes">
        Error: slice (&lt;<xsl:value-of select="$slice_msb"/>:<xsl:value-of select="$slice_lsb"/>&gt;) is taken within a range that is below the variable's minimum value (<xsl:value-of select="$var_min"/>)!
      </xsl:message>
    </xsl:when>
    <xsl:when test="$var_max &lt; $slice_lsb_pwr2">
      <xsl:message terminate="yes">
        Error: slice (&lt;<xsl:value-of select="$slice_msb"/>:<xsl:value-of select="$slice_lsb"/>&gt;) is taken within a range that is above the variable's maximum value (<xsl:value-of select="$var_max"/>)!
      </xsl:message>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="slice_min" select="$slice_lsb_pwr2 - 1"/>
      <xsl:choose>
        <xsl:when test="$slice_min &gt; $var_min">
          0
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="floor($var_min div $slice_lsb_pwr2)"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="bin_to_int">
  <!-- Convert a binaray number to an integer, e.g. '10' to '2'. -->
  <xsl:param name="bin"/>
  <xsl:param name="int" select="0"/>
  <xsl:choose>
    <xsl:when test="$bin=''">
      <xsl:value-of select="$int"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="bin_to_int">
        <xsl:with-param name="bin" select="substring($bin,2)"/>
        <xsl:with-param name="int" select="2*$int + number(substring($bin,1,1))"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="pwr2">
  <!-- Raise 2 to the power of the supplied exponent. -->
  <xsl:param name="exponent"/>
  <xsl:param name="value" select="1"/>
  <xsl:choose>
    <xsl:when test="$exponent=0">
      <xsl:value-of select="$value"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="pwr2">
        <xsl:with-param name="exponent" select="$exponent - 1"/>
        <xsl:with-param name="value" select="2*$value"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="access_instruction">
  <!-- The <access_instruction> element holds the information about
       the assembler syntax. -->
  <xsl:variable name="EXECSTATE" select="/register_page/registers/register/@execution_state"/>
  <xsl:variable name="ID" select="@id"/>
  <div class="access_instruction">
    <!-- Look in instructions.xml to find the instruction for this
         <access_instruction> element, so that we can render the
         assembler syntax. The <register> element is passed in so that
         the information for this register/instruction is filled in. -->
    <xsl:apply-templates select="document('instructions.xml')/access_instruction_defs/access_instruction_def[@execution_state = $EXECSTATE and @id = $ID]">
      <xsl:with-param name="register" select="/register_page/registers/register"/>
    </xsl:apply-templates>
  </div>
</xsl:template>

<xsl:template match="access_instruction_def">
  <!-- The <access_instruction_def> element holds the information
       about the assembler syntax for this instruction. The template is
       called with the <register> element so that we can customize the
       text properly for the register vs. instruction split.

       First render the introduction, then the syntax line. -->
  <xsl:param name="register"/>
  <xsl:variable name="IS_INSTRUCTION" select="$register/@is_register = 'False'"/>
  <xsl:variable name="INSTRUCTION" select="name"/>
  <xsl:choose>
    <xsl:when test="$IS_INSTRUCTION">
      <!-- A system instruction -->
      <p>This instruction is executed using <xsl:value-of select="$INSTRUCTION"/> with the following syntax:</p>
    </xsl:when>
    <xsl:otherwise>
      <!-- A system register -->
      <xsl:variable name="READWRITE">
        <xsl:variable name="RW">
          <xsl:value-of select="access_type/@type"/>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="$RW = 'read'">read</xsl:when>
          <xsl:when test="$RW = 'write'">written</xsl:when>
          <xsl:otherwise>modified</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <p>This register can be <xsl:value-of select="$READWRITE"/> using <xsl:value-of select="$INSTRUCTION"/> with the following syntax:</p>
    </xsl:otherwise>
  </xsl:choose>
  <p class="asm-code">
    <xsl:choose>
      <xsl:when test="$IS_INSTRUCTION
                      and count($register/reg_fieldsets/*) = 0
                      and count(access_syntax[@variant = 'no_input']) &gt; 0">
        <xsl:apply-templates select="access_syntax[@variant = 'no_input']"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="access_syntax[not(@variant)]"/>
      </xsl:otherwise>
    </xsl:choose>
  </p>
</xsl:template>

<xsl:template match="access_syntax">
  <!-- The <access_syntax> renders the syntax line. -->
  <xsl:value-of select="@name"/>
  <xsl:text>  </xsl:text>
  <xsl:for-each select="var">
    <xsl:variable name="COMMA">
      <xsl:if test="position() &lt; last()">
        <xsl:text>, </xsl:text>
      </xsl:if>
    </xsl:variable>
    <xsl:if test="@prefix">
      <xsl:value-of select="@prefix"/>
    </xsl:if>&lt;<xsl:value-of select="@n"/>&gt;<xsl:value-of select="$COMMA"/>
  </xsl:for-each>
</xsl:template>

<xsl:template match="access_permissions">
  <!-- The <access_permissions> element holds all the information
       about the register/instruction accessibility. -->
  <h3>Accessibility</h3>
  <xsl:if test="count(./access_permission) &gt; 0">
    <!-- If we have data about the accessibility, render the table describing it. -->
    <xsl:variable name="ACCESSIBILITY_ID1" select="./access_permission/access_set[1]/@accessibility_id"/>
    <xsl:choose>
      <xsl:when test="/register_page/registers/register/@is_register = 'False'">
        <p>The instruction is executable as follows:</p>
      </xsl:when>
      <xsl:otherwise>
        <p>The register is accessible as follows:</p>
      </xsl:otherwise>
    </xsl:choose>

    <xsl:for-each select="access_tables/access_table">
      <table class="accessibility">
        <tbody>
          <!-- Table header -->
          <tr>
            <xsl:if test="count(access_row/sysreg[.=../../access_row[1]/sysreg]) != count(access_row/sysreg) or count(access_row/sysreg) != count(access_row) or count(../access_table) &gt; 1">
              <th rowspan="2">&lt;<xsl:value-of select="@asmname"/>&gt;</th>
            </xsl:if>
            <th rowspan="2">Configuration</th>
            <th colspan="4">Accessibility</th>
            <xsl:if test="count(access_row/instance[.=../../access_row[1]/instance]) != count(access_row/instance) or count(access_row/instance) != count(access_row)">
              <th rowspan="2">Instance</th>
            </xsl:if>
          </tr>
          <tr>
            <th>EL0</th>
            <th>EL1</th>
            <th>EL2</th>
            <th>EL3</th>
          </tr>
          <!-- Table body -->
          <xsl:for-each select="access_row">
            <xsl:element name="tr">
              <xsl:if test="(../access_row/sysreg and (count(../access_row/sysreg[.=../../access_row[1]/sysreg]) != count(../access_row/sysreg) or count(../access_row/sysreg) != count(../access_row))) or count(../../access_table) &gt; 1">
                <td><xsl:value-of select="sysreg"/></td>
              </xsl:if>
              <td><xsl:value-of select="accessor_condition"/></td>
              <td><xsl:apply-templates select="els/el0"/></td>
              <td><xsl:apply-templates select="els/el1"/></td>
              <td><xsl:apply-templates select="els/el2"/></td>
              <td><xsl:apply-templates select="els/el3"/></td>
              <xsl:if test="../access_row/instance and (count(../access_row/instance[.=../../access_row[1]/instance]) != count(../access_row/instance) or count(../access_row/instance) != count(../access_row))">
                <xsl:choose>
                  <xsl:when test="instance">
                    <td><xsl:value-of select="instance"/></td>
                  </xsl:when>
                  <xsl:otherwise>
                    <td>-</td>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
            </xsl:element> <!-- tr -->
          </xsl:for-each>
        </tbody>
      </table>
    </xsl:for-each>
  </xsl:if>
  <!-- Any text about the accessibility. -->
  <xsl:apply-templates select="access_permission_text"/>
</xsl:template>


<xsl:template match="traps_and_enables">
  <!-- Render a set of traps and enables -->
  <xsl:apply-templates select="trap_conditions"/>
  <ul>
    <xsl:for-each select="trap">
      <li><xsl:apply-templates select="trap_text/para"/></li>
    </xsl:for-each>
  </ul>
</xsl:template>

<xsl:template match="trap_conditions">
  <p>
    <xsl:choose>
      <xsl:when test="when/condition and when/exception_level_config">
        <!-- These traps and enables apply depending on the
             implementation option for a particular Exception level,
             and other register bits. -->
        When
        <xsl:apply-templates select="when/exception_level_config"/>
        <xsl:apply-templates select="when/condition">
          <xsl:with-param name="register" select="../../.."/>
          <xsl:with-param name="access_controls" select="../../access_permissions/access_controls"/>
          <xsl:with-param name="starting_and" select="1"/>
        </xsl:apply-templates>
        :
      </xsl:when>
      <xsl:when test="when/exception_level_config">
        <!-- These traps and enables only apply depending on the
             implementation option for a particular Exception level. -->
        When
        <xsl:apply-templates select="when/exception_level_config"/>
        :
      </xsl:when>
      <xsl:when test="when/condition">
        <!-- These traps and enables apply depending on other
             other register bits. -->
        When
        <xsl:apply-templates select="when/condition">
          <xsl:with-param name="register" select="../../.."/>
          <xsl:with-param name="access_controls" select="../../access_permissions/access_controls"/>
        </xsl:apply-templates>
        :
      </xsl:when>
      <xsl:otherwise>
        <!-- These traps and enables are not dependent on the config.
             Show different text depending on whether we have one or multiple Security states. -->
        <xsl:choose>
          <xsl:when test="document('architecture_info.xml')/architecture_info/@s_ns_implemented = 'True'">
            In both Security states, and not dependent on other configuration bits:
          </xsl:when>
          <xsl:otherwise>
            Not dependent on other configuration bits:
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </p>
</xsl:template>

<xsl:template match="exception_level_config">
  <xsl:if test="@state != ''">
    <!-- Render the configuration of a particular Exception level. -->
    <xsl:text>EL</xsl:text>
    <xsl:value-of select="@el"/>
    <xsl:choose>
      <xsl:when test="@state = 'unimplemented'">
        <xsl:text> is not implemented</xsl:text>
      </xsl:when>
      <xsl:when test="@state = 'implemented'">
        <xsl:text> is implemented</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text> is implemented and is using </xsl:text>
        <xsl:value-of select="@state"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:if>
  <xsl:if test="@highest_el">
    <xsl:text>EL</xsl:text>
    <xsl:value-of select="@el"/>
    <xsl:text> is highest implemented Exception level</xsl:text>
  </xsl:if>
</xsl:template>

<xsl:template match="condition">
  <!-- Render a register bit condition. -->
  <xsl:param name="register"/>
  <xsl:param name="access_controls"/>
  <xsl:param name="starting_and" select="0"/>
  <xsl:variable name="FIELD_NAME" select="@field"/>
  <xsl:variable name="OP">
    <xsl:choose>
      <xsl:when test="@op">
        <xsl:value-of select="@op"/>
      </xsl:when>
      <xsl:otherwise>
        ==
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <!-- To identify the registers for a control field, either take it
       from the <control> elements that are used in the access
       permissions, or work it out from the name of the field. -->
  <xsl:variable name="CONTROL32">
    <xsl:choose>
      <xsl:when test="$access_controls/control">
        <xsl:value-of select="$access_controls/control[@field=$FIELD_NAME]/@aarch32_register"/>
      </xsl:when>
      <xsl:when test="$FIELD_NAME = 'NS'">
        <xsl:text>SCR</xsl:text>
      </xsl:when>
      <xsl:when test="$FIELD_NAME = 'TGE'">
        <xsl:text>HCR</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="CONTROL64">
    <xsl:choose>
      <xsl:when test="$access_controls/control">
        <xsl:value-of select="$access_controls/control[@field=$FIELD_NAME]/@aarch64_register"/>
      </xsl:when>
      <xsl:when test="$FIELD_NAME = 'NS'">
        <xsl:text>SCR_EL3</xsl:text>
      </xsl:when>
      <xsl:when test="$FIELD_NAME = 'TGE' or $FIELD_NAME = 'E2H'">
        <xsl:text>HCR_EL2</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="CONTROL" select="$access_controls/control[@field=$FIELD_NAME]"/>
  <xsl:if test="not($access_controls) or $CONTROL/@aarch64_register or $CONTROL/@aarch32_register">
    <xsl:if test="position() = 1 and $starting_and = 1">
      <xsl:text> and </xsl:text>
    </xsl:if>
    <xsl:if test="position() != 1">
      <xsl:text> &amp;&amp; </xsl:text>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="$register/@execution_state = 'AArch64'">
        <xsl:value-of select="$CONTROL64"/>
        <xsl:text>.</xsl:text>
        <xsl:value-of select="$FIELD_NAME"/>
        <xsl:value-of select="$OP"/>
        <xsl:value-of select="@value"/>
      </xsl:when>
      <xsl:when test="$register/@execution_state = 'AArch32' and $CONTROL64">
        <xsl:value-of select="$CONTROL64"/>
        <xsl:text>.</xsl:text>
        <xsl:value-of select="$FIELD_NAME"/>
        <xsl:value-of select="$OP"/>
        <xsl:value-of select="@value"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="$CONTROL64 and $CONTROL32">
          <xsl:text>(</xsl:text>
        </xsl:if>
        <xsl:if test="$CONTROL64">
          <xsl:value-of select="$CONTROL64"/>
          <xsl:text>.</xsl:text>
          <xsl:value-of select="$FIELD_NAME"/>
          <xsl:value-of select="$OP"/>
          <xsl:value-of select="@value"/>
          <xsl:if test="$CONTROL32">
            <xsl:text> || </xsl:text>
          </xsl:if>
        </xsl:if>
        <xsl:if test="$CONTROL32">
          <xsl:value-of select="$CONTROL32"/>
          <xsl:text>.</xsl:text>
          <xsl:value-of select="$FIELD_NAME"/>
          <xsl:value-of select="$OP"/>
          <xsl:value-of select="@value"/>
        </xsl:if>
        <xsl:if test="$CONTROL64 and $CONTROL32">
          <xsl:text>)</xsl:text>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:if>
</xsl:template>


<!-- Templates for embedded markup -->

<xsl:template match="arm-defined-word">
  <span class="arm-defined-word"><xsl:value-of select="."/></span>
</xsl:template>

<xsl:template match="instruction">
  <span class="instruction"><xsl:value-of select="."/></span>
</xsl:template>

<xsl:template match="binarynumber">
  <span class="binarynumber"><xsl:value-of select="."/></span>
</xsl:template>

<xsl:template match="hexnumber">
  <span class="hexnumber"><xsl:value-of select="."/></span>
</xsl:template>

<xsl:template match="signal">
  <span class="signal"><xsl:value-of select="."/></span>
</xsl:template>

<xsl:template match="xref">
  <span class="xref"><xsl:value-of select="./@browsertext"/></span>
</xsl:template>

<xsl:template match="register_link">
  <xsl:choose>
    <!--
    <xsl:when test="./@state">
      <a>
        <xsl:attribute name="href">
          <!- - Register name is in upper-case, but file name is lower-case.- ->
          <xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
          <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
          <xsl:value-of select="./@state"/>-<xsl:value-of select="translate(translate(.,'&lt;&gt;',''), $uppercase, $lowercase)"/>.xml
        </xsl:attribute>
        <xsl:value-of select="."/>
      </a>
    </xsl:when>
    -->
    <xsl:when test="./@id">
      <!-- Legacy - register_link has @id, but no @state.
           Do not need to fabricate the file name. -->
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select="./@id"/>
        </xsl:attribute>
        <xsl:value-of select="."/>
      </a>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="."/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="para">
  <p>
    <xsl:apply-templates/>
  </p>
</xsl:template>

<xsl:template match="note">
  <div class="note">
    <span class="note-header">Note</span>
  <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="list">
  <xsl:choose>
    <xsl:when test="./@type = 'unordered'">
      <ul>
        <xsl:apply-templates/>
      </ul>
    </xsl:when>
    <xsl:when test="./@type = 'param'">
      <dl>
        <xsl:apply-templates/>
      </dl>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="listitem">
  <xsl:choose>
    <xsl:when test="../@type = 'unordered'">
      <li><xsl:apply-templates/></li>
    </xsl:when>
    <xsl:when test="../@type = 'param'">
      <dt><xsl:apply-templates select="param"/></dt>
      <dd><xsl:apply-templates select="content"/></dd>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="param">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="content">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="sub">
  <sub><xsl:apply-templates/></sub>
</xsl:template>

<xsl:template match="sup">
  <sup><xsl:apply-templates/></sup>
</xsl:template>

<xsl:template match="table">
  <table class="valuetable"><xsl:apply-templates/></table>
</xsl:template>

<xsl:template match="tgroup">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="thead">
  <thead><xsl:apply-templates/></thead>
</xsl:template>

<xsl:template match="tbody">
  <tbody><xsl:apply-templates/></tbody>
</xsl:template>

<xsl:template match="row">
  <tr><xsl:apply-templates/></tr>
</xsl:template>

<xsl:template match="entry">
  <xsl:choose>
    <xsl:when test="name(../..) = 'thead'">
      <th><xsl:apply-templates/></th>
    </xsl:when>
    <xsl:otherwise>
      <td><xsl:apply-templates/></td>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>
