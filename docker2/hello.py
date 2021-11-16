import sys
fname = sys.argv[1]
print("Python reading {}".format (fname))
f = open (fname, "r")
print (f.read ())

