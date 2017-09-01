## Models
# User

```
bin/rails generate model User login:string password:string email:string created_at:datetime active:boolean
```

### Role
```
bin/rails generate model Role role:string description:string
```

Added relation between them and...
```
rake db:migrate
```