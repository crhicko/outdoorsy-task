def help
    puts "Args must be passed correctly:
    app.rb -f [file] --d [delimiting character]
    EX: app.rb -f pipes.txt \"|\" -s vtype

    Search is optional:
    -s [field]

    You may pass multiple files:
    app.rb -f [file] [delimiting character] -f [file] [delimiting character] -s [field]

    delimiter: a delimiting character, if your character is reserved by the shell, wrap it in quotes such as \"|\"
    -f: a file, you must add a delimiter after this field
    -s: the field you would like to sort on
        - vtype = vehicle type
        - name = full name
    "
    exit
end