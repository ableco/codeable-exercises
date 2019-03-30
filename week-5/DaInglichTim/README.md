# Team Da Inglich Tim

- Valeria
- Carlos Sandoval
- Paulo Tijero

## Como usar exportando la base de datos

1. Importar db.sql

```
$ psql my_database < db.sql
```

2. Ejecutar solucionario

```
$ psql my_database < queries/solve_queries.sql
```

## Como usar generando los insert's

1. Crear las tablas

```
$ psql my_database
```

2. Generar los insert's

```
$ ruby main.rb
```

3. Ejecutar los insert's

```
$ psql my_database < queries/customer.sql
$ psql my_database < queries/product.sql
$ psql my_database < queries/transaction.sql
```

4. Ejecutar el solucionario

```
$ psql my_database < queries/solve_queries.sql
```
