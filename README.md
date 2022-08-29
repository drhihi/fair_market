# fair-market :department_store: 

---

### add database user and password to credentials
open credentials
```bash
EDITOR=vim bin/rails credentials:edit
```
and add template lines
```
database:
  username: user
  password: pswd
```

### actions before the first run
```bash
bin/bundle
bin/rails db:create
bin/rails db:migrate
```

### run server
```bush
bin/rails s
```

### add fakes data (only development)
```bash
bin/rails db:seed
```