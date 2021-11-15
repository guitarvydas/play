"hello" -> print $1

// value -> command(incoming value)    
// for now value is always a string
// for now incoming value is always the id '<1'
// for now, send always goes to /dev/fd/5
// for now, receive always comes from /dev/fd/6
// for now, /dev/fd/3 and /dev/fd/4 are reserved for kernel usage
// for now, we ignore /dev/fd/0, /dev/fd/1 and /dev/fd/2

// the above program generates 1 shell script and uses 2 bash commands (echo and cat)
hello -> display

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