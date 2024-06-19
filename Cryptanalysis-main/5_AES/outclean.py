fo = open("Data/clean_out.txt", "w")
fi = open("Data/output.log")

content = fi.readlines()

c=134
for i in range(0,1024):
    fo.write(content[c])
    c+=17
fo.close()
fi.close()
