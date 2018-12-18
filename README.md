# Материалы к лекции по XML, XSLT и XPath
_Школа программистов HeadHunter 2018_

Для работы в консоли понадобится libxml2 и libxslt, трансформация запускается так:
```bash
xsltproc path/to/template.xsl path/to/input.xml
```

Для начала прочитайте `xsltproc --help`, там есть интересные флаги.

В примерах в папке `xsl` есть шаблоны для разных XML-файлов.<br/>    
Первое слово в названии шаблона — это имя XML, к которому его применять.

Полный список примеров:
```bash
xsltproc xsl/01-hello-no-templates.xsl xml/hello.xml
xsltproc xsl/02-hello.xsl xml/hello.xml
xsltproc xsl/03-hello-creation.xsl xml/hello.xml
xsltproc xsl/04-account-control.xsl xml/account.xml
xsltproc xsl/05-account-call.xsl xml/account.xml
xsltproc xsl/06-hello-copy.xsl xml/hello.xml
xsltproc xsl/06-hello-filter.xsl xml/hello.xml
xsltproc xsl/06-hello-proxy.xsl xml/hello.xml
xsltproc xsl/07-hello-proxy-import.xsl xml/hello.xml
xsltproc --verbose xsl/08-account-priority.xsl xml/account.xml
xsltproc --verbose xsl/08-account-priority.xsl xml/account.xml 2>&1 | grep 'default priority'
xsltproc xsl/09-account-modes.xsl xml/account.xml
xsltproc xsl/10-hello-variable.xsl xml/hello.xml
xsltproc xsl/11-hello-params.xsl xml/hello.xml
xsltproc xsl/12-account-sort.xsl xml/account.xml
xsltproc xsl/13-account-key.xsl xml/account.xml
xsltproc xsl/14-hello-attribute.xsl xml/hello.xml
xsltproc xsl/15-account-urls.xsl xml/account.xml
```

Можно смотреть результат трансформации в браузере. Для этого нужно:
1) Добавить в XML после пролога подключение таблицы стилей:
```xml
<?xml-stylesheet type="text/xsl" href="/xsl/04-account-control.xsl"?>
```
2) Запустить http-сервер в корне репозитория, например так: `python -m SimpleHTTPServer 8087` (порт любой).
3) Открыть в браузере _XML_: `http://locaalhost:8087/xml/account-browser.xml`.

# Домашнее задание

_ДЗ принимается в виде пулл-реквеста в мастер этого репозитория.
В названии реквеста укажите ваше имя и фамилию, само задание кладите в `homework`._
 
1) Спроектировать XML для списка пулл-реквестов на GitHub, например такого:
https://github.com/facebook/create-react-app/pulls

    Не обязательно большой, достаточно нескольких PR с разным набором полей.

2) Написать XSL, превращающий XML из первого задания в HTML-страницу из первого задания.

    Остановимся на таком наборе фич:
    
    * количество открытых и закрытых реквестов;
    * атрибуты каждого реквеста: дата, автор, метки, галочки, количество комментов.

3) _\[Опционально\]_ Сделать то же самое для страниц пулл-реквестов, и связать их ссылками со списком,
чтобы можно было переходить в браузере (подсказка: XSL в браузере).  

Придерживайтесь декларативного стиля, не используйте по любому поводу
`if`, `choose`, `foreach` и `call-template`.

Чтобы было не скучно, возьмите какой-нибудь https://bulma.io или другой CSS-фреймворк
(по желанию, суть задания не в этом). 
