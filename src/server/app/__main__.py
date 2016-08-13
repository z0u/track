import logging
import logging.config
import os
import socket

import tornado.ioloop
import yaml

import app
from app import mapping, model


log = logging.getLogger('app')


def configure():
    log_path = os.path.join(app.path, 'logging.yaml')
    with open(log_path) as f:
        conf = yaml.load(f)
    logging.config.dictConfig(conf)


if __name__ == "__main__":
    configure()
    instance = tornado.web.Application(
        mapping.mappings,
        compress_response=True,
        debug=True,
        xsrf_cookies=True,
    )
    instance.listen(80)
    model.connect()
    log.info("Serving on http://%s", socket.gethostbyname(socket.gethostname()))
    tornado.ioloop.IOLoop.current().start()
