<?php
// Load XSL file
$xsl = new DomDocument();
$xsl->load("sample.xsl");
// Load XML file
$xml = new DomDocument();
$xml->load("Admissions.xml");
// Configure the transformer
$proc = new XsltProcessor();
//Applies the transformation and shows the results
$xsl = $proc->importStylesheet($xsl);
$newdom = $proc->transformToDoc($xml);
print $newdom->saveXML();
?>