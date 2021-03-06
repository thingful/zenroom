print '= ECDH TESTS'
octet = require'octet'

secret = [[
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
]]

secoctet = octet.new(#secret)
secoctet:string(secret)
ecdh = require'ecdh'
ed25519 = ecdh.new()
pk,sk = ed25519:keygen()
print  'test both ways of obtaining keys'
print 'public:'
print(pk:hex())
print(ed25519:public():hex())
assert(ed25519:checkpub(pk))
assert(ed25519:checkpub(ed25519:public()))
print 'secret:'
print(sk:hex())
print(ed25519:private():hex())
assert(sk:hex() == ed25519:private():hex())

ses = ed25519:session(pk,sk)
print 'session:'
print(ses:hex())

ciphermsg = ed25519:encrypt(ses,secoctet)

print 'secret:'
print(secoctet:string())

print 'cipher message:'
print(#ciphermsg)

decipher = ed25519:decrypt(ses,ciphermsg)

print 'decipher message:'
print(decipher:string())
print(#decipher)
