# Run at : https://sagecell.sagemath.org/

# References : https://system.math.arizona.edu/~ura-reports/022/McCallum_group/DyerFinal.pdf

# Code of coppersmith_howgrave_univariate function is taken from open source https://github.com/mimoo/RSA-and-LLL-attacks/#coppersmith

def coppersmith_howgrave_univariate(pol, modulus, beta, mm, tt, XX):
    """
    Coppersmith revisited by Howgrave-Graham
    
    finds a solution if:
    * b|modulus, b >= modulus^beta , 0 < beta <= 1
    * |x| < XX
    """
    #
    # init
    #
    dd = pol.degree()
    nn = dd * mm + tt

    #
    # checks
    #
    if not 0 < beta <= 1:
        raise ValueError("beta should belongs in (0, 1]")

    if not pol.is_monic():
        raise ArithmeticError("Polynomial must be monic.")

    #
    # calculate bounds and display them
    #
    """
    * we want to find g(x) such that ||g(xX)|| <= b^m / sqrt(n)
    * we know LLL will give us a short vector v such that:
    ||v|| <= 2^((n - 1)/4) * det(L)^(1/n)
    * we will use that vector as a coefficient vector for our g(x)
    
    * so we want to satisfy:
    2^((n - 1)/4) * det(L)^(1/n) < N^(beta*m) / sqrt(n)
    
    so we can obtain ||v|| < N^(beta*m) / sqrt(n) <= b^m / sqrt(n)
    (it's important to use N because we might not know b)
    """
    
    #
    # Coppersmith revisited algo for univariate
    #

    # change ring of pol and x
    polZ = pol.change_ring(ZZ)
    x = polZ.parent().gen()

    # compute polynomials
    gg = []
    for ii in range(mm):
        for jj in range(dd):
            gg.append((x * XX)**jj * modulus**(mm - ii) * polZ(x * XX)**ii)
    for ii in range(tt):
        gg.append((x * XX)**ii * polZ(x * XX)**mm)
    
    # construct lattice B
    BB = Matrix(ZZ, nn)

    for ii in range(nn):
        for jj in range(ii+1):
            BB[ii, jj] = gg[ii][jj]

    # display basis matrix

    # LLL
    BB = BB.LLL()

    # transform shortest vector in polynomial    
    new_pol = 0
    for ii in range(nn):
        new_pol += x**ii * BB[0, ii] / XX**ii

    # factor polynomial
    potential_roots = new_pol.roots()
    print("potential roots:", potential_roots)

    # test roots
    roots = []
    for root in potential_roots:
        if root[0].is_integer():
            result = polZ(ZZ(root[0]))
            if gcd(modulus, result) >= modulus^beta:
                roots.append(ZZ(root[0]))

    # 
    return roots

def bin_to_str(input):
    p = ''
    password = ''
    t = 0
    for i in input:
        if t==8:
            print(int(p,2))
            password = password + chr(int(p,2))
            t=0
            p = ''
        else:
            p+=i
            t = t+1
    return password
e = 5
N = 84364443735725034864402554533826279174703893439763343343863260342756678609216895093779263028809246505955647572176682669445270008816481771701417554768871285020442403001649254405058303439906229201909599348669565697534331652019516409514800265887388539283381053937433496994442146419682027649079704982600857517093
C = 13656884958666083182287808731969385886738736795624575636841623299978262764027047461404480275695829443154847026620869027439469607766593454706733987552040135466169982466107246971957635623612899211979546251162377494052524749926374780546222822640485678056006161020398677946261046350112161284988110669513081416698

# RSA known parameters
ZmodN = Zmod(N);

def str_to_bin(input):
    p = ''
    for i in input:
        p+=str(format(ord(i),"b").zfill(8))
    return p 

def break_RSA(p_str, max_length_M):
    global e, C, ZmodN

    p_binary_str = str_to_bin(p_str)
    print("Binary String : ", p_binary_str)

    for length_M in range(0, max_length_M+1, 4):          # size of the root

        # Problem to equation (default)
        P.<M> = PolynomialRing(ZmodN) #, implementation='NTL')
        pol = ((int(p_binary_str, 2)<<length_M) + M)^e - C
        dd = pol.degree()

        # Tweak those
        beta = 1                                
        epsilon = beta / 7                      
        mm = ceil(beta**2 / (dd * epsilon))     
        tt = floor(dd * mm * ((1/beta) - 1))    
        XX = ceil(N**((beta**2/dd) - epsilon))  

        roots = coppersmith_howgrave_univariate(pol, N, beta, mm, tt, XX)

        if len(roots) != 0:
            password = bin(roots[0]).replace("0b","")
            print("Root :", password)
    #010000001000011001110000101100101010000001101110110111101001100011011110011011001011001
            return password
    
    print("No Potential Root Found")
    return 

#if __name__ == "__main__":
#    break_RSA("Cryptbits: This door has RSA encryption with exponent 5 and the password is", 300)
if __name__ == "__main__":
    roots = break_RSA("Cryptbits: This door has RSA encryption with exponent 5 and the password is", 300)
    
    roots = str(roots)
    # Padding the root so that it can be parsed back to ascii
    while len(roots)%8:
        roots = '0' + roots
    
    print('After Padding :', roots) 
    
    binary_int = int(roots, 2);
  
    # Getting the byte number
    byte_number = binary_int.bit_length() + 7 // 8
  
    # Getting an array of bytes
    binary_array = binary_int.to_bytes(byte_number, "big")
  
    # Converting the array into ASCII text
    ascii_text = binary_array.decode()
    
    print(f'Password :', ascii_text[-10:])
       