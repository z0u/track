import tornado.web


class MissingDocument(tornado.web.HTTPError):
    def __init__(message):
        super().__init__(status_code=404, reason=message)


class BadModel(tornado.web.HTTPError):
    def __init__(message):
        super().__init__(status_code=403, reason=message)
