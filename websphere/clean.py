from wdr import *

# remove default apps
AdminApp.uninstall('DefaultApplication')
AdminApp.uninstall('ivtApp')
AdminApp.uninstall('query')
save()
