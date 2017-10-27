import threading
try: 
    from http.server import HTTPServer, SimpleHTTPRequestHandler # Python 3
except ImportError: 
    from SimpleHTTPServer import BaseHTTPServer, SimpleHTTPRequestHandler # Python 2
server = BaseHTTPServer.HTTPServer(('localhost', 0), SimpleHTTPRequestHandler)
thread = threading.Thread(target = server.serve_forever)
thread.deamon = True
thread.start()
def fin():
    server.shutdown()
print('server running on port {}'.format(server.server_port))

