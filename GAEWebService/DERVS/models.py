from google.appengine.ext import ndb


class Message(ndb.Model):

    created = ndb.DateTimeProperty(auto_now_add = True )
    type = ndb.StringProperty()
    desc = ndb.StringProperty()
    location = ndb.GeoPtProperty()
    vName = ndb.StringProperty()

class Volcano(ndb.Model):

    name = ndb.StringProperty()
    country = ndb.StringProperty()
    location = ndb.GeoPtProperty()
    size = ndb.IntegerProperty()


class MeetingPt(ndb.Model):

    name = ndb.StringProperty()
    location = ndb.GeoPtProperty()
    #vName = ndb.StringProperty()

class EvacuationRoute(ndb.Model):
    meetPt = ndb.StringProperty()
    name = ndb.StringProperty()
    jsonRouteArray = ndb.StringProperty()
    origin = ndb.GeoPtProperty()

######################################## DERVS PROTOCOL########################################

class Node(ndb.Model):
    name = ndb.StringProperty() # uniqe name in the owner
    rType = ndb.StringProperty() # node or safezone
    #owner = ndb.KeyProperty() # key of the industrie or location for the node (CentralHospital's KEY, Harvard's KEY )
    owner = ndb.StringProperty()
    status = ndb.StringProperty() # status of the route node fine or blocked

    location = ndb.GeoPtProperty() # geo location of the node

class Path(ndb.Model):
    name = ndb.StringProperty() # paths name concatenation of root's name + " - " + destination's name
    root = ndb.KeyProperty() # root node
    dest = ndb.KeyProperty() # dest node in path

    distance = ndb.FloatProperty() # distance between the two nodes
