const connections1grammar = String.raw`
Connections {
  Connections = Connection+
  Connection = "{" Sender Receiver "}"
  Sender = "sender" ":" "{" ComponentName "," PortName "}"
  Receiver = "receiver" ":" "{" ComponentName "," PortName "}"

  ComponentName = string
  PortName = string

  string = dq (~dq any)* dq
  dq = "\""
}
`;

const connections1fmt = String.raw`
Connections {
  Connections [Connections+] = ‛⟨Connections⟩’
  Connection [lb Sender Receiver rb] = ‛⟨lb⟩⟨Sender⟩⟨Receiver⟩⟨rb⟩’
  Sender [ksender kcolon lb ComponentName kcomma PortName rb] = ‛⟨ksender⟩⟨kcolon⟩⟨lb⟩⟨ComponentName⟩⟨kcomma⟩⟨PortName⟩⟨rb⟩’
  Receiver [kreceiver kcolon lb ComponentName kcomma PortName rb] = ‛⟨kreceiver⟩⟨kcolon⟩⟨lb⟩⟨ComponentName⟩⟨kcomma⟩⟨PortName⟩⟨rb⟩’

  ComponentName [s] = ‛⟨s⟩’
  PortName [s] = ‛⟨s⟩’

  string [q1 cs* q2] = ‛⟨q1⟩⟨cs⟩⟨q2⟩’
  dq [q] = ‛⟨q⟩’
}
`;
