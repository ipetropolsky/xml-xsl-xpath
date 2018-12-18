# Материалы к лекции по XML, XSLT и XPath
_Школа программистов HeadHunter 2018_

В примерах есть шаблоны для разных XML-файлов.<br/>    
Первое слово в названии шаблона — это имя XML, к которому его применять.

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

Для работы в консоли понадобится libxml2 и libxslt, трансформация запускается так: `xsltproc template.xsl input.xml`.

Для начала прочитайте `xsltproc --help`, там есть интересные флаги.

Можно смотреть результат трансформации в браузере. Для этого нужно:
1) Добавить в XML после пролога подключение таблицы стилей:
```xml
<?xml-stylesheet type="text/xsl" href="/xsl/04-account-control.xsl"?>
```
2) Запустить http-сервер в папке с XML и XSL, например так: `python -m SimpleHTTPServer 8087` (порт любой).
3) Открыть в браузере XML: `http://locaalhost:8087/xml/account-browser.xml`.

# Домашнее задание

TODO

Можно форкнуть этот репозиторий и сделать пулл-реквест в мастер,
положив задание в `/homework` и написав в названии реквеста своё имя и фамилию.
