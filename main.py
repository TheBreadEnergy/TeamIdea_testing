# Задача 3.b
import requests
import xml.etree.ElementTree as XML

url = "http://www.cbr.ru/scripts/XML_daily.asp"

data = requests.get(url).content
find = XML.fromstring(data)


def serch(code):
    for numcode in find.findall('Valute'):
        if numcode.find('NumCode').text == code:
            name = numcode.find('Name').text
            nominal = int(numcode.find('Nominal').text)
            value = numcode.find('Value').text
            value = float(value.replace(',', '.'))
        else:
            continue
        return name, nominal, value


def toOne(currency):
    value = currency[2] / currency[1]
    return currency[0], 1, value


huf = serch('348')
nok = serch('578')
print(huf)
print(nok)
huf = toOne(huf)
nok = toOne(nok)
print(huf)
print(nok)
print('В одной норвежской кроне венгерских форинтов: ', nok[2] / huf[2])
