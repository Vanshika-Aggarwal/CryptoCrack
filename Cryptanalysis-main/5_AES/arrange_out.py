fi = open("Data/clean_out.txt", "r")
fo = open("Data/arrange_out.txt","w")

content = fi.readlines()

for i in range(0,1024):
    fo.write(content[i][2:].strip('\n'))
    fo.write(" ".strip('\n'))
    if((1+i)%128==0):
        fo.write('\n')
fo.close()
fi.close()
