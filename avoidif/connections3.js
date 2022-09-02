const connections3grammar = String.raw`
Connections {
  Connections = Connection+
  Connection = 
    | "{" SelfSender SelfReceiver "}" -- passThrough
    | "{" SelfSender Receiver "}" -- down
    | "{" Sender SelfReceiver "}" -- up
    | "{" Sender Receiver "}" -- route
  SelfSender = "sender" ":" "{" SelfComponentName "," PortName "}"
  Sender = "sender" ":" "{" ComponentName "," PortName "}"
  SelfReceiver = "receiver" ":" "{" SelfComponentName "," PortName "}"
  Receiver = "receiver" ":" "{" ComponentName "," PortName "}"

  SelfComponentName = "self"
  ComponentName = string
  PortName = string

  string = dq (~dq any)* dq
  dq = "\""
}
`;

const connections3fmt = String.raw`
Connections {
  Connections [Connections+] = ‛⟨Connections⟩’
  Connection_route [lb Sender Receiver rb] = ‛\n⟨lb⟩⟨Sender⟩⟨Receiver⟩⟨rb⟩’
  Connection_down [lb Sender Receiver rb] = ‛\n⟨lb⟩⟨Sender⟩⟨Receiver⟩⟨rb⟩’
  Connection_up [lb Sender Receiver rb] = ‛\n⟨lb⟩⟨Sender⟩⟨Receiver⟩⟨rb⟩’
  Connection_passThrough [lb Sender Receiver rb] = ‛\n⟨lb⟩⟨Sender⟩⟨Receiver⟩⟨rb⟩’
  Sender [ksender kcolon lb ComponentName kcomma PortName rb] = ‛⟨ksender⟩⟨kcolon⟩⟨lb⟩⟨ComponentName⟩⟨kcomma⟩⟨PortName⟩⟨rb⟩’
  SelfSender [ksender kcolon lb ComponentName kcomma PortName rb] = ‛⟨ksender⟩⟨kcolon⟩⟨lb⟩⟨ComponentName⟩⟨kcomma⟩⟨PortName⟩⟨rb⟩’
  Receiver [kreceiver kcolon lb ComponentName kcomma PortName rb] = ‛⟨kreceiver⟩⟨kcolon⟩⟨lb⟩⟨ComponentName⟩⟨kcomma⟩⟨PortName⟩⟨rb⟩’
  SelfReceiver [kreceiver kcolon lb ComponentName kcomma PortName rb] = ‛⟨kreceiver⟩⟨kcolon⟩⟨lb⟩⟨ComponentName⟩⟨kcomma⟩⟨PortName⟩⟨rb⟩’

  SelfComponentName [s] = ‛self’
  ComponentName [s] = ‛⟨s⟩’
  PortName [s] = ‛⟨s⟩’

  string [q1 cs* q2] = ‛⟨q1⟩⟨cs⟩⟨q2⟩’
  dq [q] = ‛⟨q⟩’
}
`;
