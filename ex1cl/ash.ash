class connection {
  sender : asc
  receiver : asc
  sender-fifo : [message]
  receiver-fifo : [message]
}
  
class asc {
  initializer : function ()
  react : function (message)
}

class asc-leaf inherits asc {
}

class asc-container inherits asc {
  children : [asc]
  connections : [connection]
}

object dispatcher
  function dispatch (self : dispatcher top : asc-container)
    with top
      while ?some-asc-ready
        @transfer-sender-outputs-to-receivers
        with asc = @find-ready-asc
          let message = @pull-message-from-fifo
            @invoke-once-with-message (message)
          end let
        end with
      end while
    end with
  end function
end object

function send of asc (messge)
  
end function