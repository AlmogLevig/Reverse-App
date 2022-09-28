from urllib.parse import urlparse, unquote
import re


def query2Json(url):
    text = urlParse(url)
    word = reverseSentence(text)
    return string2Json(word)


def urlParse(url):
    url = unquote(url)
    url_parse = urlparse(url)
    return re.sub("[(){}<>'\"]", '', url_parse.query)


def reverseSentence(text):
    words = text.split(' ')
    return ' '.join(reversed(words))


def string2Json(text):
    if len(text.split()) > 1:
        d = {"result": text.split()}
    else:
        d = {"result": text}
    return d


