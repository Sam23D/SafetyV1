from render import Renderer
import webapp2
from controlers import *

class MainHandler(Renderer):
    def get(self):
        paths = Path.query()
        nodes = Node.query()
        self.render('dervscreator.html', message = "todo bien", nodes = nodes)

app = webapp2.WSGIApplication([
    ('/volcanoes',Volcanoes),
    ('/msg',Messages),
    ('/meetpt',MeetingPts),
    ('/evaRoute',EvacuationRoutes),
    ('/volcanoes/(.*)',Volcanoes),
    ('/msg/(.*)',Messages),
    ('/meetpt/(.*)',MeetingPts),
    ('/evaRoute/(.*)',EvacuationRoutes),
    ('/', MainHandler),
    ('/node',NodeGenerator),
    ('/node/(.*)',NodeGenerator),
    ('/routegenerator',RouteGeneretor),
    ('/routegenerator/(.*)',RouteGeneretor),
    ('/delete/(.*)',globalDeleter)

], debug=True)
