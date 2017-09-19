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
