In this level we are working in a multiplicative group <img src="https://render.githubusercontent.com/render/math?math=Z_p^*">. 
Where, <img src="https://render.githubusercontent.com/render/math?math=p=455470209427676832372575348833"> is a prime.

We are given three tuples of the form <img src="https://render.githubusercontent.com/render/math?math=(a, x * g^a)"> where <img src="https://render.githubusercontent.com/render/math?math=g, x"> are element in <img src="https://render.githubusercontent.com/render/math?math=Z_p^*"> and <img src="https://render.githubusercontent.com/render/math?math=a"> is an integer. The <img src="https://render.githubusercontent.com/render/math?math=g"> in each pair is the same.
The * and ^ operators in this group are similar to the general multiplication and exponential operation on the set of Natural Numbers , with the only exception being that after each of these operations, we take a modulus with ‘p’ in this multiplicative Group.
We have used the standard ‘GAP programming Language’ in order to implement the various group theory computation algorithms for this question.
The flow of our algebraic executions are: (All the operations are done in the given prime field)

<img src="https://render.githubusercontent.com/render/math?math=x*g^a = n_1">
<img src="https://render.githubusercontent.com/render/math?math=x*g^b = n_2">
<img src="https://render.githubusercontent.com/render/math?math=x*g^c = n_3">

If we multiply <img src="https://render.githubusercontent.com/render/math?math=n_2"> with inverse of <img src="https://render.githubusercontent.com/render/math?math=n_1"> then the resulting value is :

<img src="https://render.githubusercontent.com/render/math?math={{x*g^b}/{x*g^a}}= g ^ {(b - a)}">

```
n1 := 431955503618234519808008749742;
n2 := 176325509039323911968355873643;
p := 455470209427676832372575348833; 
```

Now we are finding the inverse of <img src="https://render.githubusercontent.com/render/math?math=n_1"> in the given prime field.
```
m := (n1^(-1)) mod p;
70749996790223471732904681640
```

Next we multiply <img src="https://render.githubusercontent.com/render/math?math=n_2"> with the inverse of <img src="https://render.githubusercontent.com/render/math?math=n_1">. <br> 

```
m1 := (m*n2) mod p;
111590994894663139264552154672
```

Next we find the root mod of the above value in the prime field to get the group generator g. Since, <img src="https://render.githubusercontent.com/render/math?math=n_1, n_2">, a, b are known to us, and 1973-429=1544 (Looking at the <img src="https://render.githubusercontent.com/render/math?math=1_{st}"> two pairs <img src="https://render.githubusercontent.com/render/math?math=b-a">)
```
\\Takes up the 1544th root and then modulus with p
g := RootsMod( (m1), 1544, p); 
```

Now the thing here to note is that the expression <img src="https://render.githubusercontent.com/render/math?math=g^{(b-a)} = k"> is an equation of degree <img src="https://render.githubusercontent.com/render/math?math=(b-a)"> where k is known. Hence we get a set of possible values (roots) of g. In the page displayed during the game, value of g was given where most of the digits were missing.

We get the following possibilities for the g:  (Eight different roots to the equation)

>[ 133945148730201378493647924380, 321525060697475453878927424453, 402364054844137762075664439267,53106154583539070296910909566, 123213928148089346335419733953, 332256281279587486037155614880,
52565085417963311027694339, 455417644342258869061547654494 ]

Matching with the information given in the question for value of g “5_ _ _ 50 _ _ 4 _ _ _ _ _ 31_ _ _ _ _ 94 _ _9” we find that,

 <img src="https://render.githubusercontent.com/render/math?math=g = 52565085417963311027694339">

Once ‘g’ is obtained, we multiply <img src="https://render.githubusercontent.com/render/math?math=n_3"> with the inverse of <img src="https://render.githubusercontent.com/render/math?math=g^c"> to get the final password since <img src="https://render.githubusercontent.com/render/math?math=n_3"> is basically  <img src="https://render.githubusercontent.com/render/math?math=Password * g^{7596}"> ,

```
gap> Pass := n3*(52565085417963311027694339 ^ (-7596));
134721542097659029845273957
```

<img src="https://render.githubusercontent.com/render/math?math=Password:134721542097659029845273957 ">

All the computation was done in the GAP programming language. Following is the link to the documentation, usage and installation. 
- https://www.gap-system.org/Releases/4.11.1.html
