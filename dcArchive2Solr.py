# small utility to parse DC Archives and index in Solr

import os
import sys
import xml.etree.ElementTree as ET
import urllib, urllib2
import requests
from string import Template
import time
import datetime
from lxml import etree

'''
Expecting /input directory to be full of metadata.xml files from DC archive
'''

# parse with lxml, load into memory
def loadDocument(filePath):	
	fhand = open(filePath,'r')
	dc_document = fhand.read()
	XMLroot = etree.fromstring(dc_document)
	return XMLroot


# transform into Solr ready document
def processDocument(XMLroot):	
	XSLhand = open('dcDocument_to_Solr.xsl','r')			
	xslt_tree = etree.parse(XSLhand)
	transform = etree.XSLT(xslt_tree)
	SolrXML = transform(XMLroot)
	return SolrXML


# index in Solr
def indexDocument(SolrXML):
	# print SolrXML
	updateURL = "http://localhost/solr4/DCArchive/update/"															
	headers = {'Content-Type': 'application/xml'}
	r = requests.post(updateURL, data=str(SolrXML), headers=headers)
	# print r.text

def commitSolrChanges():
		# commit changes in Solr
		print "*** Committing Changes ***"
		baseurl = 'http://localhost/solr4/DCArchive/update/' 
		data = {'commit':'true'}
		r = requests.post(baseurl,data=data)		


# iterate through documents
count = 1
ehand = open('errors.txt','wa')
for root, subFolders, files in os.walk("input"):	
	for filename in files:		
		if filename == "metadata.xml":
			filePath = os.path.join(root, filename)
			try:
				# run functions
				XMLroot = loadDocument(filePath)
				SolrXML = processDocument(XMLroot)
				indexDocument(SolrXML)						
			except:
				ehand.write("Could not index: {filePath}".format(filePath=filePath))
			
			# show counter
			print count
			count += 1
			# raw_input("enter to continue...")

# commit.
commitSolrChanges()
		

