#!/usr/bin/env python3

import requests
import sys
import os.path
from lxml import etree
from lxml.html.soupparser import parse

DEFAULT_URL = "https://github.com/facebook/create-react-app/pulls?q=is%3Apr"
PULLS_HTML = 'pulls.html'


def load_html():
    print('Loading HTML file...')
    url = sys.argv[1] if len(sys.argv) > 2 else DEFAULT_URL
    req = requests.get(url)
    text = req.text
    with open(PULLS_HTML, 'w') as outfile:
        outfile.writelines(text)


if __name__ == "__main__":
    if not os.path.isfile(PULLS_HTML):
        load_html()
    print('HTML file is ok')
    root = parse(PULLS_HTML)
    panel_div = root.findall('.//div[@class=\'js-navigation-container js-active-navigation-container\']')[0]
    valid_html = '<html>\n<head>\n</head>\n<body>\n{}\n</body>\n</html>'\
        .format(etree.tostring(panel_div, pretty_print=True).decode('UTF-8'))
    with open('valid-pulls.html', 'w') as valid_html_file:
        valid_html_file.writelines(valid_html)
