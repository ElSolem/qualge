# This will run fine in Google Colab
# VScode will not run because of name error

if x * y == x / y:
    s = 'x = 0\ny = 0\nif x * y == x / y:\n    s = {!r}\n    print(s.format(s))'
    print(s.format(s))
