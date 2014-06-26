<?xml version="1.0" encoding="UTF-8"?>
<!-- Basic MODS -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>    

    <!--get PID from FOXML file-->
    <xsl:variable name="submission-path" select="//submission-path"/>

    <!--for active documents-->
    <xsl:template match="/documents/document">
        <add>
            <doc>
                <!--Internal-->
                <field name="id">
                    <xsl:value-of select="$submission-path"/>
                </field>
                <field name="last_modified">NOW</field>
                
                <!--title-->
                <field name="title">
                    <xsl:value-of select="title" />
                </field>

                <!--author(s)-->
                <xsl:for-each select="authors/author">
                        <xsl:if test="lname">
                            <field><xsl:attribute name="name"><xsl:value-of select="concat('author_lname_', position() )" /></xsl:attribute><xsl:value-of select="lname"/></field>
                        </xsl:if>
                        <xsl:if test="fname">
                            <field><xsl:attribute name="name"><xsl:value-of select="concat('author_fname_', position() )" /></xsl:attribute><xsl:value-of select="fname"/></field>
                        </xsl:if>
                        <xsl:if test="mname">
                            <field><xsl:attribute name="name"><xsl:value-of select="concat('author_mname_', position() )" /></xsl:attribute><xsl:value-of select="mname"/></field>
                        </xsl:if>
                        <xsl:if test="institution">
                            <field><xsl:attribute name="name"><xsl:value-of select="concat('author_institution_', position() )" /></xsl:attribute><xsl:value-of select="institution"/></field>
                        </xsl:if>
                        <xsl:if test="email">
                            <field><xsl:attribute name="name"><xsl:value-of select="concat('author_email_', position() )" /></xsl:attribute><xsl:value-of select="email"/></field>
                        </xsl:if>
                </xsl:for-each>

                <!--keyword(s)-->
                <xsl:for-each select="keywords/keyword">                        
                    <field name="keyword"><xsl:value-of select="."/></field>                    
                </xsl:for-each>

                <!--discipline(s)-->
                <xsl:for-each select="disciplines/discipline">                        
                    <field name="discipline"><xsl:value-of select="."/></field>                    
                </xsl:for-each>

                <!--abstract-->
                <xsl:for-each select="abstract">                        
                    <field name="abstract"><xsl:value-of select="."/></field>                    
                </xsl:for-each>

                <!--coverpage-url-->
                <xsl:for-each select="coverpage-url">                        
                    <field name="coverpage-url"><xsl:value-of select="."/></field>                    
                </xsl:for-each>

                <!--fulltext-url-->
                <xsl:for-each select="fulltext-url">                        
                    <field name="fulltext-url"><xsl:value-of select="."/></field>                    
                </xsl:for-each>

                <!--type-->
                <xsl:for-each select="type">                        
                    <field name="type"><xsl:value-of select="."/></field>                    
                </xsl:for-each>

                 <!--document type-->
                <xsl:for-each select="document-type">                        
                    <field name="document-type"><xsl:value-of select="."/></field>                    
                </xsl:for-each>

                <!--document type-->
                <xsl:for-each select="document-type">                        
                    <field name="document-type"><xsl:value-of select="."/></field>                    
                </xsl:for-each>

                <!--article-->
                <xsl:for-each select="article">                        
                    <field name="article"><xsl:value-of select="."/></field>                    
                </xsl:for-each>

                <!--submission-date-->
                <xsl:for-each select="submission-date">                        
                    <field name="submission-date"><xsl:value-of select="."/></field>                    
                </xsl:for-each>      

                <!--native-url-->
                <xsl:for-each select="native-url">                        
                    <field name="native-url"><xsl:value-of select="."/></field>                    
                </xsl:for-each>    

                <!--context-key-->
                <xsl:for-each select="context-key">                        
                    <field name="context-key"><xsl:value-of select="."/></field>                    
                </xsl:for-each>     

                <!--publication-title-->
                <xsl:for-each select="publication-title">                        
                    <field name="publication-title"><xsl:value-of select="."/></field>                    
                </xsl:for-each>                               

            </doc>
        </add>
    </xsl:template>

</xsl:stylesheet>