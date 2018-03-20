from wdr import *

# configure from the manifest
manifestVariables = {'nodeName': 'node1', 'serverName': 'server1'}
importConfigurationManifest('config.wdrc', manifestVariables)
save()
