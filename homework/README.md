# Как запустить
1) Удалить существующие `pulls*` файлы 
   `rm ./homework/pulls*`
2) Установить python библиотеки
   `pip3 install requests lxml beautifulsoup4`
3) Выполнить python скрипт
   `python3 homework/getpulls.py [url]` 
   Он скачает по заданному url страницу с pull requests в файл `homework/pulls.html`.
   По умолчанию url страницы `https://github.com/facebook/create-react-app/pulls?q=is%3Apr`
   Дополнительно скрипт создаст модификацию скаченного файла `homework/pulls-valid.html` - это исходный файл
   в котором выкинута неинтересная часть с невалидным html.
4) Запустить `xsltproc --output homework/pulls.xml homework/make-xml.xsl homework/pulls-valid.html`
   для генерации `xml` файла по скачанной старнице.
5) Запустить `xsltproc --output homework/pulls-result.html homework/make-html.xsl homework/pulls.xml`
   для генерации `html` страницы по сгенерированному `xml`.
