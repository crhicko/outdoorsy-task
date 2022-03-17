# outdoorsy-task

Clone and run on the command line
```bash
ruby app.rb -f [file] [delim] -s [field]
```

### Params
#### FILE: -f [file] [delim]
- add your [file] and the delimiter [delim]
- If your delimiter is reserved (such as | ) the wrap it in quotes like "|"
##### You can pass multiple files and it will sort across them all <sup>(I added this for fun)</sup>
```bash
ruby app.rb -f pipes.txt "|" -f commas.txt , -s name
```


#### SORT: -s [field]
Options:
- name: The full name of the user
- vtype: The vehicle type


### Some comments on structure
I decided to store data in a DataRow object that wraps both a User and Vehicle object. This was done for extensibility sake so that in the future things like users with multiple vehicles could be implemented without much rewriting. <sup>Probably overengineering but I was having fun</sup> This will also facilitate easier unit testing of the more complex parts.
