import tornado.web

from app import model


class Ping(tornado.web.RequestHandler):
    def get(self):
        with model.session() as session:
            session.query(model.Config).count()
        self.set_header('Content-Type', 'text/plain')
        self.write("Web services are UP")
