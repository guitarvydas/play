from pipelineable import PipeLineAble

class Cat (PipeLineAble):
    def __init__ (self):
        super ().__init__ ()

    def run (self, s):
        self.send (xfrom=self, portname='stdout', data=s, causingMessage=None)


test = Cat ()
test.run ('hello world')
print (test.outputs ())

