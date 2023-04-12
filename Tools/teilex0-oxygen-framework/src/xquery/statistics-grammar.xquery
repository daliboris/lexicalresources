xquery version "3.1" encoding "utf-8";

declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace map="http://www.w3.org/2005/xpath-functions/map";


let $groups := //tei:gramGrp

let $items := for $item in $groups//tei:gram
 return $item
 
let $result := for $item in $items
 let $type := $item/@type
 let $norm := $item/@norm
 let $value := $item/data() 
 group by $type, $value
 order by $type
 return <item name="{$type}" value="{head($value)}" norm="{head($norm)}" count="{count($item)}" />
 
return <items name="gram">{$result}</items> 