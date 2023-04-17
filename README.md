![Language Swift](https://user-images.githubusercontent.com/98527464/221845339-7f3d150f-e55d-4ce5-b286-0a79a3f86d96.svg)
![Arcitecture MVC](https://user-images.githubusercontent.com/98527464/221843408-9a856d94-7958-456b-9373-1ca1e91f79ea.svg)
![Version iOS 15](https://user-images.githubusercontent.com/98527464/221845480-4f89a7a3-a924-4690-a3a1-dd513128bdbf.svg)
![UI CompositionalLayout](https://user-images.githubusercontent.com/98527464/221845878-366bd2eb-99aa-403e-b6e6-bc1e4cd27354.svg)
![UI SheetPresentation](https://user-images.githubusercontent.com/98527464/221845880-a9a3dd2b-beac-4e20-9c7d-a9fa2eadd588.svg)

# Surf Internship App

![Снимок экрана 2023-03-30 132222](https://user-images.githubusercontent.com/98527464/228807170-e5fb5ea1-ddd6-4240-8b97-8c627e99eee9.png)

Приложение-визитка с описанием направлений стажировки.
- [x]  У всех кнопок присутствует состояние нажатия (press state). Изменение цвета делаем на свое усмотрение;
- [x]  Элементы «Отправить заявку» и «Хочешь к нам?» должны быть прибиты к низу экрана и не должны скроллиться;
- [x]  По нажатию на элемент в карусели его состояние меняется на выбранное, по повторному нажатию возвращается в обычное состояние;
- [x]  По нажатию на элемент в карусели он анимировано переходит на первую позицию;
- [x]  Скроллить можно только контент, картинка при этом статична. Контент может скроллится вплоть до статус бара;
- [x]  В дополнительной карусели добавить возможность скроллить контент, если на экран не поместились все элементы, которые в нее добавлены. Количество рядов должно остаться так же равным двум. Скроллится должны сразу оба ряда, а не по отдельности.

## Выбор инструментов

**Архитектура:** Учитывая задачу, не стал использовать Clean архитектуру, так как отсутствие воркеров, дополнительных экранов для роутинга и отсутствие взаимодействий сделали бы неоправданным существование интерактора и презентера, пришлось бы запускать по кругу пустой ВИП цикл.
В целом, VIP архитектура мне нравится(есть написанный проект на ней), но в данных условиях это не принесло бы ощутимых результатов в области тестируемости(нет тестов), расширяемости или читабельности проекта. Вместо этого сделал на простом MVC, которого, как я посчитал, для задач вполне достаточно. Контроллеры не перегружены, т.к. основной объем кода это настройка коллекции, которая вынесена в отдельном файле в экстеншн.

**SheetPresentationController:** по заданию мы не были ограничены версией деплоймента, поэтому решил использовать относительно современный инструмент, который позволяет быстро повторить необходимое поведение экрана(отменил возможность закрытия контроллера по свайпу, добавил кастомные "дитенты" для повторения макета). Для более ранних версий использовал бы помещение дочерней вью в контейнер.

**Collection:** для отображения данных контроллера воспользовался обычной коллекцией с  CompositionalLayout, который позволил сверстать все не перегружая интерфейс отдельными стэками и скроллвью.
