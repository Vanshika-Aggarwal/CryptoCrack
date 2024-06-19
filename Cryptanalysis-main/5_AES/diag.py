from library import *

password = "gskfgngfktfuglilhlhsisfhjnmihjff"
left = password[:16]
right = password[16:]

def DecryptPassword(password):
    passw = block_to_byte(password)
    op = ""
    for ind in range(8):
        for ans in range(128):
            inp = op + byte_str(ans)+(16-len(op)-2)*'f'
            if ord(passw[ind]) == EAEAE(block_to_byte(inp), LINEAR_MATRIX, EXPONENT_MATRIX)[ind]:
                op += byte_str(ans)
                break
    return op

final_pass = block_to_byte(DecryptPassword(left))+block_to_byte(DecryptPassword(right))
while final_pass[len(final_pass)-1] is '0':
    final_pass = final_pass.strip('0')

print("Final Password : " + str(final_pass))
