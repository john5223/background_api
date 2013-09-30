import os, yaml

app_base = os.path.dirname(os.path.realpath(__file__))
app_base_join = lambda x: os.path.join(os.sep, app_base, x)

#Get config
print "Reading config"
configs = yaml.load(open(app_base_join('conf' + os.sep + "application.yaml")))
config = {}
env = configs['environment']
for key, val in configs.iteritems():
    if key == 'environment':
        config.update({key: val})
    else:
        config.update({key: val[env]})
