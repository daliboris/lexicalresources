# TEI Lex-0 oXygen Framework

Add-on for [oXygen XML Editor](https://www.oxygenxml.com/xml_editor.html) with tools for editing, transforming, and analyzing dictionaries in [TEI Lex-0](https://bit.ly/tei-lex-0) format.

## Supported version of TEI Lex-0

- [0.9.1](https://github.com/DARIAH-ERIC/lexicalresources/releases/tag/v0.9.1)
- [0.9.0](https://github.com/DARIAH-ERIC/lexicalresources/releases/tag/v0.9.0)

## Tools

- templates
- inserting entry with basic structure
- separate view of the body with entries
- separate view of the teiHeader
- extraction of the list of the headwords
- statistics of used elements and attributes
- export to PDF

## Current state

This project is in the proof-of-concept phase.

## Build

TEI Lex-0 oXygen Framework can be build using ANT: 

- run `ant` command In the root directory 

Distributed version of the framework, `teilex0-oxygen-framework.zip` file, is stored in the `web` subdirectory of the project.

## Installation

The framework can be installed using `teilex0-oxygen-framework.zip` file, or you can upload both files from the `web` directory (`oxygen-addons.xml` and `teilex0-oxygen-framework.zip`) to the web server and install the framework from the internet.

The installation process of the framework is described in the [documentation](https://www.oxygenxml.com/doc/versions/25.1/ug-editor/topics/installing-and-updating-add-ons.html) of the oXygen XML editor.