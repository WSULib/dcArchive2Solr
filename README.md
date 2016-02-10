dcArchive2Solr
==============

Utility to parse Quarterly Archives from Digital Commons and index in Solr

#### Steps
1. Run harvest.sh with -f NameOfDCFile.tar.gz to
  * unpack the tar file
  * remove all non-xml files from unpacked file
  * created a tar.gz file with xml files for Fedora datastream
3. Upload both original and new tar.gz files as Fedora datastreams to the Digital Commons archive object
4. Run dcArchive2Solr.py file with IP or FQDN as argument. Format: python dcArchive2Solr.py 127.0.0.98
