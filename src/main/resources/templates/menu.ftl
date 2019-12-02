<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <link href="/css/menu.css" rel="stylesheet">
</head>
<body>
    <#macro getCategories category>
        <ul>
            <li>${category.name} </li>
            <#list category.childrens as child>
                <@getCategories child />
            </#list>
        </ul>
    </#macro>

    <#list categories as category>
        <@getCategories category />
    </#list>
</body>
</html>