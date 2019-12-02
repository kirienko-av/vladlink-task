## Пример команды для запуска приложения: ##
```mvnw spring-boot:run -Dspring-boot.run.arguments="--database.host=localhost,--database.port=5432,--database.username=postgres,--database.password= ,--database.schema=postgres"```

Схема базы данных инициализируется при первом запуске приложения. DDL можно посмотреть по пути [src\main\resources\db\migration\V0.0.1__Initialize.sql](https://github.com/kirienko-av/vladlink-task/blob/master/src/main/resources/db/migration/V0.0.1__Initialize.sql) 

Страница с меню доступна по url localhost:8080

## Пример команды импорта данных:
```psql -h localhost -U postgres -d postgres -a -f \scripts\import.sql -v file='categories.json'```

## Пример команды экспорта данных:
```psql -h localhost -U postgres -d postgres -a -f scripts\export_a.sql -v file='type_a.txt' -v type='type_a'```

Параметр *type* принимает значения type_a, type_b

Скрипты находятся в директории
[scripts](https://github.com/kirienko-av/vladlink-task/tree/master/scripts) 