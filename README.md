# Ruby School


## ActiveRectord

Instalacion de Postgres?

crear base de datos y tabla de usuarios con las columnas id, nombre y apellido


```shell
psql postgres
#para entrar a la consola de postgresql

CREATE DATABASE rubyschool;
\c rubyschool

 CREATE TABLE usuarios (
    id SERIAL NOT NULL PRIMARY KEY,
    nombre TEXT NOT NULL DEFAULT '',
    apellido TEXT NOT NULL DEFAULT ''
);
```

Tareas:

## En IRB hacer las siguientes tareas:
recuerda que para iniciar irb solo necesitas teclear `irb` en tu terminal
y no te olvides de cargar los archivos que vas a utilizar con el comando `load <archivo>`

### Crear un nuevo usuario con los datos `nombre` y `apellido`
```ruby
user = Usuario.new
user.nombre    = 'Daniel'
user.apellido  = 'Varela'

```

Revisamos en la base de datos nuestros registros
```sql
select * from usuarios;
```


debe arrojar algo similar a:

```
id | nombre | apellido
----+--------+----------
 2 | Daniel | Varela
(1 row)
```


### Crea otros dos usuarios con nombre Juan y apellidos diferentes usando la función `create`

```ruby
Usuario.create(nombre: 'Juan', apellido: 'Vargas')
Usuario.create(nombre: 'Juan', apellido: 'Hernandez')
```

### Actualicemos el apellido de Juan Hernandez a 'Perez'

#### Primer necesitamos traer nuestro registro de la base de datos usando la función `find`
```ruby
user = Usuario.find(<id>)
```

#### Despues actualizamos usando la función `update`
```ruby
user.update(apellido: 'Perez')
```

### Revisa si tu registro fue grabado con la función `persisted?`

```ruby
user.persisted?

=> true
```

### Busca todos los registros agregados
```ruby
todos = Usuario.all
```

### Ahora solo necesitamos a los usuarios llamados `Juan` y borrar a Juan Vargas, no nos cae bien

primero buscamos a los juanes

```ruby
juanes = Usuario.where(nombre: 'Juan')
```


despues borramos a Juan hernandez seleccionnadolo de la lista 'jaunes'
```ruby
juan_vargas = juanes.first
juan_vargas.destroy

```
