import app


mappings = [
    (r"/ping", app.ping.Ping),
    (r"/", app.MainHandler),
]
