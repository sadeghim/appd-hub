### appd-hub   [![Build Status](https://travis-ci.org/AtlasOfLivingAustralia/appd-hub.svg?branch=master)](https://travis-ci.org/AtlasOfLivingAustralia/appd-hub)

NOTE: Once installed via ansible, the following files will need to be modified on the APPD Hub server:

In the file “/data/biocache/config/biocache-config.properties” add the extra line:
   extra.misc.fields=hostFamily,hostGenus,hostSpecificEpithet,hostVernacularName

In the file “/data/solr/biocache/conf/schema.xml”  add the following extra lines:

   <field name="hostFamily" type="string" indexed="true" stored="true" multiValued="false"/>
   <field name="hostGenus" type="string" indexed="true" stored="true" multiValued="false"/>
   <field name="hostSpecificEpithet" type="string" indexed="true" stored="true" multiValued="false" />
   <field name="hostVernacularName" type="string" indexed="true" stored="true" multiValued="false" />

