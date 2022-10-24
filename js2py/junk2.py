import js2py
import numpy
CryptoJS = js2py.require('crypto-js')
data = [{'id': 1}, {'id': 2}]
JSON = js2py.eval_js('JSON')
ciphertext = CryptoJS.AES.encrypt(JSON.stringify(data), 'secret key 123')
bytes  = CryptoJS.AES.decrypt(ciphertext.toString(), 'secret key 123')
decryptedData = JSON.parse(bytes.toString(CryptoJS.enc.Utf8)).to_list()
print (decryptedData)
