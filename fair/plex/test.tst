Options +FollowSymLinks
# Turn off MultiViews
Options -MultiViews

# Directive to ensure *.rdf files served as appropriate content type,
# if not present in main apache config
AddType application/rdf+xml .rdf
AddType application/rdf+xml .owl
AddType text/turtle .ttl

RewriteEngine on

#Rewrite rules for aco
RewriteCond %{HTTP_ACCEPT} !application/rdf\+xml.*(text/html|application/xhtml\+xml|text/\*|\*/\*)
RewriteCond %{HTTP_ACCEPT} text/html [OR]
RewriteCond %{HTTP_ACCEPT} application/xhtml\+xml [OR]
RewriteCond %{HTTP_ACCEPT} text/\* [OR]
RewriteCond %{HTTP_ACCEPT} \*/\* [OR]
RewriteCond %{HTTP_USER_AGENT} ^Mozilla/.*
RewriteRule ^aco$ https://github.com/fair-workflows/openpredict/tree/master/data/ontology  [R=303,NE,L]
RewriteCond %{HTTP_ACCEPT} ^.*application/rdf\+xml.*
RewriteRule ^aco$ https://github.com/fair-workflows/openpredict/blob/e7df8396fe9418e628cb2154043359b9237c07bf/data/ontology/plex_tbox_0.1.1.xml [R=303,NE,L]
RewriteCond %{HTTP_ACCEPT} ^.*text/turtle.*
RewriteRule ^aco$ https://github.com/fair-workflows/openpredict/blob/e7df8396fe9418e628cb2154043359b9237c07bf/data/ontology/plex_tbox_0.1.1.ttl [R=303,NE,L]
#default response: owl
RewriteRule ^aco$ https://github.com/fair-workflows/openpredict/blob/e7df8396fe9418e628cb2154043359b9237c07bf/data/ontology/plex_tbox_0.1.1.owl [R=303,NE,L]
