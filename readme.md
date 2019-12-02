psql -h localhost -U postgres -d postgres -a -f D:\Users\Kirienko.av\Projects\vladlink-task\scripts\import.sql -v file='d:\categories.json'

psql -h localhost -U postgres -d postgres -a -f D:\Users\Kirienko.av\Projects\vladlink-task\scripts\export_a.sql -o d:\type_a.txt

psql -h localhost -U postgres -d postgres -a -f D:\Users\Kirienko.av\Projects\vladlink-task\scripts\export_a.sql -v file='d:\type_b.txt' -v type='type_b'