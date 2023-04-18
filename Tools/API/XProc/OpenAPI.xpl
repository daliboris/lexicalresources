<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" version="3.0">
            
	<p:output port="result" serialization="map{'indent' : true()}" />
 <p:input port="source">
  <p:document href="../Resources/Oxford-Dictionaries_v2.json" />
 </p:input>
	
	
 <p:variable name="name" select="'Oxford-Dictionaries_v2'" />
	
 <p:variable name="uri" select="p:urify(concat('file:/D:/Data/Dropbox/Zavazky/TEI-Lex-0/2023/APIs/Resources/', $name, '.json'))" />
	
	<p:xquery>
	 <p:with-option name="parameters" select="map {'document-uri' : $uri}" />
	 <p:with-input port="query" href="../XQuery/OpenAPI-to-Xml.xquery" />
	</p:xquery>


 <p:store href="../Resources/{$name}.xml" serialization="map{'indent' : true()}" />

 <p:xslt>
  <p:with-input port="stylesheet" href="../Xslt/OpenAPI-Xml-to-Markdown.xsl" />
 </p:xslt>


 <p:store href="../Resources/{$name}.md" />

</p:declare-step>
