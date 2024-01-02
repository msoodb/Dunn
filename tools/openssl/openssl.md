[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

# openssl
[openssl] is a robust, commercial-grade, full-featured toolkit for general-purpose cryptography and secure communication. 

<hr/>

```sh
dnf install openssl
```

> the general syntax of a command is 
```sh
openssl command [command_options] [command_arguments]
```

```sh
openssl version
openssl version -a
openssl help
openssl ciphers -v
openssl speed
```

<hr/>

## encoding

- ASCII Table 8 bit

| character | Code |
| ------ | ------ |
| a | 01100001 |
| t | 01110100 |
| c | 01100011 |
| k | 01101011 |

attack -> 011000010111010001110100011000010110001101101011


- Base64 Table 6 bit

| character | Code |
| ------ | ------ |
| Y | 011000 |
| X | 010111 |
| R | 010001 |
| 0 | 110100 |
| W | 010110 |
| N | 001101 |
| r | 101011 |

011000010111010001110100011000010110001101101011 -> YXR0YWNr

```sh
echo -n "attack" | openssl base64
echo YXR0YWNr | openssl base64 -d
```

<hr/>

## hash functions

```sh
openssl dgst <hash>
```

```sh
echo -n 'hello' | openssl dgst -md5
echo -n 'hello' | openssl dgst -sha1
echo -n 'hello' | openssl dgst -sha224
echo -n 'hello' | openssl dgst -sha256
echo -n 'hello' | openssl dgst -sha384
echo -n 'hello' | openssl dgst -sha3-224
echo -n 'hello' | openssl dgst -sha3-256
echo -n 'hello' | openssl dgst -sha3-384
echo -n 'hello' | openssl dgst -sha3-512
```

| input | CHF | Type | digest(Hex) |
| ----- | ------------- |----- |------ |
| hello | md5 | MD5 | 5d41402abc4b2a76b9719d911017c592 |
| hello | sha1 | SHA1 | aaf4c61ddcc5e8a2dabede0f3b482cd9aea9434d |
| hello | sha224 | SHA2 | ea09ae9cc6768c50fcee903ed054556e5bfc8347907f12598aa24193 |
| hello | sha256 | SHA2 | 2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824 |
| hello | sha384 | SHA2 | 59e1748777448c69de6b800d7a33bbfb9ff1b463e44354c3553bcdb9c666fa90125a3c79f90397bdf5f6a13de828684f |
| hello | sha512 | SHA2 | 9b71d224bd62f3785d96d46ad3ea3d73319bfbc2890caadae2dff72519673ca72323c3d99ba5c11d7c7acc6e14b8c5da0c4663475c2e5c3adef46f73bcdec043 |
| hello | sha3-224 | SHA3 | b87f88c72702fff1748e58b87e9141a42c0dbedc29a78cb0d4a5cd81 |
| hello | sha3-256 | SHA3 | 3338be694f50c5f338814986cdf0686453a888b84f424d792af4b9202398f392 |
| hello | sha3-384 | SHA3 | 720aea11019ef06440fbf05d87aa24680a2153df3907b23631e7177ce620fa1330ff07c0fddee54699a4c3ee0ee9d887 |
| hello | sha3-512 | SHA3 | 75d527c368f2efe848ecf6b073a36767800805e9eef2b1857d5f984f036eb6df891d75f72d9b154518c1cd58835286d1da9a38deba3de98b5a53e5ed78a84976 |


<hr/>

## How encryption works

<br/>

- plaintext
```
OJanuary 6, 2010
FROM: Maj. Francis Hart, 19th Infantry Division
SUBJECT: Letter of recommendation for Capt Kapaun, 19th Infantry Division

1. This letter is to support the consideration upgrade of the Distinguished Service Cross
awarded to Captain Jigar Kapaun to a posthumous award of the Medal of Honor.

2. I had the honor of serving alongside Captain Kapaun  for 5 years. Our  last deployment
was in Afghanistan where we set up a Security Partnering Team. During one of the scouting
missions, Captain Kapaun and his tactical teamwere suppressed by heavyfire. A grenade was
thrown into the building where the team had taken cover. Capin Kapaun, in act of fearless
heroism, dove  on the grenade before detonation. This action saved the lives of 4 men and
protected multiple others from severe injuries.

3. Captain Kapaun was awarded the Distinguished Service Cross but believe is act of valor
should be recognized with the highest decoration; the Medal of Honor. I amm sure you, too
will appreciate his act of courage and bravery and take this request into consideration.

Sincerely,
Maj. Francis Hart
```

- cipher
```
symmetric aes-256-cbc
```

- 256 bit Key
```
56C615BCE9AD5F6B2B1B30E599B32DA0CEFE21D7D618C89C10D311595A437458
```
<hr/>

- plaintext in binary
```
010011110110001101110100011011110110001001100101011100100010000000110010001101000010110000
100000001100100011000000110001001101010000101001001101010001010100110101001111010100100100
000101001110010001000101010101001101001000000100011001001111010100100011101000100000010011
010110000101101010001011100010000001000111001011100010000001010011011000110110111101110100
011101000010000001010110011000010110111001100100011001010111001000100000010010000110000101
101101011011010010110000100000010000010110100101110010001000000100011001101111011100100110
001101100101000010100100011001010010010011110100110100111010001000000100001101110000101110
000011101000010111000100000010001110111010101101001011011110110111000100000010100000111001
001100101011100110111010001101111011011100010110000100000010000010110100101110010011001100
110100101100101011011000110010000100000010011110111000001100101011100100110000101110100011
010010110111101101110011100110000101001010011010101010100001001001010010001010100001101010
100001110100010000001001100011001010111010001110100011001010111001000100000011011110110011
000100000011100100110010101100011011011110110110101111010110010101101110011001000110000101
110100011010010110111101101110001000000110011001101111011100100010000000110010011001000010
000001001100011101000010000001001011011110010110110001100101001000000101001101110101011101
0001101000011001010111001001110011............
```

- 256 bit binary Key
```
010101101100011000010101101111001110100110101101010111110110101100101011000110110011000011
100101100110011011001100101101101000001100111011111110001000011101011111010110000110001100
1000100111000001000011010011000100010101100101011010010000110111010001011000
```

- aes algorithm block size is always 128 bits
```
ciphertext block = aes-256-cbc(128 bit binary, 256 bit key)
```

- ciphertext in binary
```
0100110001110100001011100010000001010011011101010111010001101000011001010111001001110011001
0000001101001011100110010000001100001001000000111011001100101011100100111100100100000011000
1101100001011100000110000101100010011011000110010100101100001000000110100101101110011101000
1100101011011000110110001101001011001110110010101101110011101000010110000100000011000010110
1110011001000010000001100100011100100110100101110110011001010110111000100000011010010110111
0011001000110100101110110011010010110010001110101011000010110110000101110001000000101001101
1101000110000101101110011001000110100101101110011001110010000001100001001000000110001101110
1010111010000100000011000010110001001101111011101100110010100100000011010000110100101110011
0010000001110000011001010110010101110010011100110010110000100000011010000110010100100000011
0010101111000011010000110100101100010011010010111010001110011001000000111010101101110011011
0001101001011011010110100101110100011001010110010000100000011100000110111101110100011001010
1101110011101000110100101100001011011000010111000100000010010000110010100100000011010010111
0011001000000110010001100101011001000110100101100011011000010111010001100101011001000010110
0001000000110011001101111011000110111010101110011011001010110010000101100001000000111001101
1001010110110001100110001011010110010001101001011100110110001101101001011100000110110001101
0010110111001100101011001000010000001100001011011100110010000100000011100110110100001101111
0111011101110011001000000111001001100101011011010110000101110010011010110110000101100010011
011000110010100100000011011000110010101100001011001000110010101110010011............
```

- ciphertext in base64
```
U2FsdGVkX18rCZ3aYGJTLEPxeQ1UL27JgiSMEQxFJWBojjpEXL3k0rUtTVsWFxcp
oJc0LwT8zvj9kTICPVXInqG+DNvT5J7GAfVXVa8Vc6cY03SXedLNhGXMwsk//aLt
AystnAIY34Qq7SgdLd83v13IkRUiSgIwW75uRLAZBYuyCO8FYHDPSNHY1Nb3K8o7
OfFijJWuT9qWk1L1iVp+uR6e3Tsxg+8HTmEq6XM8eG1MleR1n3LoZ8bQJC70cJfH
giOroPPwfWKLMMJJPpUZDgp1IoKjGs7tptjm4N6K1JxzuwzNE1Hb+MltNi3+UziC
Lk7Nf23u9+3EpfJ1BTbvyQ6+lQF+7dmwwPgtWY5+H0rdzVZqgTEjoeTZNF6JKkXA
vPJAD84XNHqti+gccu07Vy0arBLUTSDG8S48u67dv4XleLT0K6x4LxJRhEEqOwYC
1dwG9nuaAWQqdMzyjdV3gX204gLzi0KfbULqKA4s3CjL/HICg5tdGFXjypgp5s8B
8Pe98RCKcy86NgsO/Xq4jB847WDrJlcNeRR/NLidYwS9+pAE6yofL1JNEFF0NiVY
e9yhJGspCqNWvgx1zvOMX5RxPj0ryHhkJXwvipg90fYsbbIaWnqXFPQ4jitg0Ji+
5kIRSdYEQ/xBQDiMNMyNo9cVoJAP+xdqL5iBk9SjgrOL/uyIxNzFku1qAZ/lbg9B
Au67F2AG/ES3L6nEKzD9meRXJGmX9e36ZDi8O8A1gxL2j2RdiHTtr1skUaP3tTr0
su0j09TgaNPJMBqWyF7e+pLvroOjMBG/ODmX3JXleY4ClwJ+7MjJbj62f......
```

<hr/>


## Symmetric vs Asymmetric

if encryption and decryption both use the same key cipher is Symmetric, otherwise it is Asymmetric.

- Symmetric uses for stream encryption.
- Asymmetric uses for encrypt secret key.

<br/>

## Symmetric

- Alice and Bob agree on secret key
- Alice encrypt plaintext with key and sent to Bob
- Bob decrypt plaintext with key


```
         Encrypt(plaintext, key) --> ciphertext         Decrypt(ciphertext, key) --> plaintext
   Alice --------------------------------------------------------------------------------------> Bob
                                                 |
                                                 |
                                                 | Decrypt(ciphertext, ???) --> xxxxxx
                                                 |
                                                 |
                                                Eve
```


<br/>

## Asymmetric

- Bob create pair of keys, {public key, private key}
- Bob send public key to Alice
- Alice encrypt plaintext with Bob public key and sent it to Bob
- Bob decrypt plaintext with private key

```
         Encrypt(plaintext, Bob's public key) --> ciphertext    Decrypt(ciphertext, private key) --> plaintext
   Alice ---------------------------------------------------------------------------------------------------> Bob
                                                         |                                {public key, private key}
                                                         |
                                                         | Bob's private key = ???
                                                         | ciphertext = xxxxxx
                                                         |
                                                         |
                                                        Eve
```

<hr/>


## Cipher

- Bob create pair of keys, {public key, private key}
- Bob send public key to Alice
- Alice create key, encrypt it with Bob public key and sent it to Bob
- Bob decrypt key.enc and have key
- Alice and Bob have key
- Alice encrypt plaintext with key and sent to Bob
- Bob decrypt plaintext with key


```
         Encrypt(key, Bob's public key) --> key.enc             Decrypt(key.enc, private key) --> key
         Encrypt(plaintext, key) --> ciphertext                 Decrypt(ciphertext, key) --> plaintext
   Alice ---------------------------------------------------------------------------------------------------> Bob
                                                         |                                {public key, private key}
                                                         |
                                                         | Bob's private key = ???
                                                         | key = ???
                                                         |
                                                         |
                                                        Eve
```

<hr/>

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. 
There is no need to format nicely because it shouldn't be seen.)
   [openssl]: <https://www.openssl.org/>


