This repo creates a pipeline to manage SFCC webdav logs using FileBeat and ELK. We use the official filebeat image, upgraded facilitate mounting of remote WebDAV resources into containers. Mounting is implemented using davfs2 and the image makes it possible to set all supported davfs configuration options for the share. The image basically mount the webdav remote ressource as a regular filesystem, that will be used as an input for Filebeat.

A docker compose file can be used as an example on how the configuration should be done.



