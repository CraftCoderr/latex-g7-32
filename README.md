Стиль LaTeX для оформления отчетов о НИР, расчётно-пояснительной записки к курсовым и дипломным работам (ГОСТ 7.32-2001 и ГОСТ РВ 15.110-2003)
===========

**[Требуется maintainer!](https://github.com/latex-g7-32/latex-g7-32/issues/103)**

Ориентирован на студентов IT специальностей, научных работников и др. кому необходимо составлять документы по ГОСТ 7.32-2001 или ГОСТ РВ 15.110-2003.

Изначально был написан в расчёте на `pdfLaTeX`, с коммита `23b1612` добавлена поддержка `XeLaTeX`. Помимо стилей содержит "рыбу" РПЗ (в той же папке `tex`). 

Также имеются необходимые макеты (layout) для [LyX](http://ru.wikipedia.org/wiki/LyX) (редактор, редактирование в котором больше похоже на работу в `Microsoft Word`, чем на написание `LaTeX` кода, но результат получается такой же хороший, как в `LaTeX`). Для использования `LyX` также нужно скопировать стили LaTeX (из папки `tex`).

## Результат
См. вкладку [Релизы](https://github.com/rominf/latex-g7-32/releases).

### Попробовать online
Спасибо [@KMax](https://github.com/rominf/latex-g7-32/issues/11), теперь [можно попробовать](https://www.sharelatex.com/project/54885f204b9308be064f025e) шаблон в ShareLaTeX.

## Участие в проекте

Стиль распространяется "как есть". В случае обнаружения несостыковок с ГОСТом, обнаружении багов, а также если есть вопросы по использованию, не отражённые в документации, заводите, пожалуйста, issue. Pull requests принимаются.

## Установка

Скачать последнюю версию.

C помощью git:
```
git clone https://github.com/latex-g7-32/latex-g7-32
```
Или скачать zip:
```
https://github.com/latex-g7-32/latex-g7-32/archive/master.zip:
```

Или взять из [релизов](https://github.com/rominf/latex-g7-32/releases).
Однако, релизы формируются с течением времени и могут содержать существенно устаревшую версию.

Скопировать файлы: 
`G2-105.sty  G7-32.cls  G7-32.sty  GostBase.clo  gosttitleGostRV15-110mipt.sty  gosttitleGostRV15-110.sty  local-minted.sty` в локальный texmf.
Для линукс это будет `$HOME/texmf/`.
Для Виндовс `C:\Users\USERNAME\texmf\`.
Проверить это можно командой `kpsewhich -var-value=TEXMFHOME`.
Относительно texmf путь будет `texmf/tex/latex/latex-g7-32/`.


### Зависимости

#### Основные для стилевого файла

##### LaTeX пакеты
```
amssymb amsmath caption flafter footmisc hyperref icomma iftex graphicx longtable underscore etoolbox lastpage titlesec flafter amssymb amsmath color mfirstuc nomencl 
```
###### openSUSE
```
texlive-latex texlive-iftex 
```


#### pdfLaTeX-версия
##### LaTeX пакеты
```
cmap babel mathtext pscyr ucs
```

Для придания таймовского вида нужно установить соотв. шрифты (пакет `cyrtimes.sty`), в Debian/Ubuntu это пакет `scalable-cyrfonts-tex`. Если этого пакета нет, оно использует стандартную гарнитуру CM.

#### XeLaTeX-версия
##### LaTeX пакеты
```
cm-unicode-fonts minted polyglossia xecyr
```

###### openSUSE
```
cm-unicode-fonts texlive-minted texlive-polyglossia texlive-xecyr
```

##### Программы
```
inkscape dia graphviz python pygments
```

#### LyX
```
lyx
```

#### Установочный скрипт
```
python3.4
```
На текущий момент не работает см. [#26](https://github.com/rominf/latex-g7-32/issues/11).

Копирует (или перемещает) файлы со стилями в общую `texmf` папку, макеты `LyX` в папку с настройками `LyX`. Для получения помощи вызовите `install.py --help`.

## Использование РПЗ
После изменения РПЗ создайте директорию build в корне проекта, затем `cd ./build & cmake .. && make`. В ней появится файл РПЗ - rpz.pdf. Cmake по умолчанию собирает с xelatex.

После изменения РПЗ запустите `make` в корне. Результатом будет `rpz.pdf`. Если требуется использование `pdfLaTeX` то в `Makefile` надо поменять в третье строке `xelatex` на `pdflatex`.

### Редактор
Можно использовать любой редактор, например, `Kile`. На комманду `cd .. && make` вешается горячая клавиша и создаётся проект с корректным главным документом.

## Сборка с использованием Docker

После установки и настройки docker (обратитесь к документации вашего 
дистрибутиве) создайте образ:

```Shell
cd /path/to/latex-g7-32
cd docker
docker build -t latex-g7-32 .
```

Все необходимые зависимости будут установлены внутри образа.

Затем сборку можно будет осуществлять следующим образом:

```Shell
rm -r /path/to/latex-g7-32/results/
docker run --rm --volume /path/to/latex-g7-32/example/:/doc/tex/ latex-g7-32
```

Созданные файлы появятся в каталоге `/path/to/latex-g7-32/example/results`, его 
необходимо удалять перед пересборкой. При сборке этим методом шаблон собирается 
четырьмя способами: (make, cmake) × (pdflatex, xelatex), если вам достаточно 
какого‐то одного, то можно изменить `docker/build.sh`.

## Использование LyX
Откройте `lyx/rpz.lyx` и редактируйте.

В первый раз необходимо настроить параметры вызова XeLaTeX, для того, чтобы `minted` работал.

Настроки -> Обработка файлов -> Конверторы -> LaTeX (XeTeX) -> PDF (XeTeX) -> Изменить -> Преобразователь: `xelatex -shell-escape $$i`.

## Шрифты

В отчёте можно использовать свободный аналог Times New Roman - PT Astra, они находятся в репозитории в каталоге docker/fonts и автоматически установливается в docker-образ.

При необходимости нужные шрифты можно добавить в docker/fonts. После этого необходимо пересобрать образ.

Опции класса документа, устанавливающие шрифты:

1. При использовании XeLaTeX:

    1. `astra` (по умолчанию) — свободные шрифты Astra Sans, Astra Serif, Liberation Mono.
    2. `times` — Шрифты Times New Roman, Arial, Courier New. Необходимо, чтобы у вас был подписан лицензионный договор с правообладателем шрифтов — компанией Monotype Imaging Inc.
    3. `cm` — Шрифты CMU, которые обычно включены в TeX Live.

2. При использовании PdfLaTeX:

   1. `times` (по умолчанию) — шрифты из пакета cyrtimes: Nimbus Roman и Nimbus Sans.
   2. `pscyr` — шрифты из пакета pscyr: Antiqua PSCyr, Textbook PSCyr, ERKurier PSCyr.
   3. `cm` — шрифты CM, которые обычно включены в TeX Live.

Если какой-то шрифт не найден, то вместо него будет использоваться соответствующий шрифт CM.

Эти опции нужно задавать в `\documentclass`, например так: `\documentclass[utf8x, times, 14pt]{G7-32}`

## Печать

Для подготовки к печать варианты сборки с помощью Makefile и CMake имеют цель 
`printpdfs`. При её использовании (`make printpdfs` либо из корня репозитория, 
либо из каталога build в случае CMake) дополнительно создаётся до трёх PDF 
файлов рядом с `rpz.pdf`: `rpz.gs.pdf`, `rpz.gs-color.pdf` и `rpz.gs-gray.pdf`:

- `rpz.gs.pdf` содержит все страницы, как и `rpz.pdf`, но использует меньше 
  возможностей PDF: известно, что при печати `rpz.pdf` средствами некоторых 
  принтеров, поддерживающих печать PDF с flash‐карты с графов может пропасть 
  русский текст.
- `rpz.gs-color.pdf` гарантированно содержит все «цветные» страницы, а также 
  некоторые нецветные — inkscape создаёт чёрно‐белые PDF, которые ghostscript 
  почему‐то считает нужным печатать цветными красками.
- `rpz.gs-gray.pdf` содержит страницы, которые можно печатать, имея только 
  чёрную краску.

Для работы `printpdfs` требуется наличие ghostscript (команд `gs` или 
`gswin32c`).

## Авторы

### 1. Первая версия
Алексей Томин

### 2. Доработка "дебианщика"
[Михаил Конник](http://mydebianblog.blogspot.ru/2008/09/732-2001-latex.html)

### 3a. Доработка кафедры [ИУ7](http://iu7.bmstu.ru)
|[Всеволод Крищенко](http://web.archive.org/web/20100424031801/http://sevik.ru/latex/)|
-------------------

[Иван Коротков](https://github.com/tw33dl3dee)

#### Changelog
```
1. Заработали cases и tabular;
2. Добавлена опция utf8;
3. Комментарии в UTF-8;
4. Изменены отступы после тире в description;
5. Добавлен \paragraph;
6. Уменьшены отспупы после заголовков и учеличены --- до (хотя это, возможно, и нарушает 7-32);
7. Сделаны отсупы в оглалвнеии (ГОСТ эту тему обходит, как мы поняли);
8. \normalfont;
9. Добавлен раздел "Приложения".
9. Makefile для автоматизации рутины;
10. Рисунки (обрезка, конвертация dia, dot, svg);
11. Стили для листингов;
12. Разные мелочи.
```

### 3b. Добавление layouts LyX
[Расим (Brotherofken)](http://habrahabr.ru/post/116517/)


### 4. GitHub, поддержка XeLaTeX, LyX
[Роман Инфлянскас](https://github.com/rominf)

### 5. Further fixes, tweaks and development

According to the requirements of
ГОСТ 7.32-2001 ред. 2009 года.pdf and some other random wishes.
-- Ivan Zakharyaschev <imz@altlinux.org>.

(Read the git log... I tried to explain each change clearly.)

### 6a. Сборка под при помощи Сmake, Windows+cygwin, CMakeLists.txt, а также сборка с docker
[Николай Павлов](https://github.com/ZyX-I)
### 6b. Сборка при помощи [latexmkmod](https://github.com/dvarubla/latexmkmod), Windows+Linux,
[dvarubla](https://github.com/dvarubla)


## Благодарности
[Ростислав Листеренко](https://github.com/kaedvann) (сообщения об ошибках)

Стиль разрабатывается при поддержке ["Дизайн-центр МФТИ"](http://miptdesigncenter.tilda.ws), [НТКТеХЛАБ](http://ntktechlab.org). 

## См. также
### Статьи
[Записки дебианщика](http://mydebianblog.blogspot.nl/2008/11/latex.html)

### Репозитории
[@qrilka: порт второй версии на `XeLaTeX`](https://github.com/qrilka/G7-32)

[@petethepig: порт урезанной третьей версии ("под себя") на `XeLaTeX`](https://github.com/petethepig/diploma)

### Классы LaTeX для написания диссертаций
[Russian-Phd-LaTeX-Dissertation-Template](https://github.com/AndreyAkinshin/Russian-Phd-LaTeX-Dissertation-Template)

[Класс для диссертаций disser](https://github.com/polariton/disser)
