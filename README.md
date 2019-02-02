# xavy

El objetivo de este proyecto es realizar una prueba técnica en una aplicación web
Ruby on Rails con una arquitectura similar a la de <https://savy.co>.

Para empezar a trabajar el ejercicio haz un fork de este repositorio en tu cuenta de github como se indica en este [link](https://help.github.com/articles/fork-a-repo/#fork-an-example-repository)

## Preparación del ambiente de desarrollo

Si ya tienes configurado un ambiente de desarrollo de Ruby on Rails puedes saltarte este paso,de lo contrario puedes elegir entre realizar el desarroll en un ambiente Cloud, o instalar localmente las dependencias del proyecto.

### Opción 1: Cloud IDE

Para comenzar a trabajar en el ejercicio sin realizar la instalación local del ambiente de Ruby on Rails, se recomienda usar [Cloud 9 IDE](https://c9.io).

Una vez hayas hecho el fork del proyecto en tu github, podrás entrar a Cloud 9 y sincronizar el respositorio con el ambiente de desarrollo virtual.

### Opción 2: Instalación local

#### Linux

Seguir las instrucciones de este link (https://gorails.com/setup/ubuntu/18.10)

#### Mac OS

Seguir las instrucciones de este link (https://gorails.com/setup/osx/10.13-high-sierra)

#### Windows

1. Instalar ruby 2.6.1 con DevKit: [windows](https://rubyinstaller.org/)
2. Desde la consola de comandos en modo administrador instalar bundler:

   `gem install bundler`

3. Desde la consola de comandos en modo administrador instalar bundler:

   `gem install rails 5.2.2`

4. Instalar SQLLite3 siguiendo estas indicaciones (https://www.tutorialspoint.com/sqlite/sqlite_installation.htm)

## Proyecto

El proyecto de pruebas se entrega en estado funcional, con datos iniciales y con sus respectivas pruebas unitarias, de integración y de sistema.

Para iniciar el proyecto se deben seguir los siguientes pasos:

1. Descargar el código
   `git clone https://github.com/usuario-github/xavy.git`

2. Instalar las librerias del proyecto `bundle install`

3. Ejecutar el comando `bundle exec rails app:update:bin`

3. Crear la base de datos `bundle exec rails db:create`

4. Ejecutar las migraciones `bundle exec rails db:migrate`

5. Cargar los datos de prueba `bundle exec rails db:seed`

6. Ejecutar la aplicación `bundle exec rails server`

7. Entrar a http://localhost:3000 para ver la aplicación

8. Entrar a http://localhost:3000/admin para ver el panel de administrador

Comandos adicionales:

9. Ejecutar las pruebas unitarias `rails test`

10. Abrir la consola de rails (permite ejecutar comandos usando las clases definidas dentro del proyecto) `rails console`

PD: Antes de ejecutar las pruebas unitarias se debe crear/actualizar la base de datos de pruebas

`rails db:create RAILS_ENV=test`
`rails db:migrate RAILS_ENV=test`

Nota respecto a la base de datos: El proyecto está configurado para usar la base de datos sqlite3 ya que es la base de datos que requiere menos configuración. Si prefieres trabajar con alguna de las otras bases de datos disponibles en Rails, recuerda cambiar el archivo `config/database.yml` y actualizar el `Gemfile` para usar la librería correcta:

Ejemplo: Gemfile

```
# Reemplazar sqlite3 por pg
gem 'pg'
#gem 'sqlite3', git: "https://github.com/larskanis/sqlite3-ruby", branch: "add-gemspec"
```

Ejemplo: database.yml usando postgresql.

```
# config/database.yml

default: &default
  adapter: postgresql
  encoding: unicode

  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

development:
  <<: *default
  database: savy_development
  # The specified database role being used to connect to postgres.
  # To create additional roles in postgres see `$ createuser --help`.
  # When left blank, postgres will use the default role. This is
  # the same name as the operating system user that initialized the database.
  #username: savy
  # The password associated with the postgres role (username).
  #password:

test:
  <<: *default
  database: savy_test

production:
  <<: *default
  database: savy_production
  username: deploy
  password: <%= ENV['SAVY_DATABASE_PASSWORD'] %>
```

## Ejercicio

### Enunciado

Xavy.com es un directorio de centros de Fitness and Wellness. La aplicación está estructurada en dos partes. Una parte pública donde de pueden consultar los distintos centros con sus respectivas actividades y una parte para que los administradores de la aplicación puedan actualizar la información de los centros.

Por petición de nuestros usuarios, se quiere permitir que los centros deportivos puedan seleccionar entre las dificultadoes (bajo, medio, alto para cada) de las actividades. Igualmente los usuarios deben poder consultar la dificultad de cada actividad desde el directorio.

Igualmente se quiere poder "taggear" las distintas actividades con una o más categorías para que los usuarios puedan poner en contexto los nombres de las distintas actividades que ofrecen loscentros. Estas categorías se deben crear a través de la interfaz del administrador y se deben poder asignar a las actividades.

### Recomendaciones

El desarrollo de los requerimientos es libre. No hay marcas de #TODO, ni sitos específicos donde se debe escribir el código. Cada persona está en libertad de desarrollar la solución que le parezca apropiada. Lo importante es la justificación.
Si se considera necesario se permite agregar librerías tanto en ruby como en javascript para completar el ejercicio.

### Entrega

El código del ejercicio se debe sincronizar con la copia personal del proyecto en github y enviar el link a sistemas(at)savy.co.

Opcionalmente se puede hacer un despliegue (gratuito) a [heroku](https://www.heroku.com/) e inlcuir la URL del proyecto par que sea más fácil revisarlo.

### Demo

Una versión demo de la aplicación se puede encontrar en https://xavy.herokuapp.com/
