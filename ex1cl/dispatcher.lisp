(defun dispatcher (connection-list)
  (forever
   (transfer-outputs-to-inputs connection-list)
   (let ((receiver (find-ready-receiver connection-list)))
     (invoke-receiver-once receiver))))

	 
(defclass connection ()
  ((sender :accessor sender)
   (receiver :accessor receiver)
   (sender-fifo :accessor sender-fifo)
   (receiver-fifo :accessor receiver-fifo)))

(defclass asc ()
  ((initializer-function :accessor initialier-function)
   (react-function :accessor react-function)))

(defclass asc-leaf (asc)
  )

(defclass asc-container (asc)
  ((children :accessor children)
   (connections :accessor connections)))

(defmethod busy ((self asc-leaf))
  nil)

(defmethod busy ((self asc-container))
  
   
