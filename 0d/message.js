function Message (port, data, from, previousMessage) {
    this.port = port;
    this.data = data;
    this.trace = [from, previousMessage];
}

exports.Message = Message;
