from pipelineable import PipeLineAble

class Cat (PipeLineAble):
    def __init__ (self):
        super ().__init__ ()

    def run (self):
        var outmessage = OutputMessage (xfrom=self, portname='stdout', data=message.data, causingMessages=[message, message.trail]):
        self.send (outmessage)


test = Cat ()
message = InputMessage (xfrom=None, portname='stdin', data='hello', causingMessages=[message, [])
test.inject (message)
test.run ()
print (test.outputs ())

