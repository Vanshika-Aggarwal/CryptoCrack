# Playfair Cipher
We have used Playfair Cipher in this Question for decryption which is a digraph Cipher. The Playfair cipher has a key also. For instance, in our case, the key was,”CRYPTANALYSIS” .One of the major tasks in this cipher is the generation of the key square using the key which is described as follows:
- The ‘key square’ is a 5×5 grid consisting of alphabets. 
- All 25 letters of the ‘Key Square’ shall be unique. 
- Since the grid can accommodate only 25 characters, there is no ‘J’ in this table. Any ‘J’ in the ciphertext is replaced by ‘I’.
- Characters or punctuation that are not present in the key square shall get removed (for simplicity while coding). Instead, spell out the numbers, punctuations, and any other non-alphabetic text.

## Key
The key square starts with the key’s unique alphabet in the order of appearance, followed by the alphabet’s remaining characters in order.For instance, since our key was “CRYPTANALYSIS”, the rows of the key square shall be as follows:
       [['C', 'R', 'Y', 'P', 'T'],
       ['A', 'N', 'L', 'S', 'I'],
       ['B', 'D', 'E', 'F', 'G'],
       ['H', 'K', 'M', 'O', 'Q'],
       ['U', 'V', 'W', 'X', 'Z']]

## Decryption
Before decrypting the text, we need to divide the Ciphertext into digraphs i.e. pairs of two letters.

Case I –
Both the letters in the digraph are in the same row of Key Square– Consider the letters left of each alphabet to decrypt the digraph. If one of the digraph letters is the leftmost letter in the grid, consider the rightmost alphabet in the same row.

Case II – 
Both the letters in the digraph are in same column of Key Square– Consider the letters above each alphabet.of the digraph. If one of the digraph letters is the topmost letter in the grid, consider the bottommost alphabet in the same column.

Case III –When neither Case I or II is true –
Imagine a rectangle with the two letters in the digraph and consider the rectangle’s horizontal opposite corners as the decryption of this digraph.

Note- Through our research into Playfair Cipher Technique and then looking at the given ciphertext, we found out that spacing and other non-alphabetical characters were not disturbed. Since the encryption algorithm operates on Diagraphs, we would very often need to separate the Digraph obtained after decryption to accommodate for white spaces, punctuations, etc. afterward. For Instance, consider “XO CQD LFW” as the Ciphertext. Then, in this case, the Digraphs formed would be: { XO, CQ, DL, FW} - Now, once the digraph ‘XO’ get decrypted, to  ‘OF’ , we would be required to put white space between ‘O’ and ‘F’ for this process to generate meaningful sentence.

Final decrypted string : "BE WARY OF THE NEXT CHAMBER, THERE IS VERY LITTLE IOY THERE. SPEAK OUTX THE PASSWORD "ABRA_CA_DABRA" TO GO THROUGH. MAY YOU HAVE THE STRENGTH FOR THE NEXT CHAMBER. TO FIND THE EXIT YOU FIRST WILXL NEXED TO UTTER MAGIC WORDS THERE."