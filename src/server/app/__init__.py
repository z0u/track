import inspect
import os

import tornado.web

from . import ping


path = os.path.dirname(inspect.getfile(inspect.currentframe()))


class MainHandler(tornado.web.RequestHandler):
    def get(self):
        self.write("Hello, world")
