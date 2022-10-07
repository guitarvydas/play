from senderqueue import SenderQueue

class PipeLineAble (SenderQueue):
    def outputs (self):
        return self.outputsFIFODictionary ()
