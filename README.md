## Models
# User

```
bin/rails generate model User login:string password:string email:string created_at:datetime active:boolean
```

### Role
```
bin/rails generate model Role role:string description:string
rails generate model user_role user:references role:references
```

Added relation between them and...
```
rake db:migrate
```
### Adding controller
With create:
```
rails generate controller role
```

### Scaffold a controller from existing model
```
rails generate scaffold_controller role
```
Then, do not forget to add the resources: or the routes in the config/routes.rb file

**BE CAREFULL**
In the routes.rb, it is NOT the same
resource :roles
and
resources :roles
The generated routes are different!
```
rake routes
```

Rollback:
```
rails destroy controller role
```

### Changinh models

```
rails g migration AddPasswordDigestToUserOfModels password_digest:string
```

y luego
```
rake db:migrate
```

https://gist.github.com/pyk/8569812

### Migrating users from plain to bcrypt
```
user.password = 'password'
user.password_confirmation = 'password'
user.save
```

And now try:
````
user.authenticate('password')
```

