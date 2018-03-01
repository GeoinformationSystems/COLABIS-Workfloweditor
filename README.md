# COLABIS Workfloweditor

The COLABIS Workfloweditor is a web client to create and save workflows according to the PROV data model standard as XML. Further information about PROV can be found at: https://www.w3.org/TR/prov-o/

## Structure

The COLABIS Workfloweditor is written in Javascript and Java. The modules and their functionality are briefly described here.

* ``/web`` - Browser part of the application (Javascript) to create a graph-based representation of a workflow
* ``/src`` - Server components of the application (Java) for XSLT transformations between GraphML and PROV

## Installation

The basic installation steps are
* Download code form GitHub
* Deploy the web archive (`out/artifacts/Graph2Prov_war`)in a servlet container (e.g. Apache Tomcat)
* Start application in web browser - e.g. http://localhost:8080/graph2prov/

## Javascript Libraries

The website module uses a collection of Javascript libraries:

* mxGraph, https://jgraph.github.io/mxgraph/ - Apache License 2.0
* jQuery, https://jquery.org/license/ - MIT License
* Bootstrap v4, https://getbootstrap.com/ - Code licensed under MIT License · Documentation licensed under CC BY 3.0
* Font Awesome, http://fontawesome.io/ - licensed under SIL OFL 1.1 · Code licensed under MIT License · Documentation licensed under CC BY 3.0

## Java Libraries

The server component uses a collection of Java libraries:

* jdom2, https://github.com/hunterhacker/jdom/blob/master/LICENSE.txt
* servlet-api - Apache License

## License

The COLABIS Workfloweditor project is licensed under The Apache Software License, Version 2.0

## Contact

Daniel Henzen (daniel.henzen@tu-dresden.de)
