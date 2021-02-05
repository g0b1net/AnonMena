from requests import get
import socket, socks
import time

def connectToTor():
    socks.setdefaultproxy(socks.PROXY_TYPE_SOCKS5, "127.0.0.1", 9050, True)
    socket.socket = socks.socksocket
def testIP():
	ip = get('https://api.ipify.org').text
	print('Tu IP actual es: {}'.format(ip))

def main():
	connectToTor()
	testIP()

if __name__ == '__main__':
	main()
