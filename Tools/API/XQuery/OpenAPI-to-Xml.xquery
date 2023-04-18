xquery version "3.1";
declare namespace map = "http://www.w3.org/2005/xpath-functions/map";
declare namespace array = "http://www.w3.org/2005/xpath-functions/array";

declare variable $document-uri as xs:string external;
declare variable $api := json-doc($document-uri);

let $schema-value := function($param) {
 let $type := $param?schema?type
 let $default := if ($param?schema('default')) then
  " [" || $param?schema('default') || "]"
  else ""
 return
 if(exists($param?schema?enum)) then
    $type || ": " || string-join($param?schema?enum,"|") ||$default
   else
    $type || $default
}

let $parameters-xml := function($param) {
 if(exists($param('$ref'))) then
  (
   let $ref := substring-after($param('$ref'), '#/parameters/')
   let $par := $api?parameters($ref)
   let $value := $schema-value($par)
   
   return
   <parameter name="{$par?name}" schema="{$value}" />
  )
 else
  let $value := $schema-value($param)
  return
 <parameter name="{$param?name}" schema="{$value}" />
}

let $method-xml := function ($key, $value) {
 <method
  name="{$key}">
  {
   if (exists($value?summary)) then
    <summary>{$value?summary}</summary>
   else
    <description>{$value?description}</description>
  }
  
  {
   if (exists($value?parameters)) then
    array:for-each($value?parameters, $parameters-xml)
   else
    ()
  }
 </method>
}

let $path-xml := function ($key, $value)
{
 <path
  value="{$key}">
  {map:for-each($value, $method-xml)}
 </path>
}

let $paths := $api?paths
return  
 <api> {map:for-each($paths, $path-xml) }</api>