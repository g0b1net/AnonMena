from requests import get

ip = get('https://api.ipify.org').text
print('Tu IP actual es: {}'.format(ip))
